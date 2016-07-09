/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 17.06.13
 * Time: 21:16
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants {
import mx.formatters.NumberBaseRoundType;
import mx.formatters.NumberFormatter;

import pl.znr.heatmaster.constants.combo.HeatingSourceType;

public class GlobalValues {
    public function GlobalValues() {
    }

    public static const START_MONTH:int = 0;
    public static const INITIAL_PERSON_NUMBER:int = 4;
    public static const INITIAL_HOUSE_HEATING_SOURCE:HeatingSourceType = HeatingSourceType.BOILER_GAS_OLD;
    public static const INITIAL_WARM_WATER_HEATING_SOURCE:HeatingSourceType = HeatingSourceType.BOILER_GAS_OLD;

    public static const PRICE_PELLETS_KWH_DEFAULT:Number =  0.22;
    public static const PRICE_WOOD_KWH_DEFAULT:Number = 0.12;
    public static const PRICE_ELECTRICITY_KWH_DEFAULT:Number = 0.58;
    public static const PRICE_WOOD_CHIPS_KWH_DEFAULT:Number = 0.12;
    public static const PRICE_GAS_KWH_DEFAULT:Number = 0.18;
    public static const PRICE_COAL_KWH_DEFAULT:Number = 0.12;
    public static const PRICE_OIL_KWH_DEFAULT:Number = 0.4;
    public static const PRICE_HEAT_KWH_COMBINED:Number = 0.22;


    public static function parseIntValue(value:String):Number{
        var result:Number = parseInt(value);
        if(isNaN(result)){
            return 0;
        }
        return result;
    }


    public static function toPrecision(value:Number,precision:int):Number {
        return parseFloatValue(value.toPrecision(precision));
    }

    public static function parseFloatValue(value:String):Number{
        var result:Number = parseFloat(value);
        if(isNaN(result)){
            return 0;
        }
        return result;
    }

    public static function formatFloatValue(value:Number):String{
        var numberFormatter:NumberFormatter = new NumberFormatter();
        numberFormatter.precision = 2;
        numberFormatter.rounding = NumberBaseRoundType.NEAREST;
        return numberFormatter.format(value);
    }
}
}
