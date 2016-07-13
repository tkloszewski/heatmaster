/**
 * Created by Dom on 2016-07-13.
 */
package pl.znr.heatmaster.ui.plot {
public class SplitColumnData {

    [Bindable] private var _enHeatingSourceLoss:Number;
    [Bindable] private var _enWarmWater:Number;
    [Bindable] private var _enWalls:Number;
    [Bindable] private var _enRoof:Number;
    [Bindable] private var _enFloor:Number;
    [Bindable] private var _enWindows:Number;
    [Bindable] private var _enFoundations:Number;
    [Bindable] private var _enVent:Number;
    [Bindable] private var _enAir:Number;
    [Bindable] private var _enTightness:Number;
    [Bindable] private var _enSolGain:Number;
    [Bindable] private var _enProductGain:Number;
    [Bindable] private var _enCollectorsGain:Number;
    [Bindable] private var _enHeatingSourceGain:Number;

    [Bindable] private var _insulationAndWarmWaterGroup:Number;
    [Bindable] private var _ventilationGroup:Number;
    [Bindable] private var _enGainsGroup:Number;

    [Bindable] private var _enBalance:Number;

    public function SplitColumnData() {
    }

    public function get enHeatingSourceLoss():Number {
        return _enHeatingSourceLoss;
    }

    public function set enHeatingSourceLoss(value:Number):void {
        _enHeatingSourceLoss = value;
    }

    public function get enWarmWater():Number {
        return _enWarmWater;
    }

    public function set enWarmWater(value:Number):void {
        _enWarmWater = value;
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

    public function get enWindows():Number {
        return _enWindows;
    }

    public function set enWindows(value:Number):void {
        _enWindows = value;
    }

    public function get enFoundations():Number {
        return _enFoundations;
    }

    public function set enFoundations(value:Number):void {
        _enFoundations = value;
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

    public function get enSolGain():Number {
        return _enSolGain;
    }

    public function set enSolGain(value:Number):void {
        _enSolGain = value;
    }

    public function get enProductGain():Number {
        return _enProductGain;
    }

    public function set enProductGain(value:Number):void {
        _enProductGain = value;
    }

    public function get enCollectorsGain():Number {
        return _enCollectorsGain;
    }

    public function set enCollectorsGain(value:Number):void {
        _enCollectorsGain = value;
    }

    public function get enHeatingSourceGain():Number {
        return _enHeatingSourceGain;
    }

    public function set enHeatingSourceGain(value:Number):void {
        _enHeatingSourceGain = value;
    }

    public function get insulationAndWarmWaterGroup():Number {
        return _insulationAndWarmWaterGroup;
    }

    public function set insulationAndWarmWaterGroup(value:Number):void {
        _insulationAndWarmWaterGroup = value;
    }

    public function get ventilationGroup():Number {
        return _ventilationGroup;
    }

    public function set ventilationGroup(value:Number):void {
        _ventilationGroup = value;
    }

    public function get enGainsGroup():Number {
        return _enGainsGroup;
    }

    public function set enGainsGroup(value:Number):void {
        _enGainsGroup = value;
    }


    public function get enBalance():Number {
        return _enBalance;
    }

    public function set enBalance(value:Number):void {
        _enBalance = value;
    }
}
}
