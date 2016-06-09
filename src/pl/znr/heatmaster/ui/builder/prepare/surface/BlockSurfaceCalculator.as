/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 31.05.13
 * Time: 23:27
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.surface {
import mx.collections.ArrayCollection;
import mx.collections.ArrayList;
import mx.controls.Alert;

import pl.znr.heatmaster.core.model.FloorSurfaceData;

import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.core.calc.CalcUtils;
import pl.znr.heatmaster.core.calc.CalcUtils;
import pl.znr.heatmaster.constants.combo.HouseType;
import pl.znr.heatmaster.util.HouseTypeHelper;

public class BlockSurfaceCalculator extends AbstractSurfaceCalculator{

    public function BlockSurfaceCalculator() {
    }



    override protected function doCalculation(surfaceData:SurfaceData,type:int):SurfaceData {
        surfaceData.floorArea = surfaceData.totalSurface/surfaceData.floorCount;

        var floorSurfaceData:FloorSurfaceData = calcFloorSurfaceData(surfaceData,type);

        if(HouseTypeHelper.hasOnlyOneOuterWall(type)){
            surfaceData.wallSurface = floorSurfaceData.a * surfaceData.floorHeight * surfaceData.floorCount;

        }
        else if(HouseTypeHelper.hasTwoOuterWalls(type)){
            surfaceData.wallSurface = (floorSurfaceData.a + floorSurfaceData.b) * surfaceData.floorHeight * surfaceData.floorCount;
        }
        else if(HouseTypeHelper.hasThreeOuterWalls(type)){
            surfaceData.wallSurface = (2 * floorSurfaceData.a + floorSurfaceData.b) * surfaceData.floorHeight * surfaceData.floorCount;
        }

        surfaceData.windowsSurface = 0.15 * surfaceData.totalSurface;



        if(HouseTypeHelper.hasOnlyWEWindows(type)){
            surfaceData.windowsSurfaceWE = surfaceData.windowsSurface;
            surfaceData.windowsSurfaceS = 0;
            surfaceData.windowsSurfaceN = 0;
        }
        else if(HouseTypeHelper.isBlockWithOuterRightWall(type)){
            surfaceData.windowsSurfaceS = 0.35 * surfaceData.windowsSurface;
            surfaceData.windowsSurfaceN = 0;
            surfaceData.windowsSurfaceWE = 0.65 * surfaceData.windowsSurface;
        }
        else if(HouseTypeHelper.isDoubleBlockWithOuterRightWall(type)){
            surfaceData.windowsSurfaceS = 0.5 * surfaceData.windowsSurface;
            surfaceData.windowsSurfaceN = 0;
            surfaceData.windowsSurfaceWE = 0.5 * surfaceData.windowsSurface;
        }
        else if(HouseTypeHelper.hasOnlyOneOuterWall(type)){
            surfaceData.windowsSurfaceS = 0;
            surfaceData.windowsSurfaceN = 0;
            surfaceData.windowsSurfaceWE = surfaceData.windowsSurface;
        }
        else {
            surfaceData.windowsSurfaceS = surfaceData.windowsSurface * 0.45;
            surfaceData.windowsSurfaceN = surfaceData.windowsSurface * 0.15;
            surfaceData.windowsSurfaceWE = surfaceData.windowsSurface * 0.4;
        }

        surfaceData.roofSurface = 0;
        surfaceData.floorSurface = 0;
        surfaceData.floorSurfaceC = 0;
        surfaceData.floorSurfaceR = 0;

        if(HouseTypeHelper.isGroundType(type)){
            surfaceData.floorSurface = surfaceData.floorArea;
        }
        if(HouseTypeHelper.isSkyType(type)){
            surfaceData.roofSurface = surfaceData.floorArea;
        }

        surfaceData.wallSurface = Math.max(surfaceData.wallSurface - surfaceData.windowsSurface,0);

        return surfaceData;
    }


    override protected function doFinalCalculation(surfaceData:SurfaceData):SurfaceData {
        surfaceData = super.doFinalCalculation(surfaceData);
        surfaceData.floorSurfaceR = 0;
        return surfaceData;
    }

    override public function supportsHouseType(type:int):Boolean {
        return HouseTypeHelper.isBlockType(type);
    }

}
}
