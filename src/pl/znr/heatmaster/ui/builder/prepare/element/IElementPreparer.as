/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 18:52
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.element {
import pl.znr.heatmaster.core.model.InsulationElement;

public interface IElementPreparer {

     function prepare(element:InsulationElement):InsulationElement;
}
}
