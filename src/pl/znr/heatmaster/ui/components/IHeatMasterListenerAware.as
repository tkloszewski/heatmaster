/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 16.06.13
 * Time: 16:10
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.components {
import pl.znr.heatmaster.ui.HeatMasterChangeListener;

public interface IHeatMasterListenerAware {
    function setHeatMasterListener(heatMasterListener:HeatMasterChangeListener):void;
}
}
