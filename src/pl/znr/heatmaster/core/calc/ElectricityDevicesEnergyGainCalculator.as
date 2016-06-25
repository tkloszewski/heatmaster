/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 04.06.13
 * Time: 22:18
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import pl.znr.heatmaster.constants.combo.ElectricityConsumption;
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.EnergyCalcHelper;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;

public class ElectricityDevicesEnergyGainCalculator implements IMonthEnergyCalculator{
    public function ElectricityDevicesEnergyGainCalculator() {
    }


    public function calcEnergy(energyData:MonthEnergyData, contextData:DataContext, monthInputData:MonthInputData):MonthEnergyData {
        energyData.enElectricityGain = 0;
        return energyData;
    }

    private function calElectricityDevicesGain(personNumber:Number,electricityUsage:int):Number {
        var enGain:Number = 0;
        if(personNumber == 1){
            enGain = 1300;
        }
        else if(personNumber == 2){
            enGain = 1930;
        }
        else if(personNumber == 3){
            enGain = 2480;
        }
        else if(personNumber == 4){
            enGain = 2830;
        }
        else if(personNumber >= 5){
            enGain = 2830 + 420 * (personNumber - 4);
        }

        if(electricityUsage == ElectricityConsumption.VERY_LOW){
            enGain *= 0.5;
        }
        else if(electricityUsage == ElectricityConsumption.LOW){
            enGain *= 0.8;
        }
        else if(electricityUsage == ElectricityConsumption.BIG){
            enGain *= 1.4;
        }
        else if(electricityUsage == ElectricityConsumption.VERY_BIG){
            enGain *= 2.0;
        }

        enGain = EnergyCalcHelper.convertkWhPerYearToWatts(enGain);

        return enGain;
    }
}
}
