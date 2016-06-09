/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 12:34
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import mx.collections.ArrayList;
import mx.controls.Alert;

import pl.znr.heatmaster.constants.combo.HeatingSourceType;

public class HeatingSourceType extends BaseComboObject{

    private static var items:ArrayList = new ArrayList();

    public static var BIOMASS_PELLETS:HeatingSourceType = new HeatingSourceType("1",75,0.22,0.03,0.2,true,false,true,true);
    public static var BIOMASS_WOOD:HeatingSourceType = new HeatingSourceType("2",70,0.12,0.03,0.2,true,false,true,true);
    public static var COMBINED_HEAT:HeatingSourceType = new HeatingSourceType("3",97,0.22,0.4,1.3,true,true,true,true);
    public static var COMBINED_ELECTRIC_HEAT:HeatingSourceType = new HeatingSourceType("4",97,0.22,0.08,0.8,true,true,true,true);
    public static var FURNACE:HeatingSourceType = new HeatingSourceType("5",40,0.12,0.38,1.1,true,false,false,false);
    public static var COAL_OLD:HeatingSourceType = new HeatingSourceType("6",60,0.12,0.38,1.1,true,false,false,false);
    public static var COAL_MODERN:HeatingSourceType = new HeatingSourceType("7",80,0.12,0.38,1.1,true,false,false,false);
    public static var BOILER_GAS_OLD:HeatingSourceType = new HeatingSourceType("8",65,0.18,0.201,1.1,true,true,true,true);
    public static var BOILER_GAS_MODERN:HeatingSourceType = new HeatingSourceType("9",85,0.18,0.201,1.1,true,true,true,true);
    public static var BOILER_GAS_CONDENSING:HeatingSourceType = new HeatingSourceType("10",95,0.18,0.201,1.1,true,true,true,true);
    public static var BOILER_PROPAN_STANDARD:HeatingSourceType = new HeatingSourceType("11",85,0.32,0.225,1.1,true,true,true,true);
    public static var BOILER_PROPAN_CONDENSING:HeatingSourceType = new HeatingSourceType("12",95,0.32,0.225,1.1,true,true,true,true);
    public static var GAS_ELECTRIC_HEATER:HeatingSourceType = new HeatingSourceType("13",90,0.18,0.9,1.1,false,false,true,false);
    public static var GAS_HEATER:HeatingSourceType = new HeatingSourceType("14",70,0.18,0.201,1.1,false,false,true,false);
    public static var BOILER_OIL:HeatingSourceType = new HeatingSourceType("15",85,0.4,0.276,1.1,true,true,true,true);
    public static var ELECTRIC:HeatingSourceType = new HeatingSourceType("16",100,0.58,0.9,3.0,true,true,true,true);
    public static var HEAT_PUMP:HeatingSourceType = new HeatingSourceType("17",350,0.58,0.9,3.0,true,true,true,true);

    private var _efficiency:Number = 1;
    private var _pricePerkWh:Number;
    private var _emissionPerKWh:Number;
    private var _finalToPrimaryCoefficient:Number;

    private var _detachedAirHeatType:Boolean;
    private var _multiFamilyAirHeatType:Boolean;
    private var _detachedWarmHeatType:Boolean;
    private var _multiFamilyHeatType:Boolean;

    public static function getHeatingSourceTypeById(_id:String):HeatingSourceType {
        for(var i:int = 0;i < items.length;i++){
            var heatingSourceType:HeatingSourceType = items.getItemAt(i) as HeatingSourceType;
            if(heatingSourceType.getId() == _id){
               return heatingSourceType;
            }
        }
        return null;
    }

    public static function isOfGasType(heatingType:HeatingSourceType):Boolean {
        return heatingType == BOILER_GAS_OLD || heatingType == BOILER_GAS_MODERN || heatingType == BOILER_GAS_CONDENSING ||
               heatingType == BOILER_PROPAN_STANDARD || heatingType == BOILER_PROPAN_CONDENSING ||
               heatingType == GAS_ELECTRIC_HEATER || heatingType == GAS_HEATER;
    }

    public static function isOfOilType(heatingType:HeatingSourceType):Boolean {
        return heatingType == BOILER_OIL;
    }

    public static function isOfElectricType(heatingType:HeatingSourceType):Boolean {
        return heatingType == ELECTRIC || heatingType == HEAT_PUMP;
    }

    public static function isOfCoalType(heatingType:HeatingSourceType):Boolean {
       return heatingType == FURNACE || heatingType == COAL_OLD || heatingType == COAL_MODERN;
    }

    public static function isOfCombinedType(heatingType:HeatingSourceType):Boolean {
        return heatingType == COMBINED_HEAT || heatingType == COMBINED_ELECTRIC_HEAT;
    }

    public static function isOfPelletsType(heatingType:HeatingSourceType):Boolean {
        return heatingType == BIOMASS_PELLETS;
    }

    public static function isOfWoodType(heatingType:HeatingSourceType):Boolean {
        return heatingType == BIOMASS_WOOD;
    }

    function HeatingSourceType(_id:String,efficiency:Number, pricePerkWh:Number, emissionPerKWh:Number, finalToPrimaryCoefficient:Number, detachedAirHeatType:Boolean, multiFamilyAirHeatType:Boolean, detachedWarmHeatType:Boolean, multiFamilyHeatType:Boolean) {
        super(_id);
        _efficiency = efficiency;
        _pricePerkWh = pricePerkWh;
        _emissionPerKWh = emissionPerKWh;
        _finalToPrimaryCoefficient = finalToPrimaryCoefficient;
        _detachedAirHeatType = detachedAirHeatType;
        _multiFamilyAirHeatType = multiFamilyAirHeatType;
        _detachedWarmHeatType = detachedWarmHeatType;
        _multiFamilyHeatType = multiFamilyHeatType;

        items.addItem(this);
    }

    public function get efficiency():Number {
        return _efficiency;
    }

    public function get emissionPerKWh():Number {
        return _emissionPerKWh;
    }

    public function get pricePerkWh():Number {
        return _pricePerkWh;
    }

    public function get finalToPrimaryCoefficient():Number {
        return _finalToPrimaryCoefficient;
    }

    public function get detachedAirHeatType():Boolean {
        return _detachedAirHeatType;
    }

    public function get multiFamilyAirHeatType():Boolean {
        return _multiFamilyAirHeatType;
    }

    public function get detachedWarmHeatType():Boolean {
        return _detachedWarmHeatType;
    }

    public function get multiFamilyHeatType():Boolean {
        return _multiFamilyHeatType;
    }
}
}
