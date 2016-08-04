/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 18:53
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config.dictionary.model {
import pl.znr.heatmaster.constants.combo.*;

import flash.utils.Dictionary;

public class AirTightness extends BaseComboObject{

    public static const valuesMap:Dictionary = new Dictionary();

    private var _value:Number;

    public function AirTightness(id:String,value:Number) {
        super(id);
        valuesMap[id] = this;
        this._value = value;
    }

    public static function getAirTightnessById(id:String):AirTightness {
        return valuesMap[id] as AirTightness;
    }

    public function get value():Number {
        return _value;
    }




}
}
