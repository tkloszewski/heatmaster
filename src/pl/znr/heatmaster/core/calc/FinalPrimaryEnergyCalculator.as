/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 23.07.13
 * Time: 21:04
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import pl.znr.heatmaster.core.*;
import pl.znr.heatmaster.core.calc.util.BalanceValueHelper;
import pl.znr.heatmaster.core.converter.ConversionData;

public class FinalPrimaryEnergyCalculator {
    public function FinalPrimaryEnergyCalculator() {
    }


    public function calcFinalPrimaryEnergyConsumption(processingResult:ProcessingResult,conversionData:ConversionData):ProcessingResult {
        var referenceEnergyConsumption:Number = BalanceValueHelper.calcYearBalanceValue(processingResult);
        var enWarmWater:Number = processingResult.yearlyAggregatedConvertedData.enWarmWater;
        var houseEnergyConsumption:Number = referenceEnergyConsumption - enWarmWater;

        processingResult.finalEnergyConsumption = doCalcFinalEnergyConsumption(houseEnergyConsumption,enWarmWater,conversionData);
        processingResult.primaryEnergyConsumption = doCalcPrimaryEnergyConsumption(houseEnergyConsumption,enWarmWater,conversionData);

        return processingResult;
    }

    private function doCalcFinalEnergyConsumption(houseEnergyConsumption:Number,warmWaterEnergyConsumption:Number,conversionData:ConversionData):Number {
        return houseEnergyConsumption/conversionData.houseHeatingEfficiency + warmWaterEnergyConsumption/conversionData.warmWaterHeatingEfficiency;
    }

    private function doCalcPrimaryEnergyConsumption(houseEnergyConsumption:Number,warmWaterEnergyConsumption:Number,conversionData:ConversionData):Number {
        return (houseEnergyConsumption/conversionData.houseHeatingEfficiency * conversionData.finalToPrimaryCoefficient)
                +
                (warmWaterEnergyConsumption/conversionData.warmWaterHeatingEfficiency * conversionData.warmWaterFinalToPrimaryCoefficient);
    }
}
}
