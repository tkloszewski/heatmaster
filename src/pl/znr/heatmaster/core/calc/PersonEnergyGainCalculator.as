/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 04.06.13
 * Time: 22:14
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import mx.controls.Alert;

import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.model.WarmWaterData;

public class PersonEnergyGainCalculator implements IMonthEnergyCalculator{
    public function PersonEnergyGainCalculator() {
    }

    public function calcEnergy(energyData:MonthEnergyData, contextData:DataContext, monthInputData:MonthInputData):MonthEnergyData {
        var enWarmWater:Number = 0;
        var warmWaterData:WarmWaterData = contextData.houseData.warmWaterData;

        var enPersonGain:Number = calcPersonEnGain(contextData.houseData.personNumber);
        if (contextData.includeWarmWater) {
            enWarmWater = EnergyCalcHelper.calcWarmWaterEnergyLoss(contextData.houseData.personNumber);
        }
        var enWarmWaterGain:Number = 0.4 * enWarmWater * (1/(warmWaterData.distributorEfficiency * warmWaterData.storeEfficiency) - 1);

        energyData.enPersonGain = enPersonGain;
        energyData.enWarmWaterGain = enWarmWaterGain;

        return energyData;
    }

    private function calcPersonEnGain(personNumber:Number):Number {
        var enGain:Number = 5.3 * (80 * personNumber + 275);
        enGain = EnergyCalcHelper.convertkWhPerYearToWatts(enGain);
        return enGain;
    }
}
}
