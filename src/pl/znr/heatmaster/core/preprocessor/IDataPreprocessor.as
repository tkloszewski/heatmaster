/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 04.06.13
 * Time: 19:30
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.preprocessor {
import pl.znr.heatmaster.core.DataContext;

public interface IDataPreprocessor {

    function preProcess(inContext:DataContext):DataContext;
}
}
