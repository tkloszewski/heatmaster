/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 03.08.14
 * Time: 13:39
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.element {
import pl.znr.heatmaster.core.model.FloorElement;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.core.model.RoofElement;
import pl.znr.heatmaster.core.model.WallElement;

public class BaseElementPreparer implements IElementPreparer{

    protected static const ROOF_HEAT_RESISTANCE:Number = 0.5;
    protected static const WALL_HEAT_RESISTANCE:Number = 0.8;
    protected static const FLOOR_HEAT_RESISTANCE:Number = 2.0;
    protected static const LAMBDA:Number = 0.04;

    public function BaseElementPreparer() {
    }


    public function prepare(element:InsulationElement):InsulationElement {
        return null;
    }

    protected function getHeatTransferResistance(element:InsulationElement):Number {
        if( element is RoofElement){
            return ROOF_HEAT_RESISTANCE;
        }
        else if(element is WallElement){
            return WALL_HEAT_RESISTANCE;
        }
        else if(element is FloorElement){
            return FLOOR_HEAT_RESISTANCE;
        }
        return 1;
    }
}
}
