/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 03.08.14
 * Time: 13:36
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.element {
import pl.znr.heatmaster.core.model.InsulationElement;

public class UValueBasedElementPreparer extends BaseElementPreparer{

    private static var MAX_WIDTH:Number = 50;

    public function UValueBasedElementPreparer() {
    }


    override public function prepare(element:InsulationElement):InsulationElement {
        var heatTransferResistance:Number = getHeatTransferResistance(element);

        if(element.width == -1){
             if(element.uValue >= 0){
                if (element.uValue > 0) {
                    var ratio:Number = 1.0/element.uValue - heatTransferResistance;
                    if(ratio <= 0){
                        element.width = 0;
                    }
                    else {
                        element.width = Math.min(element.materialHeatTransfer * ratio * 100,element.getMaxWidth());
                    }
                }
                else {
                    element.width = element.getMaxWidth();
                }
            }
        }

        if(element.uValue == -1 && element.width >= 0){
            element.uValue = 1/(heatTransferResistance + element.width/(100 * element.materialHeatTransfer));
        }


        return element;
    }
}
}
