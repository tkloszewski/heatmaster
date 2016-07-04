/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 23.06.13
 * Time: 17:30
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc.monthly {
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.core.model.VentilationData;

public class TightnessEnergyCalculator implements IMonthEnergyCalculator{
    public function TightnessEnergyCalculator() {
    }

    public function calcEnergy(energyData:MonthEnergyData, contextData:DataContext, monthInputData:MonthInputData):MonthEnergyData {
        var houseData:HouseData = contextData.houseData;
        var ventilationData:VentilationData = houseData.ventilationData;
        var surfaceData:SurfaceData = houseData.surfaceData;
        var airVolume:Number = 0.05 * ventilationData.tightness * surfaceData.totalSurface * surfaceData.floorHeight/3600;
        var value:Number = EnergyCalcHelper.calcAirHeatEnergyTransfer(airVolume,houseData.tIn,monthInputData.tOut,1);
        energyData.enTightness =value;

        return energyData;
    }
}
}
