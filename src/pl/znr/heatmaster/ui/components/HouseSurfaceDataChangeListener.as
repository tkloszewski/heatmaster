/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 18.06.13
 * Time: 19:32
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.components {
import mx.controls.Alert;

import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.ui.form.HouseModel;
import pl.znr.heatmaster.util.HouseTypeHelper;

public class HouseSurfaceDataChangeListener {
    public function HouseSurfaceDataChangeListener() {
    }

    public function windowSurfaceChanged(surfaceData:SurfaceData,houseModel:HouseModel):SurfaceData {
        surfaceData.windowsSurface = houseModel.windowsSurfaceN + houseModel.windowsSurfaceS + houseModel.windowsSurfaceWE;
        surfaceData.windowsSurfaceN = houseModel.windowsSurfaceN;
        surfaceData.windowsSurfaceS = houseModel.windowsSurfaceS;
        surfaceData.windowsSurfaceWE = houseModel.windowsSurfaceWE;

        return surfaceData;
    }

    public function wallSurfaceChanged(surfaceData:SurfaceData,houseModel:HouseModel):SurfaceData {
        surfaceData.wallSurface = houseModel.wallSurface;
        return surfaceData;
    }

    public function roofSurfaceChanged(surfaceData:SurfaceData,houseModel:HouseModel):SurfaceData {
        if(HouseTypeHelper.isDetachedType(houseModel.houseType) || HouseTypeHelper.isTerraceType(houseModel.houseType)){
            surfaceData.roofSurface = houseModel.roofSurface;
        }
        return surfaceData;
    }

    public function floorSurfaceChanged(surfaceData:SurfaceData,houseModel:HouseModel):SurfaceData {
        if(HouseTypeHelper.isDetachedType(houseModel.houseType)){
            surfaceData.floorSurface = houseModel.floorArea;
            surfaceData.floorSurfaceC = (Math.sqrt(surfaceData.floorSurface) - 2) * (Math.sqrt(surfaceData.floorSurface) - 2);
            surfaceData.floorSurfaceR = surfaceData.floorSurface - surfaceData.floorSurfaceC;
        }
        if(HouseTypeHelper.isTerraceType(houseModel.houseType)){
            surfaceData.floorSurface = houseModel.floorArea;
            surfaceData.floorSurfaceC = (Math.sqrt(surfaceData.floorSurface) - 2) * (Math.sqrt(surfaceData.floorSurface) - 2);
            surfaceData.floorSurfaceR = surfaceData.floorSurface - surfaceData.floorSurfaceC;
        }

       // Alert.show("Floor surfaceC:  " + surfaceData.floorSurfaceC + " floorSurfaceR: " + surfaceData.floorSurfaceR);

        return surfaceData;
    }

}
}
