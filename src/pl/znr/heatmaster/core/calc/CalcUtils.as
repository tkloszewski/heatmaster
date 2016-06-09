/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 09:43
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
public class CalcUtils {
    public function CalcUtils() {
    }

    public static function getValueIfUINotSet(uiValue:Number,destValue:Number):Number {
        return uiValue >= 0 ? uiValue : destValue;
    }


}
}
