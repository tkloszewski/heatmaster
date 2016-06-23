/**
 * Created by Dom on 2016-06-22.
 */
package pl.znr.heatmaster.util {
import mx.collections.ArrayCollection;

public class CollectionHelper {
    public function CollectionHelper() {
    }

    public static function getSelectedIndexByProperty(items:ArrayCollection,propertyName:String,value:String):int {
        var selectedIdx:int = 0;
        for (var i:int = 0; i < items.length; i++) {
            var item:Object = items.getItemAt(i);
            if (item[propertyName] == value) {
                selectedIdx = i;
                break;
            }
        }
        return selectedIdx;
    }
}
}
