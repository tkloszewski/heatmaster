/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 31.05.13
 * Time: 23:32
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.surface {
import mx.collections.ArrayCollection;

import pl.znr.heatmaster.core.model.FloorSurfaceData;

import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.constants.combo.HouseType;
import pl.znr.heatmaster.util.HouseTypeHelper;

public class TerracedHouseSurfaceCalculator extends AbstractSurfaceCalculator{
    public function TerracedHouseSurfaceCalculator() {
    }

    override protected function doCalculation(surfaceData:SurfaceData,type:int):SurfaceData {
        surfaceData.floorArea = surfaceData.totalSurface/surfaceData.floorCount;

        var floorSurfaceData:FloorSurfaceData = calcFloorSurfaceData(surfaceData,type);

        surfaceData.floorSurface = surfaceData.floorArea;

        surfaceData.wallSurface = 2 * floorSurfaceData.a * surfaceData.floorHeight * surfaceData.floorCount;
        surfaceData.windowsSurface = 0.18 * surfaceData.totalSurface;
        surfaceData.roofSurface = 1.1 * surfaceData.floorArea;


        if(type != HouseType.TERRACED_CENTER){
            surfaceData.windowsSurfaceS = surfaceData.windowsSurface * 0.35;
            surfaceData.windowsSurfaceN = 0;
            surfaceData.windowsSurfaceWE = surfaceData.windowsSurface * 0.65;
        }
        else {
            surfaceData.windowsSurfaceS = 0;
            surfaceData.windowsSurfaceWE = 2 * surfaceData.windowsSurface;
            surfaceData.windowsSurfaceN = 0;
        }

        surfaceData.floorSurfaceC = (Math.sqrt(surfaceData.floorSurface) - 2) * (Math.sqrt(surfaceData.floorSurface) - 2);
        surfaceData.floorSurfaceR = surfaceData.floorSurface - surfaceData.floorSurfaceC;

        surfaceData.wallSurface = Math.max(surfaceData.wallSurface - surfaceData.windowsSurface,0);

        return surfaceData;
    }

    override public function supportsHouseType(type:int):Boolean {
        return HouseTypeHelper.isTerraceType(type);
    }
}
}
