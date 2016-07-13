/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 16.06.13
 * Time: 19:38
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.components {
import pl.znr.heatmaster.core.IResultDataAware;
import pl.znr.heatmaster.core.ProcessingResult;

public class HeatMasterResultComponent extends HeatMasterComponent implements IResultDataAware{
    public function HeatMasterResultComponent() {
    }

    public function resultCalculated(resultData:ProcessingResult, month:int):void {
    }

    public function unitChanged(resultData:ProcessingResult, month:int, unit:int):void {
    }
}
}
