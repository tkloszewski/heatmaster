/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 31.05.13
 * Time: 23:09
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.surface {
import mx.collections.ArrayCollection;
import mx.collections.ArrayList;

import pl.znr.heatmaster.core.model.FloorSurfaceData;

import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.util.HouseTypeHelper;

public class AbstractSurfaceCalculator implements ISurfaceCalculator{
    public function AbstractSurfaceCalculator() {
    }

    protected function calcFloorSurfaceData(surfaceData:SurfaceData,type:int):FloorSurfaceData {
        var a:Number = Math.sqrt(surfaceData.floorArea);
        var b:Number = a;
        var maxWidth:Number = getMaxWidth(type);
        if(b > maxWidth){
            b = maxWidth;
            a = surfaceData.floorArea/b;
        }
        return new FloorSurfaceData(a,b);
    }

    protected function doCalculation(inputSurface:SurfaceData,type:int):SurfaceData {
        return inputSurface;
    }

    protected function getMaxWidth(type:int){
        if(HouseTypeHelper.isDoubleBlock(type)){
           return 5;
        }
        return 10;
    }

    protected function getSupportedHouseTypes():ArrayCollection{
        return new ArrayCollection();
    }

    protected function doFinalCalculation(surfaceData:SurfaceData):SurfaceData {

        return surfaceData;
    }

    protected function uiSet(uiValue:Number):Boolean {
        return uiValue >= 0;
    }

    public function calcSurface(surfaceData:SurfaceData,type:int):SurfaceData {
        surfaceData = doCalculation(surfaceData,type);
        surfaceData = doFinalCalculation(surfaceData);
        return surfaceData;
    }

    public function supportsHouseType(type:int):Boolean {
        return false;
    }
}
}
