/**
 * Created by Dom on 2016-07-04.
 */
package pl.znr.heatmaster.core.comparator {
import pl.znr.heatmaster.core.ProcessingResult;

public interface IProcessingResultComparator {

    function compare(referenceResult:ProcessingResult,newResult:ProcessingResult):ComparatorResult;

}
}
