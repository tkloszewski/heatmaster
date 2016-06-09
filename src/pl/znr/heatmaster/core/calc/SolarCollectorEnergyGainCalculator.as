/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 13.07.13
 * Time: 11:31
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import pl.znr.heatmaster.core.model.InsolationData;
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.model.SolarCollectorData;
import pl.znr.heatmaster.util.HouseTypeHelper;

public class SolarCollectorEnergyGainCalculator implements IMonthEnergyCalculator{
    public function SolarCollectorEnergyGainCalculator() {
    }

    public function calcEnergy(energyData:MonthEnergyData,contextData:DataContext, month:int, tOut:Number):MonthEnergyData {
        energyData.enCollectorSolarGain = 0;
        if (contextData.includeWarmWater && HouseTypeHelper.hasRegularRoof(contextData.houseData.houseType)) {
            var solarCollectorData:SolarCollectorData = contextData.solarCollectorData;
            var insolationData:Array = contextData.environmentalData.insolationData.groundInsolation45;
            var enCollectorSolarGain:Number = solarCollectorData.collectorType.efficiency * solarCollectorData.surface * insolationData[month];
            energyData.enCollectorSolarGain = EnergyCalcHelper.convertkWhPerMonthToWatts(enCollectorSolarGain);
        }

        return energyData;
    }
}
}
