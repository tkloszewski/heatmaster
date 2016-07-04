/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 03.06.13
 * Time: 18:32
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc.monthly {
import pl.znr.heatmaster.core.calc.*;

import mx.controls.Alert;

import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.model.EnvironmentalData;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.util.HouseTypeHelper;

public class FloorEnergyCalculator implements IMonthEnergyCalculator{

    public function FloorEnergyCalculator() {
    }


    public function calcEnergy(energyData:MonthEnergyData,contextData:DataContext, monthInput:MonthInputData):MonthEnergyData {
        var houseData:HouseData = contextData.houseData;
        var tAvg:Number = contextData.environmentalData.tAvg;
        var uValue:Number = houseData.floorElement.uValue;

        var sideLength:Number = Math.sqrt(houseData.surfaceData.floorSurface);

        var enFloorCenter:Number = 0;
        var enFloorEdge:Number = 0;
        var isGroundType:Boolean = HouseTypeHelper.isGroundType(houseData.houseType);

        var foundationsEnabled:Boolean =  isGroundType && houseData.foundationsEnabled;

        if(foundationsEnabled){
            enFloorCenter = (sideLength - 0.6) * (sideLength - 0.6) * uValue * (houseData.tIn - tAvg);
        }
        else if(isGroundType){
            //plyta
            enFloorCenter = (sideLength - 2) * (sideLength - 2) * (houseData.tIn - tAvg) * uValue;
            enFloorEdge = (sideLength * sideLength - (sideLength - 2) * (sideLength - 2)) * (houseData.tIn - monthInput.tOut) * uValue;
        }

        energyData.enFloor = enFloorCenter + enFloorEdge
        // Alert.show("enFloor: " + energyData.enFloor);

        return energyData;
    }


}
}
