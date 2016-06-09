/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 04.06.13
 * Time: 08:06
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import mx.controls.Alert;

import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.core.calc.MonthEnergyData;

public class RoofEnergyCalculator implements IMonthEnergyCalculator{
    public function RoofEnergyCalculator() {
    }

    public function calcEnergy(energyData:MonthEnergyData,contextData:DataContext, month:int, tOut:Number):MonthEnergyData {
        var houseData:HouseData = contextData.houseData;
        energyData.enRoof = EnergyCalcHelper.calcHeatTransfer(houseData.roofElement.uValue,
                                                              houseData.surfaceData.roofSurface,
                                                              houseData.tIn,tOut);
        energyData.enRoof = energyData.enRoof;
        return energyData;
    }


}
}
