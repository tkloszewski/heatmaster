/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 30.06.13
 * Time: 16:11
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.components {
import flash.display.Graphics;

import mx.charts.series.items.ColumnSeriesItem;
import mx.controls.Alert;
import mx.core.IDataRenderer;
import mx.skins.ProgrammaticSkin;

import pl.znr.heatmaster.constants.combo.ConversionUnits;

import pl.znr.heatmaster.core.converter.ConvertedResult;

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

            var convertedResult:ConvertedResult = _chartItem.item.convertedResult as ConvertedResult;
            var overallValue:Number = convertedResult.getEnLosses() + convertedResult.getEnGains();
            var conversionUnit:int =  _chartItem.item.conversionUnit;

            g.lineStyle(1,0x808080);

            if(!ConversionUnits.isCostUnit(conversionUnit) && !ConversionUnits.isEmisionUnit(conversionUnit)){

                renderEnergyRect(convertedResult,overallValue,g,unscaledWidth,unscaledHeight);
            }
            else {
                drawRect(g,unscaledWidth,unscaledHeight,0,0,0xF24848,1);
            }
        } catch (e:Error) {
            Alert.show("Error while plotting " + e.message);
            trace("Error while plotting " + e.message);
        }
    }

    private function renderEnergyRect(convertedResult:ConvertedResult,overallValue:Number,g:Graphics,unscaledWidth:Number,unscaledHeight):void {
        var currentY:Number = 0;
        var ratio:Number = 1;


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

        ratio = (convertedResult.enVent )/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFFE88C,ratio);

        ratio = convertedResult.enAir/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFDD65E,ratio);

        ratio = convertedResult.enTightness/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xFFBC79,ratio);

        ratio = convertedResult.enSolGain/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xADE7A3,ratio);

        ratio = (convertedResult.enPersonGain + convertedResult.enElectricityGain)/overallValue;
        currentY = drawRect(g,unscaledWidth,unscaledHeight,0,currentY,0xD3F1CD,ratio);

        ratio = convertedResult.enCollectorSolarGain/overallValue;
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
