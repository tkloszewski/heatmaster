/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 16.07.13
 * Time: 08:18
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config.dictionary.model {
import flash.utils.Dictionary;

import pl.znr.heatmaster.config.dictionary.model.BaseComboObject;

public class DoorType extends BaseComboObject{

    private static const valuesMap:Dictionary = new Dictionary();

    private var _uValue:Number;

    public static function getDoorTypeById(id:String):DoorType {
        return valuesMap[id] as DoorType;
    }

    function DoorType(id:String,uValue:Number) {
        super(id);
        _uValue = uValue;
        valuesMap[id] = this;
    }

    public function get uValue():Number {
        return _uValue;
    }
}
}
