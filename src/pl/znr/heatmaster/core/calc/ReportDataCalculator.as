/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 17.07.13
 * Time: 23:04
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import pl.znr.heatmaster.core.*;

import mx.controls.Alert;

import pl.znr.heatmaster.constants.combo.ConversionUnits;

import pl.znr.heatmaster.constants.combo.ConversionUnits;
import pl.znr.heatmaster.constants.combo.HeatingSourceType;
import pl.znr.heatmaster.core.calc.util.BalanceValueHelper;
import pl.znr.heatmaster.core.calc.util.BalanceValueHelper;
import pl.znr.heatmaster.core.converter.ConversionData;
import pl.znr.heatmaster.core.converter.ConverterService;
import pl.znr.heatmaster.core.converter.RatioClusterFactory;
import pl.znr.heatmaster.core.model.HeatingSourceData;
import pl.znr.heatmaster.core.model.WarmWaterData;

public class ReportDataCalculator {

    private var converterService:ConverterService = new ConverterService();

    public function ReportDataCalculator() {
    }

    public function calcReportValues(dataContext:DataContext,processingResult:ProcessingResult,conversionData:ConversionData):ProcessingResult {
        var costConvertedResult:ProcessingResult;
        var energyConvertedResult:ProcessingResult;
        if(ConversionUnits.isCostUnit(conversionData.selectedUnit)){
            costConvertedResult = processingResult;
        }
        else {
            costConvertedResult = new ProcessingResult();
            costConvertedResult.wattsEnergyResult = processingResult.wattsEnergyResult;
            var costConversionData:ConversionData = buildConversionData(conversionData,ConversionUnits.COST_PER_MONTH);
            costConvertedResult = converterService.convert(costConvertedResult,costConversionData,RatioClusterFactory.getMonthlyWattsRatioCluster(costConversionData));
        }
        if(ConversionUnits.isEnergyUnit(conversionData.selectedUnit)){
            energyConvertedResult = processingResult;
        }
        else {
            energyConvertedResult = new ProcessingResult();
            energyConvertedResult.wattsEnergyResult = processingResult.wattsEnergyResult;
            var energyConversionData:ConversionData = buildConversionData(conversionData,ConversionUnits.ENERGY_KWH_PER_MONTH);
            energyConvertedResult = converterService.convert(energyConvertedResult,energyConversionData,RatioClusterFactory.getMonthlyWattsRatioCluster(energyConversionData));
        }

        var classAwareEnergyConvertedResult:ProcessingResult = new ProcessingResult();
        classAwareEnergyConvertedResult.wattsEnergyResult = processingResult.classAwareWattsEnergyResult;
        energyConversionData = buildConversionData(conversionData,ConversionUnits.ENERGY_KWH_PER_MONTH);
        classAwareEnergyConvertedResult = converterService.convert(classAwareEnergyConvertedResult,energyConversionData,RatioClusterFactory.getMonthlyWattsRatioCluster(energyConversionData));

        var totalSurface:Number = dataContext.houseData.surfaceData.totalSurface;
        var referenceEnergyConsumption:Number = BalanceValueHelper.calcYearBalanceValue(energyConvertedResult);

        processingResult.userEnergyConsumption = referenceEnergyConsumption;
        processingResult.unitSurfaceUserEnergyConsumption = referenceEnergyConsumption/totalSurface;

        var totalFinalEnergyConsumption:Number = BalanceValueHelper.calcEfficiencyAwareYearBalanceValue(energyConvertedResult);
        var totalFinalEnergyClassAwareConsumption:Number = BalanceValueHelper.calcEfficiencyAndClassEnergyAwareYearBalanceValue(classAwareEnergyConvertedResult);
        var heatingFinalEnergyConsumption:Number = BalanceValueHelper.calcEfficiencyAwareHeatingYearBalanceValue(energyConvertedResult);
        var warmWaterFinalEnergyConsumption:Number = BalanceValueHelper.calcEfficiencyAwareWarmWaterYearBalanceValue(energyConvertedResult);
        var warmWaterFinalEnergyClassAwareConsumption:Number = BalanceValueHelper.calcEfficiencyAwareAndClassEnergyWarmWaterYearBalanceValue(classAwareEnergyConvertedResult);
        var enRecuperator:Number = energyConvertedResult.yearlyAggregatedConvertedData.enRecuperator;

        var primaryEnergyConsumption:Number = calcPrimaryEnergyConsumptionFromFinalValues(heatingFinalEnergyConsumption,warmWaterFinalEnergyConsumption,enRecuperator,conversionData);
        var primaryEnergyClassAwareConsumption:Number = calcPrimaryEnergyConsumption(heatingFinalEnergyConsumption,warmWaterFinalEnergyClassAwareConsumption,enRecuperator,conversionData);

        processingResult.finalEnergyConsumption = totalFinalEnergyConsumption;
        processingResult.primaryEnergyConsumption = primaryEnergyConsumption;


        processingResult.yearlyCost = BalanceValueHelper.calcEfficiencyAwareYearBalanceValue(costConvertedResult);


        if(ConversionUnits.isGJUnit(conversionData.selectedUnit)){
            var ratio:Number = RatioClusterFactory.getMonthlyGJRatioCluster(conversionData).tokWhRatio;
            totalFinalEnergyClassAwareConsumption = totalFinalEnergyClassAwareConsumption * ratio;
            primaryEnergyClassAwareConsumption = primaryEnergyClassAwareConsumption * ratio;
        }


        processingResult.unitSurfaceFinalEnergyConsumption = totalFinalEnergyConsumption/totalSurface;
        processingResult.unitSurfacePrimaryEnergyConsumption = primaryEnergyConsumption/totalSurface;
        processingResult.unitSurfaceFinalEnergyClassConsumption = totalFinalEnergyClassAwareConsumption/totalSurface;
        processingResult.unitSurfacePrimaryEnergyClassConsumption = primaryEnergyClassAwareConsumption/totalSurface;

        trace("totalFinalEnergyClassAwareConsumption: " + totalFinalEnergyClassAwareConsumption + " totalSurface: " + totalSurface + " totalFinalEnergyConsumption: " + totalFinalEnergyConsumption);

        return processingResult;
    }

    private function calcFinalEnergyConsumption(heatingEnergyConsumption:Number,enRecuperator:Number,warmWaterEnergyConsumption:Number,conversionData:ConversionData):Number {
        var result:Number = heatingEnergyConsumption/conversionData.houseHeatingEfficiency;
        result = result + warmWaterEnergyConsumption/(conversionData.warmWaterHeatingEfficiency);
        result = result + enRecuperator * (HeatingSourceType.ELECTRIC.efficiency/100);
        return result;
    }

    private function calcPrimaryEnergyConsumption(heatingEnergyConsumption:Number,enRecuperator:Number,warmWaterEnergyConsumption:Number,conversionData:ConversionData):Number {
        var result:Number = heatingEnergyConsumption/conversionData.houseHeatingEfficiency * conversionData.finalToPrimaryCoefficient;
        result = result + warmWaterEnergyConsumption/(conversionData.warmWaterHeatingEfficiency) * conversionData.warmWaterFinalToPrimaryCoefficient;
        result = result + enRecuperator * (HeatingSourceType.ELECTRIC.efficiency/100) * HeatingSourceType.ELECTRIC.finalToPrimaryCoefficient;
        return result;
    }

    private function calcPrimaryEnergyConsumptionFromFinalValues(heatingFinalValue:Number,warmWaterFinalValue:Number,enRecuperator:Number,conversionData:ConversionData):Number {
            var result:Number = heatingFinalValue * conversionData.finalToPrimaryCoefficient;
            result = result + warmWaterFinalValue * conversionData.warmWaterFinalToPrimaryCoefficient;
            result = result + enRecuperator * (HeatingSourceType.ELECTRIC.efficiency/100) * HeatingSourceType.ELECTRIC.finalToPrimaryCoefficient;
            return result;
    }

    private function buildConversionData(conversionData:ConversionData,unit:int){
        var result:ConversionData = ConversionData.buildConversionData(unit,conversionData.pricePerKwh);
        result.waterPricePerkWh = conversionData.waterPricePerkWh;
        result.houseHeatingEfficiency = conversionData.houseHeatingEfficiency;
        result.warmWaterHeatingEfficiency = conversionData.warmWaterHeatingEfficiency;
        result.electricityPricePerKwh = conversionData.electricityPricePerKwh;
        return result;
    }


}
}
