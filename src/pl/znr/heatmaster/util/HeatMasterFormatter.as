/**
 * Created by Dom on 2016-07-05.
 */
package pl.znr.heatmaster.util {
import mx.formatters.NumberBaseRoundType;
import mx.formatters.NumberFormatter;

public class HeatMasterFormatter {
    public function HeatMasterFormatter() {
    }

    public static function formatHMValue(value:Number,precision:int = 0,useThousandSeparator:Boolean = false):String{
        var formatter:NumberFormatter = createNearestPrecisionFormatter(precision);
        formatter.useThousandsSeparator = false;
        if (useThousandSeparator) {
            if (value >= 10000) {
                formatter.useThousandsSeparator = true;
                formatter.thousandsSeparatorTo = " ";
                formatter.thousandsSeparatorFrom = " ";
            }
        }
        return formatter.format(value);
    }

    public static function getStepSize(value:Number):Number{
        if(value < 10.0){
           return 0.01;
        }
        if(value >= 10.0 && value < 100.0){
           return 0.1;
        }
        return 1.0;
    }

    public static function formatHMValueRoundUp(value:Number,precision:int = 0){
        var formatter:NumberFormatter = createFormatter(precision,NumberBaseRoundType.UP);
        return formatter.format(value);
    }

    private static function createNearestPrecisionFormatter(precision:int = 0):NumberFormatter {
        return createFormatter(precision,NumberBaseRoundType.NEAREST);
    }

    private static function createFormatter(precision:int = 0,rounding:String = NumberBaseRoundType.NEAREST):NumberFormatter {
        var format:NumberFormatter = new NumberFormatter();
        format.precision = precision;
        format.rounding = rounding;
        return format;
    }
}
}
