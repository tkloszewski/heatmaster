/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 16:05
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc.model {
import mx.utils.NameUtil;

public class MonthEnergyData {

    private var _enWalls:Number = 0;
    private var _enRoof:Number = 0;
    private var _enFloor:Number = 0;
    private var _enFoundations:Number = 0;
    private var _enWindows:Number = 0;
    private var _enVent:Number = 0;
    private var _enRecuperator:Number = 0;
    private var _enAir:Number = 0;
    private var _enTightness:Number = 0;
    private var _enWarmWater:Number = 0;
    private var _enPersonGain:Number = 0;
    private var _enWarmWaterGain:Number = 0;
    private var _enSolGain:Number = 0;
    private var _enElectricityGain:Number = 0;
    private var _enCollectorSolarGain:Number = 0;

    private var _enWarmWaterNormalized:Number = 0;

    public function toString(){
        return "enWalls: " + _enWalls + " enFloor: " + _enFloor + "\n" +
               "enRoof " + _enRoof  + "enWindows: " + _enWindows + " enVent: " + _enVent + "\n" +
               "enAir: " + _enAir + " enWarmWater " + _enWarmWater + " enPersonGain: " + _enPersonGain + "\n" +
               "enSolGain: " + _enSolGain + " enElectricityGain: " + _enElectricityGain + " enWarmWater: \n" + _enWarmWater +
               "enWarmWaterNormalized:  " + _enWarmWaterNormalized ;
    }

    public function MonthEnergyData() {
    }


    public function get enWalls():Number {
        return _enWalls;
    }

    public function set enWalls(value:Number):void {
        _enWalls = value;
    }

    public function get enRoof():Number {
        return _enRoof;
    }

    public function set enRoof(value:Number):void {
        _enRoof = value;
    }

    public function get enFloor():Number {
        return _enFloor;
    }

    public function set enFloor(value:Number):void {
        _enFloor = value;
    }

    public function get enFoundations():Number {
        return _enFoundations;
    }

    public function set enFoundations(value:Number):void {
        _enFoundations = value;
    }

    public function get enWindows():Number {
        return _enWindows;
    }

    public function set enWindows(value:Number):void {
        _enWindows = value;
    }

    public function get enVent():Number {
        return _enVent;
    }

    public function set enVent(value:Number):void {
        _enVent = value;
    }

    public function get enAir():Number {
        return _enAir;
    }

    public function set enAir(value:Number):void {
        _enAir = value;
    }

    public function get enTightness():Number {
        return _enTightness;
    }

    public function set enTightness(value:Number):void {
        _enTightness = value;
    }

    public function get enWarmWater():Number {
        return _enWarmWater;
    }

    public function set enWarmWater(value:Number):void {
        _enWarmWater = value;
    }

    public function get enPersonGain():Number {
        return _enPersonGain;
    }

    public function set enPersonGain(value:Number):void {
        _enPersonGain = value;
    }

    public function get enWarmWaterGain():Number {
        return _enWarmWaterGain;
    }

    public function set enWarmWaterGain(value:Number):void {
        _enWarmWaterGain = value;
    }

    public function get enSolGain():Number {
        return _enSolGain;
    }

    public function set enSolGain(value:Number):void {
        _enSolGain = value;
    }

    public function get enCollectorSolarGain():Number {
        return _enCollectorSolarGain;
    }

    public function set enCollectorSolarGain(value:Number):void {
        _enCollectorSolarGain = value;
    }

    public function get enElectricityGain():Number {
        return _enElectricityGain;
    }

    public function set enElectricityGain(value:Number):void {
        _enElectricityGain = value;
    }

    public function get enRecuperator():Number {
        return _enRecuperator;
    }

    public function set enRecuperator(value:Number):void {
        _enRecuperator = value;
    }

    public function get enWarmWaterNormalized():Number {
        return _enWarmWaterNormalized;
    }

    public function set enWarmWaterNormalized(value:Number):void {
        _enWarmWaterNormalized = value;
    }
}
}
