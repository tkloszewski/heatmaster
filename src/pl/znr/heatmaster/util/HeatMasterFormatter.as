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

    private static function createNearestPrecisionFormatter(precision:int = 0):NumberFormatter {
        var format:NumberFormatter = new NumberFormatter();
        format.precision = precision;
        format.rounding = NumberBaseRoundType.NEAREST;
        return format;
    }
}
}
