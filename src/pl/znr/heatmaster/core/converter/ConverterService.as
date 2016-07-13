/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 10:39
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.converter {
import mx.controls.Alert;

import pl.znr.heatmaster.constants.combo.ConversionUnits;

import pl.znr.heatmaster.constants.combo.ConversionUnits;
import pl.znr.heatmaster.constants.combo.HeatingSourceType;
import pl.znr.heatmaster.core.calc.util.BalanceValueHelper;
import pl.znr.heatmaster.core.converter.ConvertedResult;
import pl.znr.heatmaster.core.ProcessingResult;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;

public class ConverterService {
    public function ConverterService() {
    }

    public function convert(processResult:ProcessingResult,conversionData:ConversionData,ratioCluster:RatioCluster):ProcessingResult{
        var monthlyConvertedDataArray:Array = new Array();
        var aggregatedResult:ConvertedResult = new ConvertedResult();

        var monthlyEnergyConsumption:Array = processResult.wattsEnergyResult.monthlyEnergyConsumption;

        var ratio:Number = chooseRatio(conversionData,ratioCluster);

        for(var month:int = 0;month < monthlyEnergyConsumption.length;month++){
            var monthEnergyData:MonthEnergyData = monthlyEnergyConsumption[month];

            var monthlyConvertedResult:ConvertedResult = convertMonthEnergyDataForRatio(monthEnergyData,ratio,conversionData,ratioCluster);

            var absoluteConvertedResult:ConvertedResult = ConverterHelper.buildWithAbsoluteValues(monthlyConvertedResult);

            aggregatedResult.enWalls += absoluteConvertedResult.enWalls;
            aggregatedResult.enFloor += absoluteConvertedResult.enFloor;
            aggregatedResult.enRoof += absoluteConvertedResult.enRoof;
            aggregatedResult.enFoundations += absoluteConvertedResult.enFoundations;
            aggregatedResult.enWindows += absoluteConvertedResult.enWindows;
            aggregatedResult.enVent += absoluteConvertedResult.enVent;
            aggregatedResult.enRecuperator += absoluteConvertedResult.enRecuperator;
            aggregatedResult.enAir += absoluteConvertedResult.enAir;
            aggregatedResult.enTightness += absoluteConvertedResult.enTightness;
            aggregatedResult.enWarmWater += absoluteConvertedResult.enWarmWater;

            aggregatedResult.enSolGain += absoluteConvertedResult.enSolGain;
            aggregatedResult.enPersonGain += absoluteConvertedResult.enPersonGain;
            aggregatedResult.enElectricityGain += absoluteConvertedResult.enElectricityGain;
            aggregatedResult.enWarmWaterGain += absoluteConvertedResult.enWarmWaterGain;
            aggregatedResult.enCollectorSolarGain += absoluteConvertedResult.enCollectorSolarGain;

            aggregatedResult.heatingSourceLoss += monthlyConvertedResult.heatingSourceLoss;
            aggregatedResult.warmWaterHeatingSourceLoss += monthlyConvertedResult.warmWaterHeatingSourceLoss;

            aggregatedResult.enWarmWaterNormalized += monthlyConvertedResult.enWarmWaterNormalized;
            aggregatedResult.enWarmWaterNormalizedHeatingSourceLoss += monthlyConvertedResult.enWarmWaterNormalizedHeatingSourceLoss;

            monthlyConvertedDataArray.push(monthlyConvertedResult);
        }

        processResult.monthlyConvertedData = monthlyConvertedDataArray;

        aggregatedResult.enSolGainAggregated = BalanceValueHelper.calcBalanceEnSolGain(processResult);
        aggregatedResult.enHeatingProductAggregated = BalanceValueHelper.calcBalanceEnByProductHeat(processResult);

        processResult.yearlyAggregatedConvertedData = aggregatedResult;

        return processResult;
    }

    public function convertMonthEnergyData(energyData:MonthEnergyData,conversionData:ConversionData,ratioCluster:RatioCluster):ConvertedResult {
        var ratio:Number = chooseRatio(conversionData,ratioCluster);
        return convertMonthEnergyDataForRatio(energyData,ratio,conversionData,ratioCluster);
    }

    public function convertMonthEnergyDataForRatio(energyData:MonthEnergyData,ratio:Number,conversionData:ConversionData,ratioCluster:RatioCluster):ConvertedResult {
        var converterResult:ConvertedResult = new ConvertedResult();

        converterResult.enWalls = energyData.enWalls * ratio;
        converterResult.enFloor = energyData.enFloor * ratio;
        converterResult.enRoof = energyData.enRoof * ratio;
        converterResult.enFoundations = energyData.enFoundations * ratio;
        converterResult.enWindows = energyData.enWindows * ratio;
        converterResult.enVent = energyData.enVent * ratio;
        converterResult.enAir = energyData.enAir * ratio;
        converterResult.enTightness = energyData.enTightness * ratio;

        converterResult.enRecuperator = convertEnRecuperator(energyData,conversionData,ratioCluster);
        converterResult.enWarmWater = convertWarmWaterLoss(energyData.enWarmWater,energyData.enCollectorSolarGain,conversionData,ratioCluster);

        converterResult.enSolGain = energyData.enSolGain * ratio;
        converterResult.enPersonGain = energyData.enPersonGain * ratio;
        converterResult.enElectricityGain = energyData.enElectricityGain * ratio;

        converterResult.enWarmWaterGain = convertWarmWaterGain(energyData,conversionData,ratioCluster);
        converterResult.enCollectorSolarGain = convertSolarCollectorGain(energyData,conversionData,ratioCluster);

        converterResult.enWarmWaterNormalized = convertWarmWaterLoss(energyData.enWarmWaterNormalized,energyData.enCollectorSolarGain,conversionData,ratioCluster);


        var heatingBalance:Number = Math.max(0,converterResult.getHeatingBalance());
        var warmWaterBalance:Number = Math.max(0,converterResult.getWarmWaterBalance());
        var warmWaterNormalizedBalance:Number = Math.max(0,converterResult.getWarmWaterNormalizedBalance());


        converterResult.heatingSourceLoss = calcHeatingSourceLoss(heatingBalance,conversionData.houseHeatingEfficiency);
        converterResult.warmWaterHeatingSourceLoss = calcHeatingSourceLoss(warmWaterBalance,conversionData.warmWaterHeatingEfficiency);

        converterResult.enWarmWaterNormalizedHeatingSourceLoss = calcHeatingSourceLoss(warmWaterNormalizedBalance,conversionData.warmWaterHeatingEfficiency);



        return converterResult;
    }

    private function calcHeatingSourceLoss(value:Number,efficiency:Number):Number {
        return value/efficiency - value;
    }

    private function convertEnRecuperator(energyData:MonthEnergyData,conversionData:ConversionData,ratioCluster:RatioCluster):Number {
        var result:Number = energyData.enRecuperator;
        if(ConversionUnits.isCostUnit(conversionData.selectedUnit)){
            result = result * ratioCluster.tokWhRatio / (HeatingSourceType.ELECTRIC.efficiency/100) * conversionData.electricityPricePerKwh;
        }
        else if(ConversionUnits.isEmisionUnit(conversionData.selectedUnit)){
            result = result * ratioCluster.tokWhRatio / (HeatingSourceType.ELECTRIC.efficiency/100) * HeatingSourceType.ELECTRIC.emissionPerKWh;
        }
        else {
            var ratio:Number = ConversionUnits.getRatio(conversionData.selectedUnit,ratioCluster);
            result = result * ratio;
        }
        return result;
    }

    private function convertWarmWaterLoss(enWarmWater:Number,enCollectorSolarGain:Number,conversionData:ConversionData,ratioCluster:RatioCluster):Number{
        var result:Number = enWarmWater;
        var conventionalHeatingValue:Number = Math.max(0,enWarmWater - enCollectorSolarGain);
        if(ConversionUnits.isCostUnit(conversionData.selectedUnit)){
            result = enWarmWater * ratioCluster.tokWhRatio * conversionData.waterPricePerkWh;
        }
        else if(ConversionUnits.isEmisionUnit(conversionData.selectedUnit)){
            result = enWarmWater * ratioCluster.toWarmWaterEmissionRatio;

        }
        else {
            var ratio:Number = ConversionUnits.getRatio(conversionData.selectedUnit,ratioCluster);
            result = result * ratio;
        }
        return result ;
    }

    private function convertWarmWaterGain(energyData:MonthEnergyData,conversionData:ConversionData,ratioCluster:RatioCluster):Number {
        var result:Number = energyData.enWarmWaterGain;
        var solarRatio:Number = Math.min(energyData.enWarmWater,energyData.enCollectorSolarGain)/energyData.enWarmWater;
        if(ConversionUnits.isCostUnit(conversionData.selectedUnit)){
            result = result *  ratioCluster.toCostRatio;
        }
        else if(ConversionUnits.isEmisionUnit(conversionData.selectedUnit)){
            result = result * ratioCluster.toEmissionRatio;
        }
        else {
            result = result * ConversionUnits.getRatio(conversionData.selectedUnit,ratioCluster);
        }
        return result;
    }

    private function convertSolarCollectorGain(energyData:MonthEnergyData,conversionData:ConversionData,ratioCluster:RatioCluster):Number {

        var result:Number = Math.min(energyData.enWarmWater,energyData.enCollectorSolarGain);
        if(ConversionUnits.isCostUnit(conversionData.selectedUnit)){
            result = result * ratioCluster.tokWhRatio * conversionData.waterPricePerkWh;
        }
        else if(ConversionUnits.isEmisionUnit(conversionData.selectedUnit)){
            result = result * ratioCluster.toWarmWaterEmissionRatio;
        }
        else {
            var ratio:Number = ConversionUnits.getRatio(conversionData.selectedUnit,ratioCluster);
            result = ratio * result;
        }
        return result;
    }

    private function chooseRatio(conversionData:ConversionData,ratioCluster:RatioCluster):Number {

        var ratio:Number = 1;

        if(conversionData.selectedUnit == ConversionUnits.ENERGY_WATTS){
            ratio = ratioCluster.toWattsRatio;
        }
        else if(ConversionUnits.isKiloWattsUnit(conversionData.selectedUnit)){
            ratio = ratioCluster.tokWhRatio;
        }
        else if(ConversionUnits.isCostUnit(conversionData.selectedUnit)){
            ratio = ratioCluster.toCostRatio;
        }
        else if(ConversionUnits.isGJUnit(conversionData.selectedUnit)){
            ratio = ratioCluster.toGJRatio;
        }
        else if(ConversionUnits.isEmisionUnit(conversionData.selectedUnit)){
            ratio = ratioCluster.toEmissionRatio;
        }

        return ratio;
    }

}
}
