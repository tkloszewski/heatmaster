/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 19:27
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.element {
import pl.znr.heatmaster.ui.builder.prepare.*;
import pl.znr.heatmaster.core.*;
import pl.znr.heatmaster.*;
import pl.znr.heatmaster.constants.combo.InsulationElementType;
import pl.znr.heatmaster.core.model.InsulationElement;

public class ElementPreparer implements IElementPreparer{
    public function ElementPreparer() {
    }

    public function prepare(element:InsulationElement):InsulationElement {
        if(element.getElementType() == InsulationElementType.FLOOR || element.getElementType() == InsulationElementType.ROOF ||
                element.getElementType() == InsulationElementType.WALL){
            return new RegularElementPreparer().prepare(element);
        }
        if(element.getElementType() == InsulationElementType.WINDOW){
            return new WindowElementPreparer().prepare(element);
        }
        return null;
    }
}
}
