/**
 * Created by Dom on 2016-06-13.
 */
package pl.znr.heatmaster.core.state {
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.ProcessingResult;

public class CalculationState {
    private var _processingResult:ProcessingResult;
    private var _dataContext:DataContext;

    public function CalculationState(processingResult:ProcessingResult, dataContext:DataContext) {
        _processingResult = processingResult;
        _dataContext = dataContext;
    }

    public function get processingResult():ProcessingResult {
        return _processingResult;
    }

    public function set processingResult(value:ProcessingResult):void {
        _processingResult = value;
    }

    public function get dataContext():DataContext {
        return _dataContext;
    }

    public function set dataContext(value:DataContext):void {
        _dataContext = value;
    }
}
}
