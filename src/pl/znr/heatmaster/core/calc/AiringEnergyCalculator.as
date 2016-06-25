/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 04.06.13
 * Time: 21:35
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import mx.utils.NameUtil;

import pl.znr.heatmaster.constants.combo.DropDownType;
import pl.znr.heatmaster.constants.combo.VentilationFrequency;
import pl.znr.heatmaster.constants.combo.VentilationMethod;
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.core.model.VentilationData;

public class AiringEnergyCalculator extends BaseVentilationEnergyCalculator{
    public function AiringEnergyCalculator() {
    }


    override public function calcEnergy(energyData:MonthEnergyData, contextData:DataContext, monthInput:MonthInputData):MonthEnergyData {
        if (contextData.houseData.ventilationData.ventilationMethodObject.type == VentilationMethod.GRAVITATIONAL) {
            return super.calcEnergy(energyData, contextData, monthInput);
        }
        energyData.enAir = 0;
        return energyData;
    }

    override protected function applyCalculatedEnergy(energy:Number, energyData:MonthEnergyData):MonthEnergyData {
        energyData.enAir = Math.max(energy,0);
        return energyData;
    }

    override protected function calcAirVolume(contextData:DataContext, tOut:Number,tInEffective:Number):Number {
        var houseData:HouseData = contextData.houseData;
        var surfaceData:SurfaceData = houseData.surfaceData;
        var ventData:VentilationData = houseData.ventilationData;

        var airVolume:Number = EnergyCalcHelper.calcStandardVentilationVolume(surfaceData.totalSurface);


        var gravitationalResidualVolume:Number = 0;
        if(tOut > 12){
           var tDiff:Number = Math.max(0,houseData.tIn - tOut);
           gravitationalResidualVolume = Math.max(0,airVolume * (1 - Math.pow(tDiff/8,0.6)));
        }

        if(ventData.ventilationFreq == VentilationFrequency.SPORADICALLY){
            airVolume = 0.0 ;
            if(tOut > 12){
               airVolume += 0.25 * gravitationalResidualVolume;
            }
        }
        else if(ventData.ventilationFreq == VentilationFrequency.STANDARD){
            airVolume = 0.1 * airVolume;
            if(tOut > 12){
                airVolume += 0.5 * gravitationalResidualVolume;
            }
        }
        else if(ventData.ventilationFreq == VentilationFrequency.OFTEN){
            airVolume = 0.25 * airVolume;
            if(tOut > 12){
                airVolume += gravitationalResidualVolume;
            }
        }
        else if(ventData.ventilationFreq == VentilationFrequency.VERY_OFTEN){
            airVolume = 0.5 * airVolume;
            if(tOut > 12){
                airVolume += 1.5 * gravitationalResidualVolume;
            }
        }
        else if(ventData.ventilationFreq == VentilationFrequency.NON_STOP){
            //airVolume = 2 * airVolume;
            if(tOut > 12){
                airVolume += 2 * gravitationalResidualVolume;
            }
        }
        return airVolume;
    }

    override protected function getType():int {
        return 2;
    }
}
}
