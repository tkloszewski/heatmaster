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
import pl.znr.heatmaster.ui.plot.SplitColumnData;

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

            g.lineStyle(1,0x808080);

            var renderMode:RenderMode = _chartItem.item.renderMode;
            if(ColumnMode.isAggregatedMode(renderMode.columnMode)){
                drawRect(g, unscaledWidth, unscaledHeight, 0, 0, 0xF24848, 1);
            }
            else {
                var range:Number = _chartItem.item.enLosses - _chartItem.item.enGains;
                var splitColumnData:SplitColumnData = _chartItem.item.columnData;
                renderSplitRect(splitColumnData, range, g, unscaledWidth, unscaledHeight);
            }

        } catch (e:Error) {
            Alert.show("Error while plotting " + e.message);
            trace("Error while plotting " + e.message);
        }
    }

    private function renderSplitRect(splitColumnData:SplitColumnData,overallValue:Number,g:Graphics,unscaledWidth:Number,unscaledHeight:Number):void {
        var currentY:Number = 0;
        var ratio:Number = 1;

        ratio = splitColumnData.enHeatingSourceLoss/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0x700A0A,ratio);

        ratio = splitColumnData.enWarmWater/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFF0000,ratio);

        ratio = splitColumnData.enWalls/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xF24848,ratio);

        ratio = splitColumnData.enRoof/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFF6464,ratio);

        ratio = (splitColumnData.enFloor )/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFF8A8A,ratio);

        ratio = splitColumnData.enWindows/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFFC6C6,ratio);

        ratio = (splitColumnData.enFoundations)/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFFECEC,ratio);

        ratio = splitColumnData.enVent/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFFE88C,ratio);

        ratio = splitColumnData.enAir/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFDD65E,ratio);

        ratio = splitColumnData.enTightness/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFFBC79,ratio);

        ratio = splitColumnData.enSolGain/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xADE7A3,ratio);

        ratio = splitColumnData.enProductGain/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xD3F1CD,ratio);

        ratio = splitColumnData.enCollectorsGain/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0x00FF00,ratio);

        ratio = splitColumnData.enHeatingSourceGain/overallValue;
        currentY = drawRect(g, unscaledWidth,unscaledHeight,0, currentY,0x185218,ratio);
    }

    private function drawRect(g:Graphics,unscaledWidth:Number,unscaledHeight:Number,x:Number,y:Number,color:int,ratio:Number):Number {
        g.beginFill(color);
        g.drawRect(0,y,unscaledWidth,unscaledHeight * ratio);
        g.endFill();
        return y + unscaledHeight * ratio;
    }
}
}
