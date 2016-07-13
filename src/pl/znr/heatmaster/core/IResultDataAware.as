/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 16.06.13
 * Time: 19:39
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import pl.znr.heatmaster.core.ProcessingResult;

public interface IResultDataAware {

    function resultCalculated(resultData:ProcessingResult,month:int):void;

    function processPreviousResult(resultData:ProcessingResult):void;

    function unitChanged(resultData:ProcessingResult,month:int,unit:int):void;
}
}
