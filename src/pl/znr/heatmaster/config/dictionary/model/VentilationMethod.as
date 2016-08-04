/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 12:35
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config.dictionary.model {
import flash.utils.Dictionary;

import mx.utils.NameUtil;

import pl.znr.heatmaster.config.dictionary.model.BaseComboObject;

public class VentilationMethod extends BaseComboObject{

    private static const valuesMap:Dictionary = new Dictionary();

    public function VentilationMethod(id:String,type:int, efficiency:Number,naturalRegulated:Boolean = false) {
        super(id);
        _type = type;
        _efficiency = efficiency;
        _naturalRegulated = naturalRegulated;
        valuesMap[id] = this;
    }

    private var _type:int;
    private var _efficiency:Number = 0;
    private var _naturalRegulated:Boolean;


    public function get type():int {
        return _type;
    }

    public function get efficiency():Number{
        return _efficiency;
    }

    public function get naturalRegulated():Boolean {
        return _naturalRegulated;
    }

    public static const GRAVITATIONAL:int = 1;
    public static const MECHANICAL:int = 2;

    public static function getVentilationMethodById(id:String):VentilationMethod {
        return valuesMap[id] as VentilationMethod;
    }
}
}
