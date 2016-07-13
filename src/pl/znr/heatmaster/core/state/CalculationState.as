/**
 * Created by Dom on 2016-06-13.
 */
package pl.znr.heatmaster.core.state {
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.ProcessingResult;

public class CalculationState {
    private var _refProcessingResult:ProcessingResult;
    private var _newProcessingResult:ProcessingResult;

    public function CalculationState(refProcessingResult:ProcessingResult, newProcessingResult:ProcessingResult) {
        _refProcessingResult = refProcessingResult;
        _newProcessingResult = newProcessingResult;
    }

    public function get refProcessingResult():ProcessingResult {
        return _refProcessingResult;
    }

    public function set refProcessingResult(value:ProcessingResult):void {
        _refProcessingResult = value;
    }

    public function get newProcessingResult():ProcessingResult {
        return _newProcessingResult;
    }

    public function set newProcessingResult(value:ProcessingResult):void {
        _newProcessingResult = value;
    }
}
}
