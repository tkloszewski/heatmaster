/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 21:16
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import pl.znr.heatmaster.core.calc.AiringEnergyCalculator;
import pl.znr.heatmaster.core.calc.CompositeEnergyCalculator;
import pl.znr.heatmaster.core.calc.ElectricityDevicesEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.FloorEnergyCalculator;
import pl.znr.heatmaster.core.calc.FoundationsEnergyCalculator;
import pl.znr.heatmaster.core.calc.PersonEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.RoofEnergyCalculator;
import pl.znr.heatmaster.core.calc.SolarCollectorEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.SolarEnergyGainCalculator;
import pl.znr.heatmaster.core.calc.TightnessEnergyCalculator;
import pl.znr.heatmaster.core.calc.VentilationEnergyCalculator;
import pl.znr.heatmaster.core.calc.WallEnergyCalculator;
import pl.znr.heatmaster.core.calc.WarmWaterEnergyCalculator;
import pl.znr.heatmaster.core.calc.WindowsEnergyCalculator;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
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
