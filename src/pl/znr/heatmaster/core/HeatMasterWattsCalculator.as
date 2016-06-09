/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 21:16
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import mx.collections.ArrayList;
import mx.controls.Alert;

import pl.znr.heatmaster.core.calc.AiringEnergyCalculator;

import pl.znr.heatmaster.core.calc.CompositeEnergyCalculator;
import pl.znr.heatmaster.core.calc.ElectricityDevicesEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.FloorEnergyCalculator;
import pl.znr.heatmaster.core.calc.FoundationsEnergyCalculator;

import pl.znr.heatmaster.core.calc.IMonthEnergyCalculator;
import pl.znr.heatmaster.core.calc.PersonEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.RoofEnergyCalculator;
import pl.znr.heatmaster.core.calc.SolarCollectorEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.SolarEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.TightnessEnergyCalculator;
import pl.znr.heatmaster.core.calc.VentilationEnergyCalculator;
import pl.znr.heatmaster.core.calc.WallEnergyCalculator;
import pl.znr.heatmaster.core.calc.WarmWaterEnergyCalculator;
import pl.znr.heatmaster.core.calc.WindowsEnergyCalculator;
import pl.znr.heatmaster.core.model.EnvironmentalData;
import pl.znr.heatmaster.core.calc.MonthEnergyData;
import pl.znr.heatmaster.core.model.HouseData;

public class HeatMasterWattsCalculator {

    private var monthEnergyCalculator:CompositeEnergyCalculator = new CompositeEnergyCalculator();

    public function HeatMasterWattsCalculator() {
        monthEnergyCalculator.addEnergyCalculator(new WallEnergyCalculator());
        monthEnergyCalculator.addEnergyCalculator(new RoofEnergyCalculator());
        monthEnergyCalculator.addEnergyCalculator(new FloorEnergyCalculator());
        monthEnergyCalculator.addEnergyCalculator(new FoundationsEnergyCalculator());
        monthEnergyCalculator.addEnergyCalculator(new WindowsEnergyCalculator());
        monthEnergyCalculator.addEnergyCalculator(new VentilationEnergyCalculator());
        monthEnergyCalculator.addEnergyCalculator(new AiringEnergyCalculator());
        monthEnergyCalculator.addEnergyCalculator(new TightnessEnergyCalculator());
        monthEnergyCalculator.addEnergyCalculator(new WarmWaterEnergyCalculator());
        monthEnergyCalculator.addEnergyCalculator(new SolarEnergyGainCalculator());
        monthEnergyCalculator.addEnergyCalculator(new PersonEnergyGainCalculator());
        monthEnergyCalculator.addEnergyCalculator(new ElectricityDevicesEnergyGainCalculator());
        monthEnergyCalculator.addEnergyCalculator(new SolarCollectorEnergyGainCalculator());
    }

    public function calcEnergyDataWithGaussianBlurring(dataContext:DataContext):WattsEnergyResult{
        var environmentalData:EnvironmentalData = dataContext.environmentalData;

        var tS:Number = 3 * environmentalData.tSigma;
        var tSigma:Number = environmentalData.tSigma;

        var monthlyEnergyConsumption:Array = [];
        var monthlyEnergyBalance:Array = [];
        var monthlyEnergyHeatBalanceV1:Array = [];
        var monthlyEnergyHeatBalanceV2:Array = [];

        for(var month:int =0;month<12;month++){
            //Alert.show("trying to calculate for month: " + month);
            var sumProbability:Number = 0;
            var tempMonth:Number = environmentalData.temperatures[month];
            var val:Array = [];
            for(var tempM:Number = tempMonth - tS;tempM <= tempMonth + tS;tempM++){
                var chunkRatio:Number = 1/(tSigma * Math.sqrt(2*Math.PI)) * Math.exp(-(tempM - tempMonth)*(tempM - tempMonth)/(2*tSigma*tSigma));
                sumProbability += chunkRatio;
                val.push(chunkRatio);
            }
            //energy usage per month

            var energyDataM:MonthEnergyData = new MonthEnergyData();
            var weightedEnergyBalance:Number = 0;
            var weightedEnergyHeatBalanceV1:Number = 0;
            var weightedEnergyHeatBalanceV2:Number = 0;

            var enWallWeighted:Number = 0;
            var enRoofWeighted:Number = 0;
            var enFloorWeighted:Number = 0;
            var enFoundationsWeighted:Number = 0;
            var enWindowsWeighted:Number = 0;
            var enVentWeighted:Number = 0;
            var enAirWeighted:Number = 0;
            var enTightnessWeighted:Number = 0;
            var enRecuperatorWeighted:Number = 0;

            var enPersonGainWeighted:Number = 0;
            var enElectricityGainWeighted:Number = 0;
            var enSolGainWeighted:Number = 0;

            for(tempM = tempMonth - tS;tempM <= tempMonth + tS;tempM++){
                //Alert.show("Calculating energy for month: " + month);

                var ratio:Number = 1/(tSigma * Math.sqrt(2* Math.PI)) * Math.exp(-(tempM - tempMonth)*(tempM - tempMonth)/(2*tSigma*tSigma))/sumProbability;
                var energyData:MonthEnergyData = monthEnergyCalculator.calcEnergy(energyDataM,dataContext,month,tempM);

                enWallWeighted = enWallWeighted + energyData.enWalls * ratio;
                enRoofWeighted = enRoofWeighted + energyData.enRoof * ratio;
                enFloorWeighted = enFloorWeighted + energyData.enFloor * ratio;
                enFoundationsWeighted = enFoundationsWeighted + energyData.enFoundations * ratio;
                enWindowsWeighted = enWindowsWeighted + energyData.enWindows * ratio;
                enVentWeighted = enVentWeighted + energyData.enVent * ratio;
                enAirWeighted = enAirWeighted + energyData.enAir * ratio;
                enTightnessWeighted = enTightnessWeighted + energyData.enTightness * ratio;
                enRecuperatorWeighted = enRecuperatorWeighted + energyData.enRecuperator * ratio;


                enPersonGainWeighted = enPersonGainWeighted + energyData.enPersonGain * ratio;
                enElectricityGainWeighted = enElectricityGainWeighted + energyData.enElectricityGain * ratio;
                enSolGainWeighted = enSolGainWeighted + energyData.enSolGain * ratio;


                var energyBalance:Number = (energyData.enWalls + energyData.enRoof + energyData.enFloor + energyData.enWindows +
                        energyData.enVent + energyData.enAir + energyData.enFoundations + energyData.enTightness)
                        -
                        (energyData.enPersonGain + energyData.enSolGain + energyData.enElectricityGain);

                weightedEnergyBalance += energyBalance * ratio;

                if(energyBalance > 0){
                    weightedEnergyHeatBalanceV1 += energyBalance * ratio;
                }

                energyBalance =  (energyData.enWalls + energyData.enRoof + energyData.enFloor + energyData.enWindows +
                        energyData.enVent )
                        -
                        (energyData.enPersonGain + energyData.enSolGain + energyData.enElectricityGain);

                if(energyBalance > 0){
                    weightedEnergyHeatBalanceV2 += energyBalance * ratio;
                }

            }

            energyDataM.enWalls =  enWallWeighted;
            energyDataM.enRoof  =  enRoofWeighted;
            energyDataM.enFloor =  enFloorWeighted;
            energyDataM.enFoundations = enFoundationsWeighted;
            energyDataM.enWindows =  enWindowsWeighted;
            energyDataM.enVent =   enVentWeighted;
            energyDataM.enAir =  enAirWeighted;
            energyDataM.enTightness = enTightnessWeighted;
            energyDataM.enRecuperator = enRecuperatorWeighted;


            energyDataM.enPersonGain =  enPersonGainWeighted;
            energyDataM.enElectricityGain =  enElectricityGainWeighted;
            energyDataM.enSolGain =  enSolGainWeighted;

            monthlyEnergyConsumption.push(energyDataM);
            monthlyEnergyBalance.push(weightedEnergyBalance);
            monthlyEnergyHeatBalanceV1.push(weightedEnergyHeatBalanceV1);
            monthlyEnergyHeatBalanceV2.push(weightedEnergyHeatBalanceV2);

        }

        return new WattsEnergyResult(monthlyEnergyConsumption,monthlyEnergyBalance,monthlyEnergyHeatBalanceV1,monthlyEnergyHeatBalanceV2);
    }



}
}
