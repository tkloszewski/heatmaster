/**
 * Created by Dom on 2016-06-20.
 */
package pl.znr.heatmaster.config {
public class StationItem implements IEnvironmentalDataConfig{

    private var _code:String;
    private var _localeCode:String;
    private var _name:String;

    private var _defaultStation:Boolean;

    private var _minCalcTemp:Number;
    private var _temperatures:Array;
    private var _groundTemperatures:Array;
    private var _insolationS:Array;
    private var _insolationWE:Array;
    private var _insolationN:Array;
    private var _optimalInsolation:Array;

    private var _mapX:int;
    private var _mapY:int;

    public function StationItem() {
    }

    public function get code():String {
        return _code;
    }

    public function set code(value:String):void {
        _code = value;
    }

    public function get localeCode():String {
        return _localeCode;
    }

    public function set localeCode(value:String):void {
        _localeCode = value;
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
    }

    public function get temperatures():Array {
        return _temperatures;
    }

    public function set temperatures(value:Array):void {
        _temperatures = value;
    }

    public function get groundTemperatures():Array {
        return _groundTemperatures;
    }

    public function set groundTemperatures(value:Array):void {
        _groundTemperatures = value;
    }

    public function get insolationS():Array {
        return _insolationS;
    }

    public function set insolationS(value:Array):void {
        _insolationS = value;
    }

    public function get insolationWE():Array {
        return _insolationWE;
    }

    public function set insolationWE(value:Array):void {
        _insolationWE = value;
    }

    public function get insolationN():Array {
        return _insolationN;
    }

    public function set insolationN(value:Array):void {
        _insolationN = value;
    }

    public function get optimalInsolation():Array {
        return _optimalInsolation;
    }

    public function set optimalInsolation(value:Array):void {
        _optimalInsolation = value;
    }


    public function get mapX():int {
        return _mapX;
    }

    public function set mapX(value:int):void {
        _mapX = value;
    }

    public function get mapY():int {
        return _mapY;
    }

    public function set mapY(value:int):void {
        _mapY = value;
    }

    public function isDefaultStation():Boolean {
        return _defaultStation;
    }

    public function setDefaultStation(value:Boolean):void {
        _defaultStation = value;
    }


    public function set minCalcTemp(value:Number):void {
        _minCalcTemp = value;
    }

    public function get minCalcTemp():Number {
        return _minCalcTemp;
    }
}
}
