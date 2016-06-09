/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 12.05.15
 * Time: 20:53
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import flash.utils.Dictionary;

import mx.collections.ArrayList;

public class HouseStandardType extends BaseComboObject{

    private static var items:ArrayList = new ArrayList();

    public static var OLD_NON_INSULATED:HouseStandardType = new HouseStandardType("1",0.8);
    public static var OLD_INSULATED:HouseStandardType = new HouseStandardType("2",0.35);
    public static var NEW_NORM_WT_2014:HouseStandardType = new HouseStandardType("3",0.15);
    public static var ENERGY_SAVING_NF40:HouseStandardType = new HouseStandardType("4",0.11);
    public static var PASSIVE_NF15:HouseStandardType = new HouseStandardType("5",0.09);
    public static var ADD:HouseStandardType = new HouseStandardType("6",0.09);

    private var _uValue:Number;

    public function HouseStandardType(id:String,uValue:Number) {
        super(id);
        this._uValue = uValue;
        items.addItem(this);
    }

    public static function getHouseStandardTypeById(_id:String):HouseStandardType {
        for(var i:int = 0;i < items.length;i++){
            var houseStandardType:HouseStandardType = items.getItemAt(i) as HouseStandardType;
            if(houseStandardType.getId() == _id){
                return houseStandardType;
            }
        }
        return null;
    }

    public function get uValue():Number {
        return _uValue;
    }
}
}
