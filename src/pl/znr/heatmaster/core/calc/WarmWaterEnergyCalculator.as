/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 12.07.13
 * Time: 22:46
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.model.WarmWaterData;

public class WarmWaterEnergyCalculator implements IMonthEnergyCalculator{
    public function WarmWaterEnergyCalculator() {
    }

    public function calcEnergy(energyData:MonthEnergyData, contextData:DataContext, monthInputData:MonthInputData):MonthEnergyData {
        var enWarmWater:Number = 0;
        var warmWaterData:WarmWaterData = contextData.houseData.warmWaterData;

        if (contextData.includeWarmWater) {
            enWarmWater = EnergyCalcHelper.calcWarmWaterEnergyLoss(contextData.houseData.personNumber);
            enWarmWater = enWarmWater / (warmWaterData.distributorEfficiency * warmWaterData.storeEfficiency);
        }
        energyData.enWarmWaterNormalized = enWarmWater;
        energyData.enWarmWater = enWarmWater * warmWaterData.consumptionIntensity;
        return energyData;
    }
}
}
