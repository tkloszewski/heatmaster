/**
 * Created by Dom on 2016-07-29.
 */
package pl.znr.heatmaster.constants {
import flash.utils.Dictionary;

public class HeatingType {

    private static var values:Dictionary = new Dictionary();

    public static const PELLETS:HeatingType = new HeatingType("pellets");
    public static const WOOD:HeatingType = new HeatingType("wood");
    public static const COAL:HeatingType = new HeatingType("coal");
    public static const GAS:HeatingType = new HeatingType("gas");
    public static const OIL:HeatingType = new HeatingType("oil");
    public static const COMBINED:HeatingType = new HeatingType("combined_heat");
    public static const ELECTRIC:HeatingType = new HeatingType("electric");

    private var _heatingType:String;

    function HeatingType(heatingType:String) {
        values[heatingType] = this;
        this._heatingType = heatingType;
    }

    public function get heatingType():String {
        return _heatingType;
    }

    public static function of(code:String):HeatingType {
        return values[code];
    }
}
}
