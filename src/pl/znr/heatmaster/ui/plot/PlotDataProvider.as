/**
 * Created by Dom on 2016-07-12.
 */
package pl.znr.heatmaster.ui.plot {
import mx.collections.ArrayList;

import pl.znr.heatmaster.constants.combo.ConversionUnits;
import pl.znr.heatmaster.core.ProcessingResult;
import pl.znr.heatmaster.core.ProcessingResult;
import pl.znr.heatmaster.core.calc.util.BalanceValueHelper;
import pl.znr.heatmaster.core.converter.ConversionData;
import pl.znr.heatmaster.core.converter.ConvertedResult;
import pl.znr.heatmaster.core.converter.ConverterHelper;


public class PlotDataProvider {

    private static var PLOT_RANGE_ADJUSTER:Number = 1.05;

    public function PlotDataProvider() {
    }

    public function getComparingPlotData(refResultData:ProcessingResult,newResultData:ProcessingResult,renderMode:RenderMode):PlotData {
        var conversionData:ConversionData = refResultData.conversionData;
        if(renderMode == null){
           renderMode = resolveRenderModeByConversionUnit(conversionData.selectedUnit);
        }

        var plotData:PlotData = new PlotData();
        var columnData:Array = [];
        var lineData1:Array = [];
        var lineData2:Array = [];
        columnData.push(createEmptyPlotDataItem());

        var refYearlyConvertedResult:ConvertedResult = refResultData.yearlyAggregatedConvertedData;
        var newYearlyConvertedResult:ConvertedResult = newResultData.yearlyAggregatedConvertedData;

        var refDataMinValue:Number = getDataMinValue(refYearlyConvertedResult,true,renderMode);
        var newDataMinValue:Number = getDataMinValue(newYearlyConvertedResult,true,renderMode);

        var yMaxValue:Number = PLOT_RANGE_ADJUSTER * Math.max(getDataMaxValue(refDataMinValue,refYearlyConvertedResult,true,renderMode),
                        getDataMaxValue(newDataMinValue,newYearlyConvertedResult,true,renderMode));

        var yMinValue:Number = PLOT_RANGE_ADJUSTER * Math.min(refDataMinValue,newDataMinValue);
        var yInterval:Number = adjustInterval(Math.round(yMaxValue / 6));

        //add column and line plot data
        columnData.push(createPlotColumnItem(refYearlyConvertedResult,conversionData,true,renderMode));
        columnData.push(createPlotColumnItem(newYearlyConvertedResult,conversionData,true,renderMode));
        columnData.push(createEmptyPlotDataItem());

        lineData1.push({netLoss: columnData[1].netLoss,xField:0});
        lineData1.push({netLoss: columnData[1].netLoss,xField:1});
        lineData2.push({netLoss: columnData[2].netLoss,xField:2});
        lineData2.push({netLoss: columnData[2].netLoss,xField:3});


        var data:Object = {
            columnData:columnData,
            lineData1:lineData1,
            lineData2:lineData2
        };

        plotData.data = data;
        plotData.yInterval = yInterval;
        plotData.yMinValue = yMinValue;
        plotData.yMaxValue = yMaxValue;

        return plotData;
    }

    public function getMonthlyPlotArrayData(resultData:ProcessingResult,renderMode:RenderMode):PlotData {
        var conversionData:ConversionData = resultData.conversionData;
        if(renderMode == null){
            renderMode = resolveRenderModeByConversionUnit(conversionData.selectedUnit);
        }

        var plotData:PlotData = new PlotData();
        var columnData:Array = [];
        var lineData:Array = [];

        var yMaxValue:Number = Number.MIN_VALUE;
        var yMinValue:Number = 0;

        for (var month:int = 0; month < 12; month++) {
            var monthlyConverterResult:ConvertedResult = resultData.monthlyConvertedData[month] as ConvertedResult;
            var convertedResult:ConvertedResult = ConverterHelper.buildWithAbsoluteValues(monthlyConverterResult);

            var minValue:Number = getDataMinValue(convertedResult,false,renderMode);
            var maxValue:Number = getDataMaxValue(minValue, convertedResult,false,renderMode);

            var plotDataItem:Object = createPlotColumnItem(convertedResult, conversionData,false, renderMode);
            columnData.push(plotDataItem);

            if(yMaxValue < maxValue){
               yMaxValue = maxValue;
            }
            if(yMinValue > minValue){
               yMinValue = minValue;
            }
        }

        var objectFirst:Object = columnData[0];
        var objectLast:Object = columnData[11];
        var netLossAvg:Number = (objectFirst.netLoss + objectLast.netLoss) / 2;
        for (var i:int = 0; i < 12; i++) {
            var object:Object = columnData[i];
            var lineDataItem:Object = {netLoss: object.netLoss};
            if (i == 0) {
                lineData.push({netLoss: netLossAvg});
            }
            lineData.push(lineDataItem);
            if (i < 11) {
                var objectNext:Object = columnData[i + 1];
                var avgNet:Number = (object.netLoss + objectNext.netLoss) / 2;
                lineData.push({netLoss: avgNet});
            }

            if (i == 11) {
                lineData.push({netLoss: netLossAvg});
            }
        }

        var data:Object = {
            columnData:columnData,
            lineData:lineData
        };

        yMaxValue = yMaxValue * PLOT_RANGE_ADJUSTER;
        yMinValue = yMinValue * PLOT_RANGE_ADJUSTER;

        plotData.data = data;
        plotData.yInterval = adjustInterval(Math.round(yMaxValue / 6));
        plotData.yMinValue = yMinValue;
        plotData.yMaxValue = yMaxValue;

        return plotData;
    }

    public function resolveRenderModeByConversionUnit(unit:int):RenderMode {
        if(ConversionUnits.isEfficiencyAwareUnit(unit)){
           return new RenderMode(RangeMode.ZERO_BASED,ColumnMode.AGGREGATED_ALL_COMPONENTS);
        }
        return new RenderMode(RangeMode.ZERO_BASED,ColumnMode.AGGREGATED_ALL_COMPONENTS);
    }



    protected function createPlotColumnItem(converterResult:ConvertedResult,conversionData:ConversionData,yearlyMode:Boolean, renderMode:RenderMode):Object{
        var enLosses:Number = getDataColumnMaxValue(converterResult,yearlyMode,renderMode);
        var enGains:Number = getDataColumnMinValue(converterResult,yearlyMode,renderMode);
        var netLoss:Number = getBalanceValue(enLosses,enGains,renderMode);
        var columnData:SplitColumnData = new SplitColumnDataProvider().getColumnData(converterResult,renderMode,yearlyMode);

        return {
            drawingEnabled: true,
            renderMode:renderMode,
            yearlyMode:yearlyMode,
            enLosses: enLosses,
            enGains: enGains,
            netLoss: netLoss,
            columnData:columnData,
            conversionUnit: conversionData.selectedUnit,
            convertedResult: converterResult
        };
    }

    private function getBalanceValue(enLosses:Number,enGains:Number,renderMode:RenderMode):Number {
       if(renderMode.rangeMode == RangeMode.NEGATIVE_BASED){
          return Math.max(enLosses + enGains,0);
       }
       return 0;
    }

    private function getDataMaxValue(dataMinValue:Number,convertedResult:ConvertedResult,yearlyMode:Boolean, renderMode:RenderMode):Number {
        var maxValue:Number = getDataColumnMaxValue(convertedResult,yearlyMode,renderMode);
        if(renderMode.rangeMode == RangeMode.NEGATIVE_BASED){
           if(maxValue < -dataMinValue){
              maxValue = -dataMinValue;
           }
        }

        return maxValue;
    }

    private function getDataColumnMaxValue(convertedResult:ConvertedResult,yearlyMode:Boolean, renderMode:RenderMode):Number {
        var maxValue:Number = 0;
        var enLosses:Number = convertedResult.getEnLosses() - convertedResult.enRecuperator;
        var enGains:Number = convertedResult.getEnGains();

        if(renderMode.columnMode == ColumnMode.AGGREGATED_ALL_COMPONENTS_EFFICIENCY_BALANCED){
           maxValue = convertedResult.getEfficiencyAwareBalanceValue();
        }
        else {
            if (renderMode.rangeMode == RangeMode.ZERO_BASED) {
                if (!yearlyMode) {
                    if (ColumnMode.isAllComponentsMode(renderMode.columnMode)) {
                        maxValue = convertedResult.getAllEnLosses() + enGains;
                    }
                    else {
                        //user energy mode. Do not take enRecuperator and heating source energy loss
                        maxValue = enLosses + enGains;
                    }
                }
                else {
                    if (ColumnMode.isAllComponentsMode(renderMode.columnMode)) {
                        maxValue = convertedResult.getAllEnLosses() + convertedResult.getYearlyAggregatedGains() + convertedResult.getEnHeatingSourceGains();
                    }
                    else {
                        //user energy mode. Do not take enRecuperator and heating source energy loss
                        maxValue = enLosses + convertedResult.getYearlyAggregatedGains();
                    }
                }
            }
            else {
                if (ColumnMode.isAllComponentsMode(renderMode.columnMode)) {
                    maxValue = convertedResult.getAllEnLosses();
                }
                else {
                    //user energy mode. Do not take enRecuperator and heating source energy loss
                    maxValue = enLosses;
                }
            }
        }
        return maxValue;
    }

    private function getDataMinValue(convertedResult:ConvertedResult,yearlyMode:Boolean,renderMode:RenderMode):Number {
        return getDataColumnMinValue(convertedResult,yearlyMode, renderMode);
    }

    private function getDataColumnMinValue(convertedResult:ConvertedResult,yearlyMode:Boolean, renderMode:RenderMode):Number {
        var minValue:Number = 0;
        if(renderMode.rangeMode == RangeMode.NEGATIVE_BASED){
            if (!yearlyMode) {
                minValue = -convertedResult.getEnGains();
            }
            else {
                minValue = -convertedResult.getYearlyAggregatedGains() - convertedResult.getEnHeatingSourceGains();
            }
        }
        return minValue;
    }

    protected function adjustInterval(interval:int):int {
        var digits:int = 0;
        var value:int = interval;
        while (value > 0) {
            value = value / 10;
            digits++;
        }

        if (digits == 1) {
            return interval;
        }

        var twoDigitValue:int = interval / (Math.pow(10, digits - 2));
        var res:int = twoDigitValue % 10;
        if (twoDigitValue < 15) {
            twoDigitValue = 10;
        }
        else if (twoDigitValue < 35) {
            twoDigitValue = 20
        }
        else if (twoDigitValue < 75) {
            twoDigitValue = 50;
        }
        else {
            twoDigitValue = 100;
        }
        return twoDigitValue * Math.pow(10, digits - 2);
    }

    private function createEmptyPlotDataItem():Object {
        return {
            drawingEnabled: false,
            conversionUnit: 0,
            convertedResult: new ConvertedResult()
        }
    }
}
}
