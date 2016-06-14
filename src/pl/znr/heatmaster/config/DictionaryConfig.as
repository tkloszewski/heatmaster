/**
 * Created by Dom on 2016-06-14.
 */
package pl.znr.heatmaster.config {
import flash.utils.Dictionary;

import pl.znr.heatmaster.constants.combo.DoorType;

public class DictionaryConfig {

    private var _doorTypesConfig:Dictionary;

    public function DictionaryConfig() {
    }


    public function getDoorTypeById(id:String):DoorTypeConfig {
        new DoorType("",1);
        return _doorTypesConfig[id] as DoorTypeConfig;
    }

    public function get doorTypesConfig():Dictionary {
        return _doorTypesConfig;
    }

    public function set doorTypesConfig(value:Dictionary):void {
        _doorTypesConfig = value;
    }
}
}
