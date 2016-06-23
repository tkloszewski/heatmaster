/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 16.07.13
 * Time: 08:18
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import mx.collections.ArrayList;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.DoorTypeConfig;

public class DoorType extends BaseComboObject{

    private static var items:ArrayList = new ArrayList();

    private var _uValue:Number;

    public static var NON_ENERGY_SAVING:DoorType = new DoorType("hm.door.energy_intensive",3.4);
    public static var STANDARD:DoorType = new DoorType("hm.door.standard",2.6);
    public static var ENERGY_SAVING:DoorType = new DoorType("hm.door.energy_saving",1.4);
    public static var SUPER_ENERGY_SAVING:DoorType = new DoorType("hm.door.energy_intensive",0.8);

    public static function getDoorTypeById(id:String):DoorType {
        for(var i:int = 0;i < items.length;i++){
            var doorType:DoorType = items.getItemAt(i) as DoorType;
            if(doorType.getId() == id){
                return doorType;
            }
        }
        return null;
    }

    function DoorType(id:String,uValue:Number) {
        super(id);
        _uValue = uValue;
        items.addItem(this);
    }


    override public function dictionaryInitialized(config:DictionaryConfig):void {
        var doorTypeConfig:DoorTypeConfig = config.getDoorTypeById(getId());
        this._uValue = doorTypeConfig.uValue;
    }

    public function get uValue():Number {
        return _uValue;
    }
}
}
