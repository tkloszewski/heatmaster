/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 30.06.13
 * Time: 16:11
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.renderer {
import flash.display.Graphics;

import mx.charts.series.items.ColumnSeriesItem;
import mx.controls.Alert;
import mx.core.IDataRenderer;
import mx.skins.ProgrammaticSkin;

import pl.znr.heatmaster.constants.combo.ConversionUnits;
import pl.znr.heatmaster.core.ProcessingResult;
import pl.znr.heatmaster.core.calc.util.BalanceValueHelper;

import pl.znr.heatmaster.core.converter.ConvertedResult;
import pl.znr.heatmaster.ui.plot.ColumnMode;
import pl.znr.heatmaster.ui.plot.RangeMode;
import pl.znr.heatmaster.ui.plot.RenderMode;

import spark.primitives.Graphic;

public class CustomPlotColumnRenderer extends mx.skins.ProgrammaticSkin implements IDataRenderer{
    public function CustomPlotColumnRenderer() {
    }

    private var _chartItem:ColumnSeriesItem;

    public function get data():Object {
        return _chartItem;
    }

    public function set data(value:Object):void {
        _chartItem = value as ColumnSeriesItem;
    }


    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
        try {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            var g:Graphics = graphics;
            g.clear();

            //Do not draw for data not to be meant to be drawn
            if(!_chartItem.item.drawingEnabled){
               return;
            }

            var convertedResult:ConvertedResult = _chartItem.item.convertedResult as ConvertedResult;
            var overallValue:Number = convertedResult.getEnLosses() + convertedResult.getEnGains();
            var conversionUnit:int =  _chartItem.item.conversionUnit;

            g.lineStyle(1,0x808080);

            var renderMode:RenderMode = _chartItem.item.renderMode;

            if(renderMode == null){
                if(_chartItem.item.alwaysDrawSubComponents){
                    renderSplitRect(convertedResult, overallValue, g, unscaledWidth, unscaledHeight,null,false);
                }
                else {
                    if (!ConversionUnits.isCostUnit(conversionUnit) && !ConversionUnits.isEmisionUnit(conversionUnit)) {
                        renderSplitRect(convertedResult, overallValue, g, unscaledWidth, unscaledHeight,null,false);
                    }
                    else {
                        drawRect(g, unscaledWidth, unscaledHeight, 0, 0, 0xF24848, 1);
                    }
                }
            }
            else {
                if(ColumnMode.isAggregatedMode(renderMode.columnMode)){
                    drawRect(g, unscaledWidth, unscaledHeight, 0, 0, 0xF24848, 1);
                }
                else {
                    var yearlyMode:Boolean = _chartItem.item.yearlyMode;
                    var range:Number = _chartItem.item.enLosses - _chartItem.item.enGains;
                    renderSplitRect(convertedResult, range, g, unscaledWidth, unscaledHeight,renderMode,yearlyMode);
                }
            }

        } catch (e:Error) {
            Alert.show("Error while plotting " + e.message);
            trace("Error while plotting " + e.message);
        }
    }

    private function renderSplitRect(convertedResult:ConvertedResult,overallValue:Number,g:Graphics,unscaledWidth:Number,unscaledHeight:Number,renderMode:RenderMode,yearlyMode:Boolean):void {
        var currentY:Number = 0;
        var ratio:Number = 1;

        var enVent:Number = convertedResult.enVent;
        var drawHeatingSourceLoss:Boolean = false;
        if(renderMode != null && ColumnMode.isAllComponentsMode(renderMode.columnMode)){
           enVent = enVent + convertedResult.enRecuperator;
           drawHeatingSourceLoss = true;
        }

        if(drawHeatingSourceLoss){
           ratio = (convertedResult.heatingSourceLoss + convertedResult.warmWaterHeatingSourceLoss)/overallValue;
           currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0x700A0A,ratio);
        }

        var enProductGain:Number = convertedResult.enPersonGain + convertedResult.enElectricityGain;
        var enSolGain:Number = convertedResult.enSolGain;
        var enCollectorsGain:Number = convertedResult.enCollectorSolarGain;

        if(yearlyMode){
           enProductGain = convertedResult.enHeatingProductAggregated;
           enSolGain = convertedResult.enSolGainAggregated;
           enCollectorsGain = Math.min(enCollectorsGain,convertedResult.enWarmWater);
        }

        ratio = convertedResult.enWarmWater/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFF0000,ratio);

        ratio = convertedResult.enWalls/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xF24848,ratio);

        ratio = convertedResult.enRoof/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFF6464,ratio);

        ratio = (convertedResult.enFloor )/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFF8A8A,ratio);

        ratio = convertedResult.enWindows/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFFC6C6,ratio);

        ratio = (convertedResult.enFoundations)/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFFECEC,ratio);

        ratio = enVent/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFFE88C,ratio);

        ratio = convertedResult.enAir/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFDD65E,ratio);

        ratio = convertedResult.enTightness/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFFBC79,ratio);

        ratio = enSolGain/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xADE7A3,ratio);

        ratio = enProductGain/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xD3F1CD,ratio);

        ratio = enCollectorsGain/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0x00FF00,ratio);

    }

    private function drawRect(g:Graphics,unscaledWidth:Number,unscaledHeight:Number,x:Number,y:Number,color:int,ratio:Number):Number {
        g.beginFill(color);
        g.drawRect(0,y,unscaledWidth,unscaledHeight * ratio);
        g.endFill();
        return y + unscaledHeight * ratio;
    }
}
}
