/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 12:35
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import flash.utils.Dictionary;

import mx.utils.NameUtil;

public class VentilationMethod extends BaseComboObject{

    private static const valuesMap:Dictionary = new Dictionary();

    public function VentilationMethod(id:String,type:int, efficiency:Number) {
        super(id);
        _type = type;
        _efficiency = efficiency;
        valuesMap[id] = this;
    }

    private var _type:int;
    private var _efficiency:Number = 0;


    public function get type():int {
        return _type;
    }

    public function get efficiency():Number{
        return _efficiency;
    }

    public static var NATURAL:VentilationMethod = new VentilationMethod("hm.ventilation-type.natural",GRAVITATIONAL,0);
    public static var NATURAL_REGULATED:VentilationMethod = new VentilationMethod("hm.ventilation-type.natural_regulated",GRAVITATIONAL,0.1);
    public static var MECHANICAL_60_PER_CENT:VentilationMethod = new VentilationMethod("hm.ventilation-type.mechanical_60",MECHANICAL,0.6);
    public static var MECHANICAL_75_PER_CENT:VentilationMethod = new VentilationMethod("hm.ventilation-type.mechanical_75",MECHANICAL,0.75);
    public static var MECHANICAL_85_PER_CENT:VentilationMethod = new VentilationMethod("hm.ventilation-type.mechanical_85",MECHANICAL,0.85);


    public static const GRAVITATIONAL:int = 1;
    public static const MECHANICAL:int = 2;

    public static function getVentilationMethodById(id:String):VentilationMethod {
        return valuesMap[id] as VentilationMethod;
    }

    public static function getVentilationMethodForEfficiency(efficiency:Number):VentilationMethod {
        if(NATURAL.efficiency == efficiency){
           return NATURAL;
        }
        if(NATURAL_REGULATED.efficiency == efficiency){
            return NATURAL_REGULATED;
        }
        if(MECHANICAL_60_PER_CENT.efficiency == efficiency){
           return MECHANICAL_60_PER_CENT;
        }
        if(MECHANICAL_75_PER_CENT.efficiency == efficiency){
           return MECHANICAL_75_PER_CENT;
        }
        if(MECHANICAL_85_PER_CENT.efficiency == efficiency){
           return MECHANICAL_85_PER_CENT;
        }
        return NATURAL;
    }
}
}
