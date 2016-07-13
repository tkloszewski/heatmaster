/**
 * Created by Dom on 2016-06-26.
 */
package pl.znr.heatmaster.core.calc.util {
public class CalcUtils {

    public static const NEW_MAX_POWER_THRESHOLD_DIFF:Number = 0.8;

    public function CalcUtils() {
    }

    public static function maxHeatingSourcePowerThresholdExceeded(previousMaxPower:Number, currentMaxPower:Number):Boolean{
        if(currentMaxPower < NEW_MAX_POWER_THRESHOLD_DIFF * previousMaxPower){
           return true;
        }
        return false;
    }

    public static function maxValue(values:Array):Number {
        var maxValue:Number = Number.MIN_VALUE;
        for (var i:int = 0; i < values.length; i++) {
            if (values[i] > maxValue) {
                maxValue = values[i];
            }
        }
        return maxValue;
    }

    public static function minValue(temperatures:Array):Number {
        var minValue:Number = Number.MAX_VALUE;
        for (var i:int = 0; i < temperatures.length; i++) {
            if (temperatures[i] < minValue) {
                minValue = temperatures[i];
            }
        }
        return minValue;
    }

    public static function avgValue(temperatures:Array):Number {
        var avgValue:Number = 0;
        for (var i:int = 0; i < temperatures.length; i++) {
            avgValue += temperatures[i];
        }
        avgValue = avgValue / temperatures.length;
        return avgValue;
    }

    public static function floorZero(value:Number):Number {
        return Math.max(value,0);
    }
}
}
