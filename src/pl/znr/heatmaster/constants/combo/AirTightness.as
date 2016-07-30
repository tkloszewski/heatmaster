/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 18:53
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import flash.utils.Dictionary;

public class AirTightness extends BaseComboObject{

    public static const valuesMap:Dictionary = new Dictionary();

    public static const VERY_LOOSE_TIGHTNESS:AirTightness = new AirTightness("hm.tightness.very_loose",10);
    public static const LOOSE_TIGHTNESS:AirTightness = new AirTightness("hm.tightness.loose",7);
    public static const STANDARD_NEW_TIGHTNESS:AirTightness = new AirTightness("hm.tightness.standard_new",5);
    public static const TIGHT_NO_RECUP_TIGHTNESS:AirTightness = new AirTightness("hm.tightness.tight_no_recup",3);
    public static const TIGHT_RECUP_TIGHTNESS:AirTightness = new AirTightness("hm.tightness.tight_recup",1.5);
    public static const STANDARD_PASSIVE_TIGHTNESS:AirTightness = new AirTightness("hm.tightness.standard_passive",0.6);

    private var _value:Number;

    public function AirTightness(id:String,value:Number) {
        super(id);
        valuesMap[id] = this;
        this._value = value;
    }

    public static function getAirTightnessById(id:String):AirTightness {
        return valuesMap[id] as AirTightness;
    }

    public function get value():Number {
        return _value;
    }




}
}
