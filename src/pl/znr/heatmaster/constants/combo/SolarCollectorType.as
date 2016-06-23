/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 13.07.13
 * Time: 10:59
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import mx.collections.ArrayList;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;

public class SolarCollectorType extends BaseComboObject{

    private static var items:ArrayList = new ArrayList();

    public static const NONE_TYPE:int = 0;
    public static const FLAT_TYPE:int = 1;
    public static const VACUUM_TYPE:int = 2;

    private var _type:int;
    private var _efficiency:Number;
    private var _unitSurface:Number;
    private var _personPerCollector:int;

    public static var NONE:SolarCollectorType = new SolarCollectorType("hm.solar-collector.none",NONE_TYPE,0,1,0);
    public static var FLAT:SolarCollectorType = new SolarCollectorType("hm.solar-collector.flat",FLAT_TYPE,0.3,1.0,1);
    public static var VACUUM:SolarCollectorType = new SolarCollectorType("hm.solar-collector.vacuum",VACUUM_TYPE,0.5,2.0,2);

    public static function getSolarCollectorTypeById(_id:String):SolarCollectorType {
        for(var i:int = 0;i < items.length;i++){
            var solarCollectorType:SolarCollectorType = items.getItemAt(i) as SolarCollectorType;
            if(solarCollectorType.getId() == _id){
                return solarCollectorType;
            }
        }
        return null;
    }

    function SolarCollectorType(id:String,type:int, efficiency:Number, unitSurface:Number, perPersonCount:int) {
        super(id);
        _type = type;
        _efficiency = efficiency;
        _unitSurface = unitSurface;
        _personPerCollector = perPersonCount;

        items.addItem(this);
    }


    override public function dictionaryInitialized(config:DictionaryConfig):void {

    }

    public function isFlatCollector():Boolean {
        return type == FLAT_TYPE;
    }

    public function isVacuumCollector():Boolean {
        return type == VACUUM_TYPE;
    }

    public function get personPerCollector():int {
        return _personPerCollector;
    }

    public function get unitSurface():Number {
        return _unitSurface;
    }

    public function get efficiency():Number {
        return _efficiency;
    }

    public function get type():int {
        return _type;
    }
}
}
