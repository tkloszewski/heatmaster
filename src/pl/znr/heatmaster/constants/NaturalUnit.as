/**
 * Created by Dom on 2016-06-27.
 */
package pl.znr.heatmaster.constants {
import flash.utils.Dictionary;

public class NaturalUnit {

    private static var naturalUnits:Dictionary = new Dictionary();

    private var _code:String;

    public static var TONNE:NaturalUnit = new NaturalUnit("hm.natural_unit.tonne");
    public static var M3:NaturalUnit = new NaturalUnit("hm.natural_unit.m3");
    public static var KG:NaturalUnit = new NaturalUnit("hm.natural_unit.kg");
    public static var GJ:NaturalUnit = new NaturalUnit("hm.natural_unit.gj");
    public static var KWH:NaturalUnit = new NaturalUnit("hm.natural_unit.kwh");


    public function NaturalUnit(code:String){
        naturalUnits[code] = this;
        this._code = code;
    }

    public function get code():String {
        return _code;
    }

    public static function getNaturalUnitByCode(code:String):NaturalUnit {
        return naturalUnits[code];
    }
}
}
