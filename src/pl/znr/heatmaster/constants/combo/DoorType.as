/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 16.07.13
 * Time: 08:18
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import flash.utils.Dictionary;

public class DoorType extends BaseComboObject{

    private static const valuesMap:Dictionary = new Dictionary();

    private var _uValue:Number;

    public static var NON_ENERGY_SAVING:DoorType = new DoorType("hm.door.energy_intensive",3.4);
    public static var STANDARD:DoorType = new DoorType("hm.door.standard",2.6);
    public static var ENERGY_SAVING:DoorType = new DoorType("hm.door.energy_saving",1.4);
    public static var SUPER_ENERGY_SAVING:DoorType = new DoorType("hm.door.super_energy_saving",0.8);

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
