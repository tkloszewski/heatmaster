/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 18:46
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import pl.znr.heatmaster.constants.combo.InsulationElementType;

public class RoofElement extends InsulationElement{
    public function RoofElement() {
    }

    override public function getElementType():int {
      return InsulationElementType.ROOF;
    }


    override public function getMaxWidth():Number {
        return 50.0;
    }
}
}
