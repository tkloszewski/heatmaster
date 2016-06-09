/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 31.05.13
 * Time: 23:28
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.surface {
import mx.collections.ArrayCollection;

import pl.znr.heatmaster.core.model.FloorSurfaceData;

import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.constants.combo.HouseType;
import pl.znr.heatmaster.util.HouseTypeHelper;

public class MultiFamilyHouseSurfaceCalculator extends AbstractSurfaceCalculator{
    public function MultiFamilyHouseSurfaceCalculator() {
    }

    override protected function doCalculation(surfaceData:SurfaceData,type:int):SurfaceData {
        surfaceData.floorArea = surfaceData.totalSurface/surfaceData.floorCount;

        var floorSurfaceData:FloorSurfaceData = calcFloorSurfaceData(surfaceData,type);

        surfaceData.wallSurface = 2 * (floorSurfaceData.a + floorSurfaceData.b) * surfaceData.floorHeight * surfaceData.floorCount;
        surfaceData.windowsSurface = 0.2 * surfaceData.totalSurface;

        surfaceData.windowsSurfaceS = surfaceData.windowsSurface * 0.45;
        surfaceData.windowsSurfaceN = surfaceData.windowsSurface * 0.15;
        surfaceData.windowsSurfaceWE = surfaceData.windowsSurface * 0.4;

        surfaceData.floorSurface = 0.0;
        surfaceData.roofSurface = 0.0;
        surfaceData.floorSurfaceC = 0;
        surfaceData.floorSurfaceR = 0;

        if(HouseTypeHelper.isGroundType(type)){
           surfaceData.floorSurface =  surfaceData.floorArea;
        }
        if(HouseTypeHelper.isSkyType(type)){
            surfaceData.roofSurface = surfaceData.floorArea;
        }

        surfaceData.wallSurface = Math.max(surfaceData.wallSurface - surfaceData.windowsSurface,0);

        return surfaceData;
    }

    override public function supportsHouseType(type:int):Boolean {
        return HouseTypeHelper.isMultiFamilyType(type);
    }
}
}
