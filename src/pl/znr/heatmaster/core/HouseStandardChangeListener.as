/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 12.05.15
 * Time: 21:22
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.HouseStandardTypeContext;
import pl.znr.heatmaster.core.Ordered;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.model.HouseStandardTypeModel;

public interface HouseStandardChangeListener extends Ordered{

    function standardChanged(dataContext:DataContext,context:HouseStandardTypeContext):void;
}
}
