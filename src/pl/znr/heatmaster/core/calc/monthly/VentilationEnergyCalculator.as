/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 04.06.13
 * Time: 20:48
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc.monthly {
import pl.znr.heatmaster.constants.combo.VentilationMethod;
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.core.model.VentilationData;

public class VentilationEnergyCalculator extends BaseVentilationEnergyCalculator{
    public function VentilationEnergyCalculator() {
    }


    override public function calcEnergy(energyData:MonthEnergyData, contextData:DataContext, monthInput:MonthInputData):MonthEnergyData {
        energyData = super.calcEnergy(energyData, contextData, monthInput);
        var enRecuperator:Number = 0;

        var ventData:VentilationData = contextData.houseData.ventilationData;
        if(ventData.ventilationMethodObject.type == VentilationMethod.MECHANICAL){
            var tInEffective:Number = calcEffectiveTIn(contextData, monthInput.tOut,monthInput.tGround);
            var airVolumePerHour:Number = calcAirVolume(contextData, monthInput.tOut,tInEffective) * 3600;
            enRecuperator = 0.35 * airVolumePerHour;
        }
        energyData.enRecuperator = enRecuperator;

        return energyData;
    }

    protected override  function applyCalculatedEnergy(energy:Number,energyData:MonthEnergyData):MonthEnergyData {
        energyData.enVent = energy;
        return energyData;
    }

    protected override function calcHeatCoefficient(ventData:VentilationData):Number {
        var heatCoefficient:Number = 1;
        if(ventData.ventilationMethodObject.type == VentilationMethod.MECHANICAL){
            heatCoefficient = 1 - ventData.ventilationMethodObject.efficiency;
        }
        return heatCoefficient;
    }

    protected override function calcAirVolume(contextData:DataContext,tOut:Number,tInEffective:Number):Number {
        var houseData:HouseData = contextData.houseData;
        var surfaceData:SurfaceData = houseData.surfaceData;
        var ventData:VentilationData = houseData.ventilationData;
        var airVolume:Number = EnergyCalcHelper.calcASHRAEStandardVentilationVolume(surfaceData.totalSurface,contextData.houseData.personNumber);

        if(ventData.ventilationMethodObject.type == VentilationMethod.MECHANICAL){
            if(ventData.co2Sensor){
                airVolume = 15.75/3600 * contextData.houseData.personNumber;
            }
        }
        else {
            if((ventData.ventilationMethodObject == VentilationMethod.NATURAL_REGULATED && tOut >= 12) || (ventData.ventilationMethodObject == VentilationMethod.NATURAL)){
                var tDiff:Number = Math.max(0,houseData.tIn - tInEffective);
                airVolume = airVolume * Math.pow((tDiff)/8,0.6);
            }

        }

        return airVolume;
    }

    protected override function calcEffectiveTIn(contextData:DataContext,tOut:Number,tGround:Number):Number {
        if(contextData.houseData.ventilationData.ventilationMethodObject.type == VentilationMethod.MECHANICAL && contextData.houseData.ventilationData.gwcSet && tOut < contextData.environmentalData.tAvg){
            return (tOut + tGround)/2;
        }
        return tOut;
    }

    override protected function getType():int {
        return 1;
    }
}
}
