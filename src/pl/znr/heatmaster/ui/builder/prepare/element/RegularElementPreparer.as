/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 18:57
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.element {
import flash.utils.Dictionary;

import mx.controls.Alert;

import mx.utils.NameUtil;

import pl.znr.heatmaster.constants.combo.InsulationQuality;

import pl.znr.heatmaster.constants.combo.InsulationElementType;
import pl.znr.heatmaster.core.model.FloorElement;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.core.model.RoofElement;
import pl.znr.heatmaster.core.model.WallElement;

//Walls,Floor,Roof
public class RegularElementPreparer extends BaseElementPreparer{

    public function RegularElementPreparer() {

    }

    override public function prepare(element:InsulationElement):InsulationElement {
        var heatTransferResistance:Number = getHeatTransferResistance(element);

        if(element.width == -1){
            if(element.insulationQuality != null){
                element.width = element.insulationQuality.defaultWidth;
            }
            else if(element.uValue >= 0){
                if (element.uValue > 0) {
                    var ratio:Number = 1.0/element.uValue - heatTransferResistance;
                    if(ratio <= 0){
                        element.width = 0;
                    }
                    else {
                        element.width = Math.min(LAMBDA * ratio * 100,40);
                    }
                }
                else {
                    element.width = 40;
                }
            }
        }

        if(element.width >= 0){
            element.insulationQuality = InsulationQuality.getInsulationQualityForWidth(element.width);
        }

        if(element.uValue == -1 && element.width >= 0){
           element.uValue = 1/(heatTransferResistance + element.width/(100*LAMBDA));
        }

        return element;
    }


}
}
