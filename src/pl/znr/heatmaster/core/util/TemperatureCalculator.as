/**
 * Created by Dom on 2016-06-20.
 */
package pl.znr.heatmaster.core.util {
public class TemperatureCalculator {
    public function TemperatureCalculator() {
    }

    public static function calcMaxTemperature(temperatures:Array):Number {
        var maxTemp:Number = Number.MIN_VALUE;
        for (var i:int = 0; i < temperatures.length; i++) {
            if (temperatures[i] > maxTemp) {
                maxTemp = temperatures[i];
            }
        }
        return maxTemp;
    }

    public static function calcMinTemperature(temperatures:Array):Number {
        var minTemp:Number = Number.MAX_VALUE;
        for (var i:int = 0; i < temperatures.length; i++) {
            if (temperatures[i] < minTemp) {
                minTemp = temperatures[i];
            }
        }
        return minTemp;
    }

    public static function calcAvgTemperature(temperatures:Array):Number {
        var avgTemp:Number = 0;
        for (var i:int = 0; i < temperatures.length; i++) {
            avgTemp += temperatures[i];
        }
        avgTemp = avgTemp / temperatures.length;
        return avgTemp;
    }

    public static function calcSigma(temperatures:Array,minTemp:Number = NaN,maxTemp:Number = NaN):Number {
        if(isNaN(minTemp)){
           minTemp = calcMinTemperature(temperatures);
        }
        if(isNaN(maxTemp)){
           maxTemp = calcMaxTemperature(temperatures);
        }

        var tSigma:Number = (maxTemp - minTemp) / 7;
        if(tSigma - Math.floor(tSigma) < 0.5){
            tSigma = Math.floor(tSigma);
        }
        else {
            tSigma = Math.ceil(tSigma)
        }
        return tSigma;
    }

    public static function calcGroundTemperatures(temperatures:Array):Array {
        var result:Array = new Array(12);

        var tAvg:Number = calcAvgTemperature(temperatures);

        for(var i:int =0 ;i < temperatures.length; i++){
            var previous:int = i == 0 ? temperatures.length - 1 : i-1;
            var tGround:Number = tAvg + (2 * temperatures[previous] + temperatures[i])/3;
            result[i] = tGround;
        }
        return result;
    }
}
}
