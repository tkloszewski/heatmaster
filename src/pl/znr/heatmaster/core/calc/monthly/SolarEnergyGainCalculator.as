/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 04.06.13
 * Time: 22:05
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc.monthly {
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.model.InsolationData;
import pl.znr.heatmaster.core.model.SurfaceData;

public class SolarEnergyGainCalculator implements IMonthEnergyCalculator{
    public function SolarEnergyGainCalculator() {
    }

    public function calcEnergy(energyData:MonthEnergyData, contextData:DataContext, monthInputData:MonthInputData):MonthEnergyData {
        var houseData:HouseData = contextData.houseData;
        var insolationS:Number = monthInputData.southInsolation;
        var insolationWE:Number = monthInputData.westEastInsolation;
        var insolationN:Number = monthInputData.northInsolation;

        energyData.enSolGain = calcSolEnergyGain(houseData.surfaceData,insolationS,insolationWE,insolationN,houseData.windowElement.winGain);

        return energyData;
    }

    private function calcSolEnergyGain(surfaceData:SurfaceData,insolationS:Number,insolationWE:Number,insolationN:Number,winGain:Number){
        return 0.7 * winGain * (1 - 0.2 * winGain) * (1000/24/30) * (insolationS * surfaceData.windowsSurfaceS +
                insolationWE * surfaceData.windowsSurfaceWE + insolationN * surfaceData.windowsSurfaceN);
    }
}
}
