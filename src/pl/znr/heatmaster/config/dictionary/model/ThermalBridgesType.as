/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 14.05.15
 * Time: 20:46
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config.dictionary.model {
import flash.utils.Dictionary;

import mx.collections.ArrayList;

import pl.znr.heatmaster.config.dictionary.model.BaseComboObject;

public class ThermalBridgesType extends BaseComboObject{

    private static const valuesMap:Dictionary = new Dictionary();

    private var _uValue:Number;
    private var _max:Boolean;

    public static function getThermalBridgesTypeById(_id:String):ThermalBridgesType {
        return valuesMap[_id] as ThermalBridgesType;
    }

    public function ThermalBridgesType(id:String,uValue:Number,max:Boolean = false) {
        super(id);
        this._uValue = uValue;
        this._max = max;
        valuesMap[id] = this;
    }

    public function get uValue():Number {
        return _uValue;
    }


    public function get max():Boolean {
        return _max;
    }
}
}
