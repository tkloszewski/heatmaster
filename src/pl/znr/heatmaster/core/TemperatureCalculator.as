/**
 * Created by Dom on 2016-06-20.
 */
package pl.znr.heatmaster.core {
public class TemperatureCalculator {
    public function TemperatureCalculator() {
    }

    public static function calcGroundTemperatures(temperatures:Array):Array {
        var result:Array = new Array();
        for(var i:int =0 ;i < temperatures.length; i++){
            result.push(temperatures[i])
        }
        return result;
    }
}
}
