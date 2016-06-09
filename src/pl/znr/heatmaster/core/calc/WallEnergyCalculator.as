/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 04.06.13
 * Time: 08:09
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import mx.controls.Alert;

import pl.znr.heatmaster.constants.combo.DoorType;

import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.EnergyCalcHelper;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.core.calc.MonthEnergyData;

public class WallEnergyCalculator implements IMonthEnergyCalculator{

    public static const U_DOOR:Number = 0.8;

    public function WallEnergyCalculator() {
    }

    public function calcEnergy(energyData:MonthEnergyData,dataContext:DataContext, month:int, tOut:Number):MonthEnergyData {
        var houseData:HouseData = dataContext.houseData;
        var doorType:DoorType = houseData.doorType;
        var doorSurface:Number = calcDoorSurface(houseData.houseType,doorType);

        energyData.enWalls = EnergyCalcHelper.calcHeatTransfer(houseData.wallElement.uValue,
                                                               houseData.surfaceData.wallSurface - doorSurface,
                                                               houseData.tIn,tOut);


        var enDoor:Number = EnergyCalcHelper.calcHeatTransfer(doorType.uValue,doorSurface,houseData.tIn,tOut);
        energyData.enWalls = energyData.enWalls + enDoor;
        return energyData;
    }

    private function calcDoorSurface(houseType:int,doorType:DoorType):Number {
        return 2;
    }

}
}
