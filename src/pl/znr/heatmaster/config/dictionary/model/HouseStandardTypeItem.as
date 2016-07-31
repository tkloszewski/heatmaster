/**
 * Created by Dom on 2016-07-31.
 */
package pl.znr.heatmaster.config.dictionary.model {
import flash.utils.Dictionary;

import pl.znr.heatmaster.constants.combo.BaseComboObject;
import pl.znr.heatmaster.core.model.HouseStandardTypeModel;

public class HouseStandardTypeItem extends BaseComboObject{

    private static const valuesMap:Dictionary = new Dictionary();

    private var _houseStandardTypeModel:HouseStandardTypeModel;

    public function HouseStandardTypeItem(id:String, houseStandardTypeModel:HouseStandardTypeModel) {
        super(id);
        valuesMap[id] = this;
        this._houseStandardTypeModel = houseStandardTypeModel;
    }

    public static function getHouseStandardTypeItemById(id:String):HouseStandardTypeItem {
        return valuesMap[id] as HouseStandardTypeItem;
    }

    public function get houseStandardTypeModel():HouseStandardTypeModel {
        return _houseStandardTypeModel;
    }

    public function set houseStandardTypeModel(value:HouseStandardTypeModel):void {
        _houseStandardTypeModel = value;
    }
}
}
