/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 09:01
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.converter {
import mx.controls.Alert;

import pl.znr.heatmaster.constants.combo.ConversionUnits;

import pl.znr.heatmaster.constants.combo.ConversionUnits;

public class RatioClusterFactory {
    public function RatioClusterFactory() {
    }

    public static function fromWattsToKwhRatio(){
        return (24 * 30)/1000;
    }

    public static function getMonthlyWattsRatioCluster(conversionData:ConversionData):RatioCluster {
        var x:XML = new XML();
        var ratioCluster:RatioCluster = new RatioCluster();
        ratioCluster.toWattsRatio = 1;
        ratioCluster.tokWhRatio = fromWattsToKwhRatio();
        ratioCluster.toCostRatio = ratioCluster.tokWhRatio * conversionData.pricePerKwh;
        ratioCluster.toGJRatio = (24 * 3600 * 30) / 1000000000;
        //ratioCluster.toEmissionRatio = ratioCluster.tokWhRatio / conversionData.houseHeatingEfficiency * conversionData.emissionCoefficient;
        //ratioCluster.toWarmWaterEmissionRatio = ratioCluster.tokWhRatio / conversionData.warmWaterHeatingEfficiency * conversionData.waterEmissionCoefficient;

        ratioCluster.toEmissionRatio = ratioCluster.tokWhRatio  * conversionData.emissionCoefficient;
        ratioCluster.toWarmWaterEmissionRatio = ratioCluster.tokWhRatio * conversionData.waterEmissionCoefficient;

        return ratioCluster;
    }

    public static function getMonthlyKiloWattsHourRatioCluster(conversionData:ConversionData):RatioCluster {
        var ratioCluster:RatioCluster = new RatioCluster();
        ratioCluster.toWattsRatio = 1000 / (24 * 30);
        ratioCluster.tokWhRatio = 1;
        ratioCluster.toCostRatio =  conversionData.pricePerKwh;
        ratioCluster.toGJRatio = 0.036;

        //ratioCluster.toEmissionRatio = ratioCluster.tokWhRatio / conversionData.houseHeatingEfficiency * conversionData.emissionCoefficient;
        //ratioCluster.toWarmWaterEmissionRatio = ratioCluster.tokWhRatio / conversionData.warmWaterHeatingEfficiency * conversionData.waterEmissionCoefficient;

        ratioCluster.toEmissionRatio = ratioCluster.tokWhRatio  * conversionData.emissionCoefficient;
        ratioCluster.toWarmWaterEmissionRatio = ratioCluster.tokWhRatio * conversionData.waterEmissionCoefficient;

        return ratioCluster;
    }

    public static function getMonthlyGJRatioCluster(conversionData:ConversionData):RatioCluster {
        var ratioCluster:RatioCluster = new RatioCluster();

        ratioCluster.toWattsRatio = 1/0.0036 * 1000/ (24 * 30);
        ratioCluster.tokWhRatio = 1/0.0036;
        ratioCluster.toCostRatio = ratioCluster.tokWhRatio * conversionData.pricePerKwh;
        ratioCluster.toGJRatio = 1;

        //ratioCluster.toEmissionRatio = ratioCluster.tokWhRatio / conversionData.houseHeatingEfficiency * conversionData.emissionCoefficient;
        //ratioCluster.toWarmWaterEmissionRatio = ratioCluster.tokWhRatio / conversionData.warmWaterHeatingEfficiency * conversionData.waterEmissionCoefficient;

        ratioCluster.toEmissionRatio = ratioCluster.tokWhRatio  * conversionData.emissionCoefficient;
        ratioCluster.toWarmWaterEmissionRatio = ratioCluster.tokWhRatio * conversionData.waterEmissionCoefficient;

        return ratioCluster;
    }

    public static function getMonthlyCostRatioCluster(conversionData:ConversionData):RatioCluster {
        var ratioCluster:RatioCluster = new RatioCluster();

        ratioCluster.toWattsRatio = 1000 / (24* 30) * (1 / conversionData.pricePerKwh);
        ratioCluster.tokWhRatio = (1 / conversionData.pricePerKwh);
        ratioCluster.toCostRatio = 1;
        ratioCluster.toGJRatio = (1 / conversionData.pricePerKwh) * 0.036;

        //ratioCluster.toEmissionRatio = ratioCluster.tokWhRatio / conversionData.houseHeatingEfficiency * conversionData.emissionCoefficient;
        //ratioCluster.toWarmWaterEmissionRatio = ratioCluster.tokWhRatio / conversionData.warmWaterHeatingEfficiency * conversionData.waterEmissionCoefficient;

        ratioCluster.toEmissionRatio = ratioCluster.tokWhRatio  * conversionData.emissionCoefficient;
        ratioCluster.toWarmWaterEmissionRatio = ratioCluster.tokWhRatio * conversionData.waterEmissionCoefficient;

        return ratioCluster;
    }

    public static function getEmissionRatioCluster(conversionData:ConversionData):RatioCluster {
        var ratioCluster:RatioCluster = new RatioCluster();

        ratioCluster.tokWhRatio = (1 / conversionData.emissionCoefficient);
        ratioCluster.toWattsRatio = 1000 / (24* 30) * ratioCluster.tokWhRatio;
        ratioCluster.toCostRatio = ratioCluster.tokWhRatio * conversionData.pricePerKwh;
        ratioCluster.toGJRatio = ratioCluster.tokWhRatio * 0.036;

        //ratioCluster.toEmissionRatio = ratioCluster.tokWhRatio / conversionData.houseHeatingEfficiency * conversionData.emissionCoefficient;
        //ratioCluster.toWarmWaterEmissionRatio = ratioCluster.tokWhRatio / conversionData.warmWaterHeatingEfficiency * conversionData.waterEmissionCoefficient;

        ratioCluster.toEmissionRatio = 1;
        ratioCluster.toWarmWaterEmissionRatio = 1;

        return ratioCluster;
    }

    public static function getRatioCluster(conversionData:ConversionData):RatioCluster {
        var ratioCluster:RatioCluster = new RatioCluster();

        var unit:int = conversionData.selectedUnit;

        if (unit == ConversionUnits.ENERGY_WATTS) {
            ratioCluster = getMonthlyWattsRatioCluster(conversionData);
        }
        else if (unit == ConversionUnits.ENERGY_KWH_PER_MONTH || unit == ConversionUnits.ENERGY_KWH_PER_YEAR) {
            ratioCluster = getMonthlyWattsRatioCluster(conversionData);
        }
        else if (ConversionUnits.isCostUnit(unit)) {
            ratioCluster = getMonthlyCostRatioCluster(conversionData);
        }

        return ratioCluster;
    }
}
}
