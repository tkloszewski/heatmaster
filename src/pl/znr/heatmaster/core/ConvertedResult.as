/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 08:19
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {

public class ConvertedResult {

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
    private var _enCollectorSolarGain:Number = 0;
    private var _enElectricityGain:Number = 0;

    private var _heatingSourceLoss:Number = 0;
    private var _warmWaterHeatingSourceLoss:Number = 0;
    private var _enHouseBalance:Number = 0.0;

    private var _enWarmWaterNormalized:Number = 0;
    private var _enWarmWaterNormalizedHeatingSourceLoss:Number = 0;

    public function ConvertedResult() {
    }

    public function toString():String{
        return "enWalls: " + _enWalls + " enFloor: " + _enFloor + "\n" +
                "enRoof " + _enRoof  + "enWindows: " + _enWindows + " enVent: " + _enVent + "\n" +
                "enAir: " + _enAir + " enPersonGain: " + _enPersonGain + "\n" +
                "enSolGain: " + _enSolGain + " enElectricityGain: " + _enElectricityGain;
    }


    public function getBalanceValue():Number {
        return Math.max(getHeatingBalance(),0) + getWarmWaterBalance() + _enRecuperator;
    }

    public function getEfficiencyAwareBalanceValue():Number {
        return Math.max(0,getBalanceValue() + _heatingSourceLoss + _warmWaterHeatingSourceLoss);
    }

    public function getEfficiencyAwareHeatingBalanceValue():Number {
        var heatingBalance:Number = Math.max(0,getHeatingBalance(),0);
        return Math.max(0,heatingBalance + _heatingSourceLoss);
    }

    public function getEfficiencyAwareWarmWaterBalanceValue():Number {
        var heatingBalance:Number = Math.max(0,getHeatingBalance(),0);
        return Math.max(0,getWarmWaterBalance() + _warmWaterHeatingSourceLoss);
    }

    public function getEfficiencyAndEnergyClassAwareWarmWaterBalanceValue():Number {
        var heatingBalance:Number = Math.max(0,getHeatingBalance(),0);
        return Math.max(0,getWarmWaterNormalizedBalance() + _enWarmWaterNormalizedHeatingSourceLoss);
    }

    public function getHeatingBalance():Number {
        return getHeatingLosses() - getHeatingGains();
    }

    public function getHeatingBalanceWithoutAiring():Number {
        return getHeatingLossesWithoutAiring() - getHeatingGains();
    }

    public function getEnBalanceValueWithoutWarmWaterAndRecuperator():Number{
        return getEnLossesWithoutWarmWaterAndRecuperator() - getEnGainsWithoutCollectors();
    }

    public function getEnLosses():Number {
        return (Math.max(_enWalls,0) + Math.max(_enRoof,0) + Math.max(_enFloor,0) +
                Math.max(0,_enFoundations) + Math.max(_enWindows,0) + Math.max(_enVent,0) +
                Math.max(_enAir,0) + Math.max(_enTightness,0) + Math.max(_enWarmWater,0) +
                Math.max(_enRecuperator,0)
                );
    }

    public function getEnLossesWithoutWarmWater():Number {
        return getEnLosses() - Math.max(0,_enWarmWater);
    }

    public function getEnLossesWithoutWarmWaterAndRecuperator():Number {
        return getEnLosses() - Math.max(0,_enWarmWater) - Math.max(0,_enRecuperator);
    }

    public function getHeatingLosses():Number {
        return (Math.max(_enWalls,0) + Math.max(_enRoof,0) + Math.max(_enFloor,0) +
                Math.max(0,_enFoundations) + Math.max(_enWindows,0) + Math.max(_enVent,0) +
                Math.max(_enAir,0) + Math.max(_enTightness,0));
    }

    public function getHeatingGains():Number {
        return (_enElectricityGain + _enPersonGain + _enSolGain + _enWarmWaterGain);
    }

    public function getHeatingLossesWithoutAiring():Number {
        return getHeatingLosses() - Math.max(_enAir,0);
    }


    public function getWarmWaterBalance():Number {
        return Math.max(0,_enWarmWater - _enCollectorSolarGain);
    }

    public function getWarmWaterNormalizedBalance():Number{
        return Math.max(0,_enWarmWaterNormalized - _enCollectorSolarGain);
    }

    public function getEnGains():Number {
        return (_enElectricityGain + _enPersonGain + _enSolGain + _enWarmWaterGain +
                Math.max(Math.min(_enCollectorSolarGain,_enWarmWater),0));
    }

    public function getEnGainsWithoutCollectors():Number {
        return getEnGains() - Math.max(Math.min(_enCollectorSolarGain,_enWarmWater),0);
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


    public function get enWarmWater():Number {
        return _enWarmWater;
    }

    public function set enWarmWater(value:Number):void {
        _enWarmWater = value;
    }

    public function get enWarmWaterGain():Number {
        return _enWarmWaterGain;
    }

    public function set enWarmWaterGain(value:Number):void {
        _enWarmWaterGain = value;
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

    public function get enPersonGain():Number {
        return _enPersonGain;
    }

    public function set enPersonGain(value:Number):void {
        _enPersonGain = value;
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

    public function set enHouseBalance(value:Number):void {
        _enHouseBalance = value;
    }


    public function get heatingSourceLoss():Number {
        return _heatingSourceLoss;
    }

    public function set heatingSourceLoss(value:Number):void {
        _heatingSourceLoss = value;
    }

    public function get warmWaterHeatingSourceLoss():Number {
        return _warmWaterHeatingSourceLoss;
    }

    public function set warmWaterHeatingSourceLoss(value:Number):void {
        _warmWaterHeatingSourceLoss = value;
    }


    public function get enWarmWaterNormalized():Number {
        return _enWarmWaterNormalized;
    }

    public function set enWarmWaterNormalized(value:Number):void {
        _enWarmWaterNormalized = value;
    }

    public function get enWarmWaterNormalizedHeatingSourceLoss():Number {
        return _enWarmWaterNormalizedHeatingSourceLoss;
    }

    public function set enWarmWaterNormalizedHeatingSourceLoss(value:Number):void {
        _enWarmWaterNormalizedHeatingSourceLoss = value;
    }
}
}
