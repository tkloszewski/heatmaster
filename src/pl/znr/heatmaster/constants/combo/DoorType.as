/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 16.07.13
 * Time: 08:18
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import mx.collections.ArrayList;

public class DoorType extends BaseComboObject{

    private static var items:ArrayList = new ArrayList();

    private var _uValue:Number;

    public static var NON_ENERGY_SAVING:DoorType = new DoorType("1",3.4);
    public static var STANDARD:DoorType = new DoorType("2",2.6);
    public static var ENERGY_SAVING:DoorType = new DoorType("3",1.4);
    public static var SUPER_ENERGY_SAVING:DoorType = new DoorType("4",0.8);

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



    public function get uValue():Number {
        return _uValue;
    }
}
}
