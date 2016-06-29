/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 03.07.13
 * Time: 22:22
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import mx.controls.Alert;

import pl.znr.heatmaster.core.calc.util.CalcUtils;

import pl.znr.heatmaster.core.calc.model.MonthEnergyData;

public class BalanceValueHelper {
    public function BalanceValueHelper() {
    }


    public static function calcBaseBalanceValue(energyData:MonthEnergyData):Number {
        var energyBalance:Number = (CalcUtils.floorZero(energyData.enWalls) + CalcUtils.floorZero(energyData.enRoof) +
                CalcUtils.floorZero(energyData.enFloor) + CalcUtils.floorZero(energyData.enWindows) +
                CalcUtils.floorZero(energyData.enVent) + CalcUtils.floorZero(energyData.enAir) +
                CalcUtils.floorZero(energyData.enFoundations) + CalcUtils.floorZero(energyData.enTightness))
                -
                (CalcUtils.floorZero(energyData.enPersonGain) + CalcUtils.floorZero(energyData.enSolGain) + CalcUtils.floorZero(energyData.enElectricityGain));

        return energyBalance;
    }

    public static function calcBaseNormalizedBalanceValue(energyData:MonthEnergyData):Number {
        return Math.max(calcBaseBalanceValue(energyData),0);
    }

    public static function calcYearBalanceValue(resultData:ProcessingResult):Number {
        var result:Number = 0;
        for(var i:int = 0; i < resultData.monthlyConvertedData.length;i++){
            var monthResult:ConvertedResult = resultData.monthlyConvertedData[i] as ConvertedResult;
            var balanceValue:Number = monthResult.getBalanceValue();
            result += Math.max(0,balanceValue);
        }
        return result;
    }

    public static function calcEfficiencyAwareYearBalanceValue(resultData:ProcessingResult):Number {
        var result:Number = 0;
        for(var i:int = 0; i < resultData.monthlyConvertedData.length;i++){
            var monthResult:ConvertedResult = resultData.monthlyConvertedData[i] as ConvertedResult;
            var balanceValue:Number = monthResult.getEfficiencyAwareBalanceValue();
            result += Math.max(0,balanceValue);
        }
        return result;
    }

    public static function calcEfficiencyAndClassEnergyAwareYearBalanceValue(resultData:ProcessingResult):Number {
        var result:Number = 0;
        for(var i:int = 0; i < resultData.monthlyConvertedData.length;i++){
            var monthResult:ConvertedResult = resultData.monthlyConvertedData[i] as ConvertedResult;
            var balanceValue:Number = Math.max(0,monthResult.getHeatingBalanceWithoutAiring()) + monthResult.getWarmWaterNormalizedBalance() + monthResult.enRecuperator;
            result += Math.max(0,balanceValue + monthResult.heatingSourceLoss + monthResult.enWarmWaterNormalizedHeatingSourceLoss);
        }
        return result;
    }

    public static function calcEfficiencyAwareHeatingYearBalanceValue(resultData:ProcessingResult):Number {
        var result:Number = 0;
        for(var i:int = 0; i < resultData.monthlyConvertedData.length;i++){
            var monthResult:ConvertedResult = resultData.monthlyConvertedData[i] as ConvertedResult;
            var balanceValue:Number = monthResult.getEfficiencyAwareHeatingBalanceValue();
            result += Math.max(0,balanceValue);
        }
        return result;
    }

    public static function calcEfficiencyAwareWarmWaterYearBalanceValue(resultData:ProcessingResult):Number {
        var result:Number = 0;
        for(var i:int = 0; i < resultData.monthlyConvertedData.length;i++){
            var monthResult:ConvertedResult = resultData.monthlyConvertedData[i] as ConvertedResult;
            var balanceValue:Number = monthResult.getEfficiencyAwareWarmWaterBalanceValue();
            result += Math.max(0,balanceValue);
        }
        return result;
    }

    public static function calcEfficiencyAwareAndClassEnergyWarmWaterYearBalanceValue(resultData:ProcessingResult):Number {
        var result:Number = 0;
        for(var i:int = 0; i < resultData.monthlyConvertedData.length;i++){
            var monthResult:ConvertedResult = resultData.monthlyConvertedData[i] as ConvertedResult;
            var balanceValue:Number = monthResult.getEfficiencyAndEnergyClassAwareWarmWaterBalanceValue();
            result += Math.max(0,balanceValue);
        }
        return result;
    }

    public static function calcYearBalanceValueWithoutRec(resultData:ProcessingResult):Number {
        var result:Number = 0;
        for(var i:int = 0; i < resultData.monthlyConvertedData.length;i++){
            var monthResult:ConvertedResult = resultData.monthlyConvertedData[i] as ConvertedResult;
            var balanceValue:Number = monthResult.getBalanceValue() - monthResult.enRecuperator;
            result += Math.max(0,balanceValue);
        }
        return result;
    }

    public static function calcHeatingBalance(resultData:ProcessingResult):Number {
        var result:Number = 0;
        for(var i:int = 0; i < resultData.monthlyConvertedData.length;i++){
            var monthResult:ConvertedResult = resultData.monthlyConvertedData[i] as ConvertedResult;
            var balanceValue:Number = monthResult.getHeatingBalance();
            result += Math.max(0,balanceValue);
        }
        return result;
    }

    public static function calcBalanceWarmWaterValue(resultData:ProcessingResult):Number {
        var result:Number = 0;
        for(var i:int = 0; i < resultData.monthlyConvertedData.length;i++){
            var monthResult:ConvertedResult = resultData.monthlyConvertedData[i] as ConvertedResult;
            var balanceValue:Number = monthResult.getWarmWaterBalance();
            result += Math.max(0,balanceValue);
        }
        return result;
    }

    public static function calcBalanceEnByProductHeat(resultData:ProcessingResult):Number {
        var result:Number = 0;
        for(var i:int = 0; i < resultData.monthlyConvertedData.length;i++){
            result += calcBalanceEnByProductHeatForMonth(resultData,i);
        }
        return result;
    }

    public static function calcBalanceEnSolGainForMonth(resultData:ProcessingResult,month:int):Number {
        var monthResult:ConvertedResult = resultData.monthlyConvertedData[month] as ConvertedResult;
        var balanceValue:Number = monthResult.getHeatingBalance();
        if(balanceValue > 0){
            return monthResult.enSolGain;
        }
        else {
            var enLoss:Number = monthResult.getEnLosses();
            var result:Number = Math.max(0,monthResult.enSolGain + balanceValue);
            return result;
        }
    }

    public static function calcBalanceEnSolGain(resultData:ProcessingResult):Number {
        var result:Number = 0;
        for(var i:int = 0; i < resultData.monthlyConvertedData.length;i++){
            result += calcBalanceEnSolGainForMonth(resultData,i);
        }
        return result;
    }

    public static function calcBalanceEnByProductHeatForMonth(resultData:ProcessingResult,month:int):Number{
        var monthResult:ConvertedResult = resultData.monthlyConvertedData[month] as ConvertedResult;
        var balanceValue:Number = monthResult.getHeatingBalance();
        if(balanceValue > 0){
            return monthResult.enPersonGain + monthResult.enElectricityGain + monthResult.enWarmWaterGain;
        }
        else {
            return monthResult.enPersonGain + monthResult.enElectricityGain + monthResult.enWarmWaterGain +
                    Math.min(monthResult.enSolGain + balanceValue,0);
        }
    }

}
}
