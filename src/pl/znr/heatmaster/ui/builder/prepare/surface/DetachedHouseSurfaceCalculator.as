/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 31.05.13
 * Time: 23:27
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.surface {
import mx.controls.Alert;

import pl.znr.heatmaster.core.model.FloorSurfaceData;

import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.constants.combo.HouseType;
import pl.znr.heatmaster.util.HouseTypeHelper;

public class DetachedHouseSurfaceCalculator extends AbstractSurfaceCalculator{
    public function DetachedHouseSurfaceCalculator() {
    }

    override protected function doCalculation(surfaceData:SurfaceData,type:int):SurfaceData {
        surfaceData.floorArea = surfaceData.totalSurface/surfaceData.floorCount;
        surfaceData.floorSurface = surfaceData.floorArea;

        var floorSurfaceData:FloorSurfaceData = calcFloorSurfaceData(surfaceData,type);

        surfaceData.wallSurface = 2 * (floorSurfaceData.a + floorSurfaceData.b) * surfaceData.floorHeight * surfaceData.floorCount;
        surfaceData.roofSurface = 1.2 * surfaceData.floorArea;
        surfaceData.windowsSurface = 0.2 * surfaceData.totalSurface;

        surfaceData.windowsSurfaceS = surfaceData.windowsSurface * 0.45;
        surfaceData.windowsSurfaceN = surfaceData.windowsSurface * 0.15;
        surfaceData.windowsSurfaceWE = surfaceData.windowsSurface * 0.4;

        surfaceData.floorSurfaceC = (Math.sqrt(surfaceData.floorSurface) - 2) * (Math.sqrt(surfaceData.floorSurface) - 2);
        surfaceData.floorSurfaceR = surfaceData.floorSurface - surfaceData.floorSurfaceC;

        surfaceData.wallSurface = Math.max(surfaceData.wallSurface - surfaceData.windowsSurface,0);


        return surfaceData;
    }

    override public function supportsHouseType(type:int):Boolean {
        return HouseTypeHelper.isDetachedType(type);
    }
}
}
