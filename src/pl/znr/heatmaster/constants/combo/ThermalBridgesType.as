/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 14.05.15
 * Time: 20:46
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import flash.utils.Dictionary;

import mx.collections.ArrayList;

public class ThermalBridgesType extends BaseComboObject{

    private static const valuesMap:Dictionary = new Dictionary();

    public static var MAX:ThermalBridgesType = new ThermalBridgesType("hm.thermal-bridge.max",0.45);
    public static var AVG:ThermalBridgesType = new ThermalBridgesType("hm.thermal-bridge.avg",0.2);
    public static var MIN:ThermalBridgesType = new ThermalBridgesType("hm.thermal-bridge.min",0.08);

    private var _uValue:Number;

    public static function getThermalBridgesTypeById(_id:String):ThermalBridgesType {
        return valuesMap[_id] as ThermalBridgesType;
    }

    public function ThermalBridgesType(id:String,uValue:Number) {
        super(id);
        this._uValue = uValue;
        valuesMap[id] = this;
    }

    public function get uValue():Number {
        return _uValue;
    }
}
}
