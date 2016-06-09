/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: 30.10.12
 * Time: 18:21
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.components {
import flash.display.Graphics;
import flash.geom.Rectangle;

import mx.charts.GridLines;
import mx.charts.chartClasses.CartesianChart;
import mx.charts.chartClasses.ChartState;
import mx.charts.chartClasses.GraphicsUtilities;
import mx.charts.chartClasses.IAxisRenderer;
import mx.controls.Alert;
import mx.core.mx_internal;
import mx.graphics.IStroke;

use namespace mx_internal;


[Style(name="horizontalFill", type="mx.graphics.IFill", inherit="no")]
[Style(name="verticalAlternateFill", type="mx.graphics.IFill", inherit="no")]

public class DistinguishedGridLines extends GridLines{
    public function DistinguishedGridLines() {
        super();
    }

    private var _distinguishedTick:Number = -1;
    private var _distinguishedStroke:IStroke;


    public function get distinguishedStroke():IStroke {
        return _distinguishedStroke;
    }

    public function set distinguishedStroke(value:IStroke):void {
        _distinguishedStroke = value;
    }

    public function get distinguishedTick():Number {
        return _distinguishedTick;
    }

    public function set distinguishedTick(value:Number):void {
        _distinguishedTick = value;
    }



    override protected function updateDisplayList(unscaledWidth:Number,
                                                  unscaledHeight:Number):void
    {
        //super.updateDisplayList(unscaledWidth, unscaledHeight);

        var len:int;
        var c:Object;
        var stroke:IStroke;
        var changeCount:int;
        var ticks:Array /* of Number */;
        var spacing:Array /* of Number */;
        var axisLength:Number;
        var colors:Array /* of IFill */;
        var rc:Rectangle;
        var originStroke:IStroke;
        var addedFirstLine:Boolean;
        var addedLastLine:Boolean;
        var n:int;

        if (!chart||
                chart.chartState == ChartState.PREPARING_TO_HIDE_DATA ||
                chart.chartState == ChartState.HIDING_DATA)
        {
            return;
        }

        var g:Graphics = graphics;
        g.clear();

        var gridDirection:String = getStyle("gridDirection");
        if (gridDirection == "horizontal" || gridDirection == "both")
        {
            stroke = getStyle("horizontalStroke");

            changeCount = Math.max(1, getStyle("horizontalChangeCount"));
            if ((changeCount * 0 != 0) || changeCount <= 1)
                changeCount = 1;

            var verticalAxisRenderer:IAxisRenderer;

            if (!(CartesianChart(chart).verticalAxisRenderer))
            {
                verticalAxisRenderer = CartesianChart(chart).getLeftMostRenderer();
                if (!verticalAxisRenderer)
                    verticalAxisRenderer = CartesianChart(chart).getRightMostRenderer();
            }
            else
                verticalAxisRenderer = CartesianChart(chart).verticalAxisRenderer;

            ticks = verticalAxisRenderer.ticks;

            if (getStyle("horizontalTickAligned") == false)
            {
                len = ticks.length;
                spacing = [];
                n = len;
                for (var i:int = 1; i < n; i++)
                {
                    spacing[i - 1] = (ticks[i] + ticks[i - 1]) / 2;
                }
            }
            else
            {
                spacing = ticks;
            }

            addedFirstLine = false;
            addedLastLine = false;

            if (spacing[0] != 0)
            {
                addedFirstLine = true;
                spacing.unshift(0);
            }

            if (spacing[spacing.length - 1] != 1)
            {
                addedLastLine = true;
                spacing.push(1);
            }

            axisLength = unscaledHeight;

            colors = [ getStyle("horizontalFill"),
                getStyle("horizontalAlternateFill") ];

            len = spacing.length;

            if (spacing[len - 1] < 1)
            {
                c = colors[1];
                if (c != null)
                {
                    g.lineStyle(0, 0, 0);
                    GraphicsUtilities.fillRect(g, 0,
                            spacing[len - 1] * axisLength, unscaledWidth,
                            unscaledHeight, c);
                }
            }



            n = spacing.length;
            var showed:Boolean = false;
            for (i = 0; i < n; i += changeCount)
            {
                var idx:int = len - 1 - i;
                c = colors[(i / changeCount) % 2];
                var bottom:Number = spacing[idx] * axisLength;
                var top:Number =
                        spacing[Math.max(0, idx - changeCount)] * axisLength;
                rc = new Rectangle(0, top, unscaledWidth, bottom-top);

                if (c != null)
                {
                    g.lineStyle(0, 0, 0);
                    GraphicsUtilities.fillRect(g, rc.left, rc.top,
                            rc.right, rc.bottom, c);
                }

                var selectedStroke:IStroke = stroke;
                if(distinguishedTick == i && distinguishedStroke != null ){
                    selectedStroke = distinguishedStroke;
                }

                if (selectedStroke && rc.bottom >= -1) //round off errors
                {
                    if (addedFirstLine && idx == 0)
                        continue;
                    if (addedLastLine && idx == (spacing.length-1))
                        continue;

                    selectedStroke.apply(g,null,null);
                    g.moveTo(rc.left, rc.bottom);
                    g.lineTo(rc.right, rc.bottom);
                }
            }
        }

        if (gridDirection == "vertical" || gridDirection == "both")
        {

            stroke = getStyle("verticalStroke");
            changeCount = Math.max(1,getStyle("verticalChangeCount"));

            if (isNaN(changeCount) || changeCount <= 1)
                changeCount = 1;

            var horizontalAxisRenderer:IAxisRenderer;

            if (!(CartesianChart(chart).horizontalAxisRenderer))
            {
                horizontalAxisRenderer = CartesianChart(chart).getBottomMostRenderer();
                if (!horizontalAxisRenderer)
                    horizontalAxisRenderer = CartesianChart(chart).getTopMostRenderer();
            }
            else
                horizontalAxisRenderer = CartesianChart(chart).horizontalAxisRenderer;

            ticks = horizontalAxisRenderer.ticks.concat();

            if (getStyle("verticalTickAligned") == false)
            {
                len = ticks.length;
                spacing = [];
                n = len;
                for (i = 1; i < n; i++)
                {
                    spacing[i - 1] = (ticks[i] + ticks[i - 1]) / 2;
                }
            }
            else
            {
                spacing = ticks;
            }

            addedFirstLine = false;
            addedLastLine = false;

            if (spacing[0] != 0)
            {
                addedFirstLine = true;
                spacing.unshift(0);
            }

            if (spacing[spacing.length - 1] != 1)
            {
                addedLastLine = true;
                spacing.push(1);
            }

            axisLength = unscaledWidth;

            colors = [ getStyle("verticalFill"),
                getStyle("verticalAlternateFill") ];

            n = spacing.length;
            for (i = 0; i < n; i += changeCount)
            {
                c = colors[(i / changeCount) % 2];
                var left:Number = spacing[i] * axisLength;
                var right:Number =
                        spacing[Math.min(spacing.length - 1,
                                i + changeCount)] * axisLength;
                rc = new Rectangle(left, 0, right - left, unscaledHeight);
                if (c != null)
                {
                    g.lineStyle(0, 0, 0);
                    GraphicsUtilities.fillRect(g, rc.left, rc.top,
                            rc.right, rc.bottom, c);
                }

                if (stroke) // round off errors
                {
                    if (addedFirstLine && i == 0)
                        continue;
                    if (addedLastLine && i == spacing.length-1)
                        continue;

                    stroke.apply(g,null,null);
                    g.moveTo(rc.left, rc.top);
                    g.lineTo(rc.left, rc.bottom);
                }
            }
        }

        var horizontalShowOrigin:Object = getStyle("horizontalShowOrigin");
        var verticalShowOrigin:Object = getStyle("verticalShowOrigin");

        if (verticalShowOrigin || horizontalShowOrigin)
        {

            var cache:Array /* of Object */ = [ { xOrigin: 0, yOrigin: 0 } ];
            var sWidth:Number = 0.5;

            dataTransform.transformCache(cache, "xOrigin", "x", "yOrigin", "y");

            if (horizontalShowOrigin &&
                    cache[0].y > 0 && cache[0].y < unscaledHeight)
            {
                originStroke = getStyle("horizontalOriginStroke");
                originStroke.apply(g,null,null);
                g.moveTo(0, cache[0].y - sWidth / 2);
                g.lineTo($width, cache[0].y - sWidth / 2);
            }

            if (verticalShowOrigin &&
                    cache[0].x > 0 && cache[0].x < unscaledWidth)
            {
                originStroke = getStyle("verticalOriginStroke");
                originStroke.apply(g,null,null);
                g.moveTo(cache[0].x - sWidth / 2, 0);
                g.lineTo(cache[0].x - sWidth / 2, $height);
            }
        }
    }


}
}
