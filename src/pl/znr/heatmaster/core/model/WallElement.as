/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 18:40
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import pl.znr.heatmaster.constants.combo.InsulationElementType;

public class WallElement extends InsulationElement{
    public function WallElement() {
    }

    override public function getElementType():int {
        return InsulationElementType.WALL;
    }
}
}
