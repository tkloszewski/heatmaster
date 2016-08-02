/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 12:34
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import mx.collections.ArrayList;

import pl.znr.heatmaster.constants.HeatingType;

import pl.znr.heatmaster.constants.HeatingType;

import pl.znr.heatmaster.constants.NaturalUnit;

public class HeatingSourceType extends BaseComboObject{

    private static var items:ArrayList = new ArrayList();

    public static var BIOMASS_PELLETS:HeatingSourceType = new HeatingSourceType("hm.heating-source.biomass-pellets", NaturalUnit.TONNE, 500, 17500, 75, 0.403, 0.2, true,false);
    public static var BIOMASS_WOOD:HeatingSourceType = new HeatingSourceType("hm.heating-source.biomass-wood", NaturalUnit.TONNE, 360, 15600, 70, 0.403, 0.2, true,false);
    public static var COMBINED_HEAT:HeatingSourceType = new HeatingSourceType("hm.heating-source.combined_heat", NaturalUnit.GJ, 50, 1000, 97, 0.449, 1.3, false, false);
    public static var COMBINED_ELECTRIC_HEAT:HeatingSourceType = new HeatingSourceType("hm.heating-source.combined_electric_heat",NaturalUnit.GJ, 50, 1000, 97, 0.247, 0.8, false, false);
    public static var FURNACE:HeatingSourceType = new HeatingSourceType("hm.heating-source.coal-furnace", NaturalUnit.TONNE, 750, 26010, 40, 0.338, 1.1, true, true);
    public static var COAL_OLD:HeatingSourceType = new HeatingSourceType("hm.heating-source.coal-old", NaturalUnit.TONNE, 750, 26010, 60, 0.338, 1.1, true, true);
    public static var COAL_MODERN:HeatingSourceType = new HeatingSourceType("hm.heating-source.coal-new", NaturalUnit.TONNE, 750, 26010, 80, 0.338, 1.1, true, true);
    public static var BOILER_GAS_OLD:HeatingSourceType = new HeatingSourceType("hm.heating-source.boiler_gas_old", NaturalUnit.M3, 2, 36.03, 65, 0.202, 1.1, true, false);
    public static var BOILER_GAS_MODERN:HeatingSourceType = new HeatingSourceType("hm.heating-source.boiler_gas_new", NaturalUnit.M3, 2, 36.03, 85, 0.202, 1.1, true, false);
    public static var BOILER_GAS_CONDENSING:HeatingSourceType = new HeatingSourceType("hm.heating-source.boiler_gas_condensing", NaturalUnit.M3, 2, 36.03, 95, 0.202, 1.1, true, false);
    public static var BOILER_PROPAN_STANDARD:HeatingSourceType = new HeatingSourceType("m.heating-source.boiler_propan_standard", NaturalUnit.KG, 2, 47.3, 85, 0.227, 1.1, true, false);
    public static var BOILER_PROPAN_CONDENSING:HeatingSourceType = new HeatingSourceType("hm.heating-source.boiler_propan_condensing", NaturalUnit.KG, 2, 47.3, 95, 0.227, 1.1, true, false);
    public static var GAS_ELECTRIC_HEATER:HeatingSourceType = new HeatingSourceType("hm.heating-source.gas_electric_heater", NaturalUnit.M3, 2, 36.03, 90, 0.202, 1.1, true, false);
    public static var GAS_HEATER:HeatingSourceType = new HeatingSourceType("hm.heating-source.gas_heater", NaturalUnit.M3, 2, 36.03, 70, 0.202, 1.1, true, false);
    public static var BOILER_OIL_LIGHT:HeatingSourceType = new HeatingSourceType("hm.heating-source.boiler_oil_light", NaturalUnit.KG, 4.75, 43, 85, 0.266, 1.1, true, false);
    public static var BOILER_OIL_HEAVY:HeatingSourceType = new HeatingSourceType("hm.heating-source.boiler_oil_heavy", NaturalUnit.TONNE, 4000, 40400, 85, 0.278, 1.1, true, false);
    public static var ELECTRIC:HeatingSourceType = new HeatingSourceType("hm.heating-source.electric", NaturalUnit.KWH, 0.6, 3.6, 100, 0.890, 3.0, false, false);
    public static var HEAT_PUMP:HeatingSourceType = new HeatingSourceType("hm.heating-source.heat_pump",NaturalUnit.KWH, 0.6, 3.6, 350, 0.890, 3.0, false, false);

    private var _efficiency:Number = 1;
    private var _naturalUnit:NaturalUnit;
    private var _naturalUnitPrice:Number;
    private var _heatingValueMJ:Number;
    private var _emissionPerKWh:Number;
    private var _finalToPrimaryCoefficient:Number;
    private var _pricePerKWh:Number;
    private var _showNaturalUnit:Boolean;
    private var _heatingValueEditable:Boolean;

    private var _heatingType:HeatingType;

    public static function getHeatingSourceTypeById(_id:String):HeatingSourceType {
        for(var i:int = 0;i < items.length;i++){
            var heatingSourceType:HeatingSourceType = items.getItemAt(i) as HeatingSourceType;
            if(heatingSourceType.getId() == _id){
               return heatingSourceType;
            }
        }
        return null;
    }

    public static function isOfGasType(heatingSourceType:HeatingSourceType):Boolean {
        return heatingSourceType.heatingType == HeatingType.GAS;
    }

    public static function isOfOilType(heatingSourceType:HeatingSourceType):Boolean {
        return heatingSourceType.heatingType == HeatingType.OIL;
    }

    public static function isOfElectricType(heatingSourceType:HeatingSourceType):Boolean {
        return heatingSourceType.heatingType == HeatingType.ELECTRIC;
    }

    public static function isOfCoalType(heatingSourceType:HeatingSourceType):Boolean {
       return heatingSourceType.heatingType = HeatingType.COAL;
    }

    public static function isOfCombinedType(heatingSourceType:HeatingSourceType):Boolean {
        return heatingSourceType.heatingType == HeatingType.COMBINED;
    }

    public static function isOfPelletsType(heatingSourceType:HeatingSourceType):Boolean {
        return heatingSourceType.heatingType == HeatingType.PELLETS;
    }

    public static function isOfWoodType(heatingSourceType:HeatingSourceType):Boolean {
        return heatingSourceType.heatingType == HeatingType.WOOD;
    }

    public static function toPricePerKWh(naturalUnitPrice:Number,heatingValueMJ:Number):Number{
        return naturalUnitPrice/heatingValueMJ * 3.6;
    }

    public static function toNaturalPrice(pricePerKWh:Number,heatingValueMJ:Number):Number{
        return heatingValueMJ/3.6 * pricePerKWh;
    }

    function HeatingSourceType(_id:String,naturalUnit:NaturalUnit,naturalUnitPrice:Number,heatingValueMJ:Number, efficiency:Number,emissionPerKWh:Number, finalToPrimaryCoefficient:Number,
                               showNaturalUnit:Boolean,heatingValueEditable:Boolean)
    {
        super(_id);
        _naturalUnit = naturalUnit;
        _naturalUnitPrice = naturalUnitPrice;
        _heatingValueMJ= heatingValueMJ;
        _efficiency = efficiency;
        _emissionPerKWh = emissionPerKWh;
        _finalToPrimaryCoefficient = finalToPrimaryCoefficient;
        _pricePerKWh = toPricePerKWh(naturalUnitPrice,heatingValueMJ);
        _showNaturalUnit = showNaturalUnit;
        _heatingValueEditable = heatingValueEditable;
        items.addItem(this);
    }

    public function get efficiency():Number {
        return _efficiency;
    }

    public function get emissionPerKWh():Number {
        return _emissionPerKWh;
    }

    public function get pricePerkWh():Number {
        return _pricePerKWh;
    }

    public function get finalToPrimaryCoefficient():Number {
        return _finalToPrimaryCoefficient;
    }

    public function get naturalUnitPrice():Number {
        return _naturalUnitPrice;
    }

    public function get heatingValueMJ():Number {
        return _heatingValueMJ;
    }

    public function get naturalUnit():NaturalUnit {
        return _naturalUnit;
    }

    public function get showNaturalUnit():Boolean {
        return _showNaturalUnit;
    }

    public function get heatingValueEditable():Boolean {
        return _heatingValueEditable;
    }

    public function get heatingType():HeatingType {
        return _heatingType;
    }

    public function set heatingType(value:HeatingType):void {
        _heatingType = value;
    }
}
}
