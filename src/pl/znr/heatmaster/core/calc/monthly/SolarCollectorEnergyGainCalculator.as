/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 13.07.13
 * Time: 11:31
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc.monthly {
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.model.InsolationData;
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.model.SolarCollectorData;
import pl.znr.heatmaster.util.HouseTypeHelper;

public class SolarCollectorEnergyGainCalculator implements IMonthEnergyCalculator{
    public function SolarCollectorEnergyGainCalculator() {
    }

    public function calcEnergy(energyData:MonthEnergyData,contextData:DataContext,monthInputData:MonthInputData):MonthEnergyData {
        energyData.enCollectorSolarGain = 0;
        if (contextData.includeWarmWater && HouseTypeHelper.hasRegularRoof(contextData.houseData.houseType)) {
            var solarCollectorData:SolarCollectorData = contextData.solarCollectorData;
            var enCollectorSolarGain:Number = solarCollectorData.collectorType.efficiency * solarCollectorData.surface * monthInputData.groundInsolation45;
            energyData.enCollectorSolarGain = EnergyCalcHelper.convertkWhPerMonthToWatts(enCollectorSolarGain);
        }

        return energyData;
    }
}
}
