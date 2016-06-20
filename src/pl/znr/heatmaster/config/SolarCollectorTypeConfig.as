/**
 * Created by Dom on 2016-06-15.
 */
package pl.znr.heatmaster.config {
public class SolarCollectorTypeConfig {
    private var _id:String;
    private var _efficiency:Number;
    private var _unitSurface:Number;
    private var _personPerCollector:int;

    public function SolarCollectorTypeConfig(id:String, efficiency:Number, unitSurface:Number, personPerCollector:int) {
        _id = id;
        _efficiency = efficiency;
        _unitSurface = unitSurface;
        _personPerCollector = personPerCollector;
    }


    public function get id():String {
        return _id;
    }

    public function set id(value:String):void {
        _id = value;
    }

    public function get efficiency():Number {
        return _efficiency;
    }

    public function set efficiency(value:Number):void {
        _efficiency = value;
    }

    public function get unitSurface():Number {
        return _unitSurface;
    }

    public function set unitSurface(value:Number):void {
        _unitSurface = value;
    }

    public function get personPerCollector():int {
        return _personPerCollector;
    }

    public function set personPerCollector(value:int):void {
        _personPerCollector = value;
    }
}
}
