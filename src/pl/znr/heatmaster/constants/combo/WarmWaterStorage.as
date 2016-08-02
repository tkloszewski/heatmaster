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
