/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 12:03
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import flash.net.registerClassAlias;

import pl.znr.heatmaster.constants.combo.ElectricityConsumption;

import pl.znr.heatmaster.constants.combo.VentilationMethod;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.core.model.VentilationData;

public class EnergyCalcHelper {

    public static const AIR_HEAT_CAPACITY:Number = 1200;

    public function EnergyCalcHelper() {
    }

    public static function calcPersonEnGain(personNumber:Number):Number {
        var enGain:Number = 0;
        if(personNumber > 2){
            enGain = personNumber * (6*130 + 8*80)/24 +  (personNumber - 2) * (6*100 + 8*60)/24;
        }
        else {
            enGain = personNumber * (6*130 + 8*80)/24;
        }
        return enGain;
    }

    public static function calElectricityDevicesGain(personNumber:Number,electricityUsage:int):Number {
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

        enGain = convertkWhPerYearToWatts(enGain);

        return enGain;
    }

    public static function calcHeatTransfer(uValue:Number,surfaceArea:Number,tIn:Number,tOut:Number):Number {
        return uValue * surfaceArea * (tIn - tOut);
    }

    public static function calcStandardVentilationVolume(totalSurface:Number):Number {
        var volume:Number = Math.max(1.25 * totalSurface,150);
        volume = volume/3600;
        return volume;
    }

    public static function calcASHRAEStandardVentilationVolume(totalSurface:Number,personNum:int):Number {
        var volume:Number = 0.54 * totalSurface + 12.6 * personNum;
        volume = volume/3600;
        return volume;
    }

    public static function calcAirHeatEnergyTransfer(airVolume:Number,tIn:Number,tOut:Number,heatCoefficient:Number):Number{
        return airVolume * EnergyCalcHelper.AIR_HEAT_CAPACITY * (tIn - tOut) * heatCoefficient;
    }

    public static function calcWarmWaterEnergyLoss(personNumber:int):Number {
        return 35 * (55 - 10) * 4190 / (24 * 3600) * personNumber;
    }

    public static function convertkWhPerYearToWatts(value:Number):Number{
        return value * 1000/365.25/24;
    }

    public static function convertkWhPerMonthToWatts(value:Number):Number {
        return value * 1000/30/24;
    }
}
}
