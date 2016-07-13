/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 16.06.13
 * Time: 19:34
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.StateDataContext;

public interface IDataContextAware {

    function initData(dataContext:DataContext):DataContext;

    function setupView(dataContext:DataContext):void;

    function setupReferenceView(stateDataContext:StateDataContext):void;
}
}
