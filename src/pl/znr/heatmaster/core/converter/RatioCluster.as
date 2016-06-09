/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 08:00
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.converter {
import mx.utils.NameUtil;

public class RatioCluster {

    private var _toCostRatio:Number;
    private var _toWattsRatio;Number;
    private var _tokWhRatio:Number;
    private var _toGJRatio:Number;
    private var _toEmissionRatio:Number;
    private var _toWarmWaterEmissionRatio:Number;

    public function RatioCluster() {
    }

    public function multiply(value:Number):RatioCluster {
        _toCostRatio *= value;
        _toWattsRatio *= value;
        _tokWhRatio *= value;
        return this;
    }

    public function get toWattsRatio():Number {
        return _toWattsRatio;
    }

    public function set toWattsRatio(value:Number):void {
        _toWattsRatio = value;
    }

    public function get toCostRatio():Number {
        return _toCostRatio;
    }

    public function set toCostRatio(value:Number):void {
        _toCostRatio = value;
    }

    public function get tokWhRatio():Number {
        return _tokWhRatio;
    }

    public function set tokWhRatio(value:Number):void {
        _tokWhRatio = value;
    }

    public function get toGJRatio():Number {
        return _toGJRatio;
    }

    public function set toGJRatio(value:Number):void {
        _toGJRatio = value;
    }


    public function get toEmissionRatio():Number {
        return _toEmissionRatio;
    }

    public function set toEmissionRatio(value:Number):void {
        _toEmissionRatio = value;
    }


    public function get toWarmWaterEmissionRatio():Number {
        return _toWarmWaterEmissionRatio;
    }

    public function set toWarmWaterEmissionRatio(value:Number):void {
        _toWarmWaterEmissionRatio = value;
    }
}
}
