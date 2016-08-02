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
