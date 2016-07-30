/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 20.08.13
 * Time: 22:17
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import mx.binding.utils.BindingUtils;

public class WarmWaterConsumption extends BaseComboObject{

    public static var VERY_SMALL:WarmWaterConsumption = new WarmWaterConsumption("hm.warmwater.consuption.very_low",0.5);
    public static var SMALL:WarmWaterConsumption = new WarmWaterConsumption("hm.warmwater.consuption.low",0.75);
    public static var AVERAGE:WarmWaterConsumption = new WarmWaterConsumption("hm.warmwater.consuption.standard",1.0);
    public static var BIG:WarmWaterConsumption = new WarmWaterConsumption("hm.warmwater.consuption.big",1.5);
    public static var VERY_BIG:WarmWaterConsumption = new WarmWaterConsumption("hm.warmwater.consuption.very_big",2.0);

    private var _intensity:Number;

    public function WarmWaterConsumption(id:String,intensity:Number) {
        super(id);
        this._intensity = intensity;
    }

    public function get intensity():Number {
        return _intensity;
    }

    public static function getWarmWaterConsumptionForIntensity(intensity:Number):WarmWaterConsumption {
        if(VERY_SMALL.intensity == intensity){
           return VERY_SMALL;
        }
        if(SMALL.intensity == intensity){
           return SMALL;
        }
        if(AVERAGE.intensity == intensity){
           return AVERAGE;
        }
        if(BIG.intensity == intensity){
            return BIG;
        }
        if(VERY_BIG.intensity == intensity){
           return VERY_BIG;
        }
        return AVERAGE;
    }
}
}
