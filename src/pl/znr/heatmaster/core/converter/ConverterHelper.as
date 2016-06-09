/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 21.06.13
 * Time: 20:47
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.converter {
import mx.rpc.mxml.Concurrency;

import pl.znr.heatmaster.constants.combo.ConversionUnits;
import pl.znr.heatmaster.core.ConvertedResult;
import pl.znr.heatmaster.core.ProcessingResult;

public class ConverterHelper {
    public function ConverterHelper() {
    }

    public static function buildWithAbsoluteValues(converterResult:ConvertedResult):ConvertedResult {
        var result:ConvertedResult = new ConvertedResult();
        result.enWalls = Math.max(0,converterResult.enWalls);
        result.enRoof = Math.max(0,converterResult.enRoof);
        result.enFloor = Math.max(0,converterResult.enFloor);
        result.enFoundations = Math.max(0,converterResult.enFoundations);
        result.enWindows = Math.max(0,converterResult.enWindows);
        result.enVent = Math.max(0,converterResult.enVent);
        result.enRecuperator = Math.max(0,converterResult.enRecuperator);
        result.enAir = Math.max(0,converterResult.enAir);
        result.enTightness = Math.max(0,converterResult.enTightness);
        result.enWarmWater = Math.max(0,converterResult.enWarmWater);

        result.enSolGain = Math.max(0,converterResult.enSolGain);
        result.enPersonGain = Math.max(0,converterResult.enPersonGain);
        result.enElectricityGain = Math.max(0,converterResult.enElectricityGain);
        result.enCollectorSolarGain = Math.max(0,converterResult.enCollectorSolarGain);
        result.enWarmWaterGain = Math.max(0,converterResult.enWarmWaterGain);

        result.heatingSourceLoss = converterResult.heatingSourceLoss;
        result.warmWaterHeatingSourceLoss = converterResult.warmWaterHeatingSourceLoss;

        result.enWarmWaterNormalized = converterResult.enWarmWaterNormalized;
        result.enWarmWaterNormalizedHeatingSourceLoss = converterResult.enWarmWaterNormalizedHeatingSourceLoss;


        return result;
    }

    public static function toConvertedValue(value:Number,conversionData:ConversionData):ConvertedValue {
        var convertedValue:ConvertedValue = new ConvertedValue();
        var ratioCluster:RatioCluster = RatioClusterFactory.getRatioCluster(conversionData);

        convertedValue.wattsValue = value * ratioCluster.toWattsRatio;
        convertedValue.kWhValue = value * ratioCluster.tokWhRatio;
        convertedValue.zlotyValue = value * ratioCluster.toCostRatio;

        return convertedValue;
    }

    public static function calcToPLNExchangeRate(unit:int,euroToPLNExchangeRate:Number,toLocalCurrencyExchangeRate:Number):Number {
        var result:Number = euroToPLNExchangeRate/toLocalCurrencyExchangeRate;
        if(ConversionUnits.isEuroCostUnit(unit)){
           result = euroToPLNExchangeRate;
        }
        return result;
    }

    private static function getEnergyRatio(unit:int):Number {
        var ratio:Number = 1;
        if(unit == ConversionUnits.ENERGY_WATTS){
            ratio = 1;
        }
        if(unit == ConversionUnits.ENERGY_KWH_PER_MONTH){
            ratio = 0.72; // (24 * 30)/1000
        }
        else if(unit == ConversionUnits.ENERGY_KWH_PER_YEAR){
            ratio = (24 * 365)/1000;
        }
        return ratio;
    }


}
}
