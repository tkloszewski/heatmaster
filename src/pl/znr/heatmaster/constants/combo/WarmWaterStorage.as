/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 13.07.13
 * Time: 13:56
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import mx.collections.ArrayList;

public class WarmWaterStorage extends BaseComboObject{

    private static var items:ArrayList = new ArrayList();

    private var _efficiency:Number;

    public static var HEAT_NODE_WITHOUT_STORAGE:WarmWaterStorage = new WarmWaterStorage("1",1.0);
    public static var MODERN_STORAGE:WarmWaterStorage = new WarmWaterStorage("2",0.85);
    public static var STANDARD_80_90_STORAGE:WarmWaterStorage = new WarmWaterStorage("3",0.65);
    public static var OLD_STORAGE:WarmWaterStorage = new WarmWaterStorage("4",0.50);

    public static function getWarmWaterStorageById(id:String):WarmWaterStorage {
        for(var i:int = 0;i < items.length;i++){
            var warmWaterStorage:WarmWaterStorage = items.getItemAt(i) as WarmWaterStorage;
            if(warmWaterStorage.getId() == id){
                return warmWaterStorage;
            }
        }
        return null;
    }

    public function WarmWaterStorage(id:String,efficiency:Number) {
        super(id);
        this._efficiency = efficiency;

        items.addItem(this);
    }

    public function get efficiency():Number {
        return _efficiency;
    }
}
}
