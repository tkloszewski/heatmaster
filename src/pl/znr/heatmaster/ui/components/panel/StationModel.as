/**
 * Created by Dom on 2016-06-26.
 */
package pl.znr.heatmaster.ui.components.panel {
import pl.znr.heatmaster.core.calc.util.TemperatureCalculator;

public class StationModel {

    [Bindable]
    private var _t1:Number;
    [Bindable]
    private var _t2:Number;
    [Bindable]
    private var _t3:Number;
    [Bindable]
    private var _t4:Number;
    [Bindable]
    private var _t5:Number;
    [Bindable]
    private var _t6:Number;
    [Bindable]
    private var _t7:Number;
    [Bindable]
    private var _t8:Number;
    [Bindable]
    private var _t9:Number;
    [Bindable]
    private var _t10:Number;
    [Bindable]
    private var _t11:Number;
    [Bindable]
    private var _t12:Number;

    [Bindable]
    private var _tMin:Number;

    public function StationModel(temperatures:Array) {
        _t1 = temperatures[0];
        _t2 = temperatures[1];
        _t3 = temperatures[2];
        _t4 = temperatures[3];
        _t5 = temperatures[4];
        _t6 = temperatures[5];
        _t7 = temperatures[6];
        _t8 = temperatures[7];
        _t9 = temperatures[8];
        _t10 = temperatures[9];
        _t11 = temperatures[10];
        _t12 = temperatures[11];

        _tMin = TemperatureCalculator.calcMinTemperature(temperatures);
    }

    public function toArray():Array {
        var result:Array = new Array(12);
        result[0] = _t1;
        result[1] = _t2;
        result[2] = _t3;
        result[3] = _t4;
        result[4] = _t5;
        result[5] = _t6;
        result[6] = _t7;
        result[7] = _t8;
        result[8] = _t9;
        result[9] = _t10;
        result[10] = _t11;
        result[11] = _t12;
        return result;
    }

    [Bindable]
    public function get t1():Number {
        return _t1;
    }

    [Bindable]
    public function set t1(value:Number):void {
        _t1 = value;
    }

    public function get t2():Number {
        return _t2;
    }

    public function set t2(value:Number):void {
        _t2 = value;
    }

    public function get t3():Number {
        return _t3;
    }

    public function set t3(value:Number):void {
        _t3 = value;
    }

    public function get t4():Number {
        return _t4;
    }

    public function set t4(value:Number):void {
        _t4 = value;
    }

    public function get t5():Number {
        return _t5;
    }

    public function set t5(value:Number):void {
        _t5 = value;
    }

    public function get t6():Number {
        return _t6;
    }

    public function set t6(value:Number):void {
        _t6 = value;
    }

    public function get t7():Number {
        return _t7;
    }

    public function set t7(value:Number):void {
        _t7 = value;
    }

    public function get t8():Number {
        return _t8;
    }

    public function set t8(value:Number):void {
        _t8 = value;
    }

    public function get t9():Number {
        return _t9;
    }

    public function set t9(value:Number):void {
        _t9 = value;
    }

    public function get t10():Number {
        return _t10;
    }

    public function set t10(value:Number):void {
        _t10 = value;
    }

    public function get t11():Number {
        return _t11;
    }

    public function set t11(value:Number):void {
        _t11 = value;
    }

    public function get t12():Number {
        return _t12;
    }

    public function set t12(value:Number):void {
        _t12 = value;
    }

    public function get tMin():Number {
        return _tMin;
    }

    public function set tMin(value:Number):void {
        _tMin = value;
    }
}
}
