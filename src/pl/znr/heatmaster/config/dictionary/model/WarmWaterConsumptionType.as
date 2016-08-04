/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 20.08.13
 * Time: 22:17
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config.dictionary.model {
import flash.utils.Dictionary;

import mx.binding.utils.BindingUtils;

import pl.znr.heatmaster.config.dictionary.model.BaseComboObject;

public class WarmWaterConsumptionType extends BaseComboObject{

    private static const valuesMap:Dictionary = new Dictionary();

    private var _intensity:Number;

    public function WarmWaterConsumptionType(id:String,intensity:Number) {
        super(id);
        this._intensity = intensity;
        valuesMap[id] = this;
    }

    public function get intensity():Number {
        return _intensity;
    }

    public static function getWarmWaterConsumptionById(id:String):WarmWaterConsumptionType {
        return valuesMap[id] as WarmWaterConsumptionType;
    }
}
}
