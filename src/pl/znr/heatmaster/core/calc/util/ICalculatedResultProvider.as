/**
 * Created by Dom on 2016-06-25.
 */
package pl.znr.heatmaster.core.calc.util {
public interface ICalculatedResultProvider {

    function applyRatio(value:Number,ratio:Number):void;

    function getCalculatedResult():*;

}
}
