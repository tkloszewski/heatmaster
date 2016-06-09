/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 18:44
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import pl.znr.heatmaster.constants.combo.InsulationElementType;

public class FloorElement extends InsulationElement{
    public function FloorElement() {
    }

    override public function getElementType():int {
        return InsulationElementType.FLOOR;
    }


    override public function getMaxWidth():Number {
        return 50.0;
    }
}
}
