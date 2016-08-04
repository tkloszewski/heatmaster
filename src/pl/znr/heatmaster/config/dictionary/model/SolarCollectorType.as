/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 13.07.13
 * Time: 10:59
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config.dictionary.model {
import flash.utils.Dictionary;

import mx.collections.ArrayList;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.model.BaseComboObject;

public class SolarCollectorType extends BaseComboObject{

    private static const valueMap:Dictionary = new Dictionary();

    public static const NONE_TYPE:int = 0;
    public static const FLAT_TYPE:int = 1;
    public static const VACUUM_TYPE:int = 2;

    private var _type:int;
    private var _efficiency:Number;
    private var _unitSurface:Number;
    private var _personPerCollector:int;

    public static function getSolarCollectorTypeById(_id:String):SolarCollectorType {
        return valueMap[_id] as SolarCollectorType;
    }

    function SolarCollectorType(id:String,type:int, efficiency:Number, unitSurface:Number, perPersonCount:int) {
        super(id);
        _type = type;
        _efficiency = efficiency;
        _unitSurface = unitSurface;
        _personPerCollector = perPersonCount;
        valueMap[id] = this;
    }

    public function isFlatCollector():Boolean {
        return type == FLAT_TYPE;
    }

    public function isVacuumCollector():Boolean {
        return type == VACUUM_TYPE;
    }

    public function get personPerCollector():int {
        return _personPerCollector;
    }

    public function get unitSurface():Number {
        return _unitSurface;
    }

    public function get efficiency():Number {
        return _efficiency;
    }

    public function get type():int {
        return _type;
    }
}
}