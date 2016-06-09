/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 04.06.13
 * Time: 22:05
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.calc.MonthEnergyData;
import pl.znr.heatmaster.core.model.InsolationData;
import pl.znr.heatmaster.core.model.SurfaceData;

public class SolarEnergyGainCalculator implements IMonthEnergyCalculator{
    public function SolarEnergyGainCalculator() {
    }

    public function calcEnergy(energyData:MonthEnergyData, contextData:DataContext, month:int, tOut:Number):MonthEnergyData {
        var houseData:HouseData = contextData.houseData;
        var insolationData:InsolationData = contextData.environmentalData.insolationData;
        var insolationS:Number = insolationData.southInsolation[month];
        var insolationWE:Number = insolationData.westEastInsolation[month];
        var insolationN:Number = insolationData.northInsolation[month];


        energyData.enSolGain = calcSolEnergyGain(houseData.surfaceData,insolationS,insolationWE,insolationN,houseData.windowElement.winGain);

        return energyData;
    }

    private function calcSolEnergyGain(surfaceData:SurfaceData,insolationS:Number,insolationWE:Number,insolationN:Number,winGain:Number){
        return 0.7 * winGain * (1 - 0.2 * winGain) * (1000/24/30) * (insolationS * surfaceData.windowsSurfaceS +
                insolationWE * surfaceData.windowsSurfaceWE + insolationN * surfaceData.windowsSurfaceN);
    }
}
}
