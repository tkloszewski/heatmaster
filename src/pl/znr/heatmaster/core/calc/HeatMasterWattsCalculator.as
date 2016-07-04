/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 21:16
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import pl.znr.heatmaster.core.*;
import pl.znr.heatmaster.core.calc.monthly.AiringEnergyCalculator;
import pl.znr.heatmaster.core.calc.monthly.CompositeEnergyCalculator;
import pl.znr.heatmaster.core.calc.monthly.ElectricityDevicesEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.monthly.FloorEnergyCalculator;
import pl.znr.heatmaster.core.calc.monthly.FoundationsEnergyCalculator;
import pl.znr.heatmaster.core.calc.monthly.PersonEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.monthly.RoofEnergyCalculator;
import pl.znr.heatmaster.core.calc.monthly.SolarCollectorEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.monthly.SolarEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.monthly.TightnessEnergyCalculator;
import pl.znr.heatmaster.core.calc.monthly.VentilationEnergyCalculator;
import pl.znr.heatmaster.core.calc.monthly.WallEnergyCalculator;
import pl.znr.heatmaster.core.calc.monthly.WarmWaterEnergyCalculator;
import pl.znr.heatmaster.core.calc.monthly.WindowsEnergyCalculator;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.calc.util.BalanceValueHelper;
import pl.znr.heatmaster.core.calc.util.CalcUtils;
import pl.znr.heatmaster.core.calc.util.GaussianDistributor;
import pl.znr.heatmaster.core.calc.util.ICalculatedResultProvider;
import pl.znr.heatmaster.core.calc.util.TemperatureCalculator;
import pl.znr.heatmaster.core.model.EnvironmentalData;

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

        var tSigma:Number = environmentalData.tSigma;

        var monthlyEnergyConsumption:Array = [];

        for(var month:int =0;month<12;month++){
            var tempMonth:Number = environmentalData.temperatures[month];

            var monthlyEnergyResultProvider:ICalculatedResultProvider = new MonthlyEnergyResultProvider(dataContext,month,monthEnergyCalculator);
            var gaussianDistribution:GaussianDistributor = new GaussianDistributor(tempMonth,tSigma);
            gaussianDistribution.apply(monthlyEnergyResultProvider);

            var monthlyResult:MonthEnergyData = monthlyEnergyResultProvider.getCalculatedResult();
            monthlyEnergyConsumption.push(monthlyResult);
        }

        var result:WattsEnergyResult = new WattsEnergyResult(monthlyEnergyConsumption);
        result.heatingSourceMaxPower = calcMaxHeatingPower(dataContext);

        return result;
    }

    public function calcMaxHeatingPower(dataContext:DataContext):Number {
        var environmentalData:EnvironmentalData = dataContext.environmentalData;

        var tMin:Number = environmentalData.tMin;
        var tGroundMin:Number = TemperatureCalculator.calcMinTemperature(environmentalData.groundTemperatures);
        var insolationGround45Min:Number = CalcUtils.minValue(environmentalData.insolationData.groundInsolation45);
        var insolationSouthMin:Number = CalcUtils.minValue(environmentalData.insolationData.southInsolation);
        var insolationWestEastMin:Number = CalcUtils.minValue(environmentalData.insolationData.westEastInsolation);
        var insolationNorthMin:Number = CalcUtils.minValue(environmentalData.insolationData.northInsolation);

        var monthInput:MonthInputData = new MonthInputData(tMin,tGroundMin,insolationGround45Min,insolationSouthMin,insolationWestEastMin,insolationNorthMin);
        var energyData:MonthEnergyData = monthEnergyCalculator.calcEnergy(new MonthEnergyData(),dataContext,monthInput);

        return BalanceValueHelper.calcBaseNormalizedBalanceValue(energyData);

    }



}
}
