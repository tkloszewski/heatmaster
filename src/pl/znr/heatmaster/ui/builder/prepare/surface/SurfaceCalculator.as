/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 31.05.13
 * Time: 23:19
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.surface {
import mx.collections.ArrayList;

import pl.znr.heatmaster.core.model.SurfaceData;

public class SurfaceCalculator {

    private var surfaceCalculators:ArrayList = new ArrayList();

    public function SurfaceCalculator() {
        surfaceCalculators.addItem(new DetachedHouseSurfaceCalculator());
        surfaceCalculators.addItem(new MultiFamilyHouseSurfaceCalculator());
        surfaceCalculators.addItem(new TerracedHouseSurfaceCalculator());
        surfaceCalculators.addItem(new BlockSurfaceCalculator());
    }


    public function calcSurface(surfaceData:SurfaceData,houseType:int):SurfaceData {
        for(var i:int = 0;i<surfaceCalculators.length;i++){
            var surfaceCalculator:ISurfaceCalculator = surfaceCalculators.getItemAt(i) as ISurfaceCalculator;
            if(surfaceCalculator.supportsHouseType(houseType)){
               return surfaceCalculator.calcSurface(surfaceData,houseType);
            }
        }
        return surfaceData;
    }


}
}
