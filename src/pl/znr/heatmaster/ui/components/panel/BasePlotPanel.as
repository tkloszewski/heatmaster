/**
 * Created by Dom on 2016-07-11.
 */
package pl.znr.heatmaster.ui.components.panel {
import mx.charts.LinearAxis;
import mx.collections.ArrayList;

import pl.znr.heatmaster.constants.combo.ConversionUnits;

import pl.znr.heatmaster.constants.combo.ConversionUnits;
import pl.znr.heatmaster.core.ProcessingResult;
import pl.znr.heatmaster.core.converter.ConversionData;
import pl.znr.heatmaster.core.converter.ConvertedResult;
import pl.znr.heatmaster.core.converter.ConvertedResult;
import pl.znr.heatmaster.core.converter.ConverterHelper;

import pl.znr.heatmaster.ui.components.HeatMasterResultComponent;
import pl.znr.heatmaster.ui.plot.ColumnMode;
import pl.znr.heatmaster.ui.plot.PlotData;
import pl.znr.heatmaster.ui.plot.PlotDataProvider;
import pl.znr.heatmaster.ui.plot.RangeMode;
import pl.znr.heatmaster.ui.plot.RenderMode;

public class BasePlotPanel extends HeatMasterResultComponent{

    [Bindable]
    protected var legendItemGap:int = 5;

    [Bindable]
    protected var mainLegendRectWidth:Number = 20;

    [Bindable]
    protected var mainLegendRectHeight:Number = 12;

    [Bindable]
    protected var legendRectLabelPaddingTop:int = 2;

    [Bindable]
    protected var yMaxValue:Number = 6000;

    [Bindable]
    protected var yMinValue:Number = 0;

    [Bindable]
    protected var yInterval:Number = 1000;

    [Bindable]
    protected var gutterLeft:Number = 50;

    [Bindable]
    protected var gutterRight:Number = 0;

    [Bindable]
    protected var gutterBottom:Number = 0;

    [Bindable]
    protected var rawUnitName:String;

    protected var currencyCode:String;
    protected var localCurrency:Boolean = false;


    public function BasePlotPanel() {
    }

    protected function getComparingPlotArrayData(refResultData:ProcessingResult,newResultData:ProcessingResult):Object {
        var conversionData:ConversionData = refResultData.conversionData;
        var renderMode:RenderMode = null;
        if(ConversionUnits.isEnergyUnit(conversionData.selectedUnit)){
           renderMode = new RenderMode(RangeMode.NEGATIVE_BASED,ColumnMode.SPLIT_ALL_COMPONENTS);
        }
        else {
           renderMode = new RenderMode(RangeMode.NEGATIVE_BASED,ColumnMode.SPLIT_ALL_COMPONENTS);
        }

        var plotDataProvider:PlotDataProvider = new PlotDataProvider();
        var plotData:PlotData = plotDataProvider.getComparingPlotData(refResultData,newResultData,renderMode);

        yMaxValue = plotData.yMaxValue;
        if (yMaxValue < 10) {
            yMaxValue = 10;
        }
        yMinValue = plotData.yMinValue;
        yInterval = plotData.yInterval;

        return plotData.data;
    }

    protected function getMonthlyPlotArrayData(resultData:ProcessingResult,monthList:ArrayList):Object {
        var conversionData:ConversionData = resultData.conversionData;
        var renderMode:RenderMode = null;
        if(ConversionUnits.isEnergyUnit(conversionData.selectedUnit)){
            renderMode = new RenderMode(RangeMode.NEGATIVE_BASED,ColumnMode.SPLIT_USER_ENERGY_COMPONENTS);
        }
        else {
            renderMode = new RenderMode(RangeMode.ZERO_BASED,ColumnMode.AGGREGATED_ALL_COMPONENTS_EFFICIENCY_BALANCED);
        }

        var plotDataProvider:PlotDataProvider = new PlotDataProvider();
        var plotData:PlotData = plotDataProvider.getMonthlyPlotArrayData(resultData,renderMode);

        yMaxValue = plotData.yMaxValue;
        if (yMaxValue < 10) {
            yMaxValue = 10;
        }
        yMinValue = plotData.yMinValue;
        yInterval = plotData.yInterval;

        return plotData.data;
    }

    protected function getRawUnitName(selectedUnit:int, currencyCode:String):String {
        if (ConversionUnits.isEmisionUnit(selectedUnit)) {
            return "CO2";
        }
        else if (ConversionUnits.isGJUnit(selectedUnit)) {
            return "GJ";
        }
        else if (ConversionUnits.isKiloWattsUnit(selectedUnit)) {
            return "kWh";
        }
        else if (ConversionUnits.isCostUnit(selectedUnit)) {
            return resourceManager.getString('hm', currencyCode);
        }
        return "W";
    }

    protected function verticalAxisLabelFunction(labelValue:Object, previousLabelValue:Object, axis:LinearAxis):String {
        if (labelValue == '0') {
            return rawUnitName + "  " + "0";
        }
        return labelValue.toString();
    }

}
}
