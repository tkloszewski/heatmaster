/**
 * Created by Dom on 2016-07-12.
 */
package pl.znr.heatmaster.ui.plot {
public class PlotData {

    private var _data:Object;

    private var _yMaxValue:Number;
    private var _yMinValue:Number;
    private var _yInterval:Number;

    public function PlotData() {
    }


    public function get data():Object {
        return _data;
    }

    public function set data(value:Object):void {
        _data = value;
    }

    public function get yMaxValue():Number {
        return _yMaxValue;
    }

    public function set yMaxValue(value:Number):void {
        _yMaxValue = value;
    }

    public function get yMinValue():Number {
        return _yMinValue;
    }

    public function set yMinValue(value:Number):void {
        _yMinValue = value;
    }

    public function get yInterval():Number {
        return _yInterval;
    }

    public function set yInterval(value:Number):void {
        _yInterval = value;
    }
}
}
