/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.07.13
 * Time: 21:27
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import flash.utils.Dictionary;

public class FoundationsType extends BaseComboObject{

    private static const TRADITIONAL_TYPE:int = 1;
    private static const SLAB_TYPE:int = 2;

    public static const valuesMap:Dictionary = new Dictionary();

    public static const TRADITIONAL:FoundationsType = new FoundationsType("hm.foundations.traditional",TRADITIONAL_TYPE,0.75);
    public static const TRADITIONAL_INSULATED:FoundationsType = new FoundationsType("hm.foundations.traditional_insulated",TRADITIONAL_TYPE,0.5);
    public static const SLAB:FoundationsType = new FoundationsType("hm.foundations.slab",SLAB_TYPE,0.0);

    private var _uValue:Number;
    private var _fType:int;

    public function FoundationsType(id:String,fType:int,uValue:Number) {
        super(id);
        valuesMap[id] = this;
        this._fType = fType;
        this._uValue = uValue;
    }

    public function get uValue():Number {
        return _uValue;
    }

    public function get fType():int {
        return _fType;
    }

    public function isFoundationsEnabled():Boolean{
        return fType == TRADITIONAL_TYPE;
    }

    public static function getFoundationById(id:String):FoundationsType {
        return valuesMap[id] as FoundationsType;
    }


}
}
