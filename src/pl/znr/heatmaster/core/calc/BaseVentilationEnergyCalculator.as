/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 04.06.13
 * Time: 21:29
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import mx.controls.Alert;

import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.model.VentilationData;

public class BaseVentilationEnergyCalculator implements IMonthEnergyCalculator{
    public function BaseVentilationEnergyCalculator() {
    }


    public function calcEnergy(energyData:MonthEnergyData, contextData:DataContext, monthIinputData:MonthInputData):MonthEnergyData {
        try {
            var houseData:HouseData = contextData.houseData;

            var heatCoefficient:Number = calcHeatCoefficient(houseData.ventilationData);
            var tInEffective:Number = calcEffectiveTIn(contextData, monthIinputData.tOut,monthIinputData.tGround);
            var airVolume:Number = calcAirVolume(contextData, monthIinputData.tOut,tInEffective);
            var energy:Number = EnergyCalcHelper.calcAirHeatEnergyTransfer(airVolume, houseData.tIn,
                    tInEffective, heatCoefficient);


            energyData = applyCalculatedEnergy(energy, energyData);

        } catch (e:Error) {
            Alert.show("Error", e.message);
        }


        return energyData;
    }

    protected function applyCalculatedEnergy(energy:Number,energyData:MonthEnergyData):MonthEnergyData {
        return energyData;
    }

    protected function calcHeatCoefficient(ventData:VentilationData):Number {
        return 1;
    }

    protected function calcAirVolume(contextData:DataContext,tOut:Number,tInEffective:Number):Number {
        return 0;
    }

    protected function calcEffectiveTIn(contextData:DataContext,tOut:Number,tGround:Number):Number {
        return tOut;
    }


    protected function getType():int {
        return 0;
    }


}
}
