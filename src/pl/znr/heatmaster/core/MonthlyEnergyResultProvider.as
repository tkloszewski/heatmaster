/**
 * Created by Dom on 2016-06-25.
 */
package pl.znr.heatmaster.core {
import pl.znr.heatmaster.core.calc.IMonthEnergyCalculator;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.calc.util.ICalculatedResultProvider;

public class MonthlyEnergyResultProvider implements ICalculatedResultProvider{

    private var dataContext:DataContext;
    private var month:int;
    private var calculator:IMonthEnergyCalculator;

    var monthInput:MonthInputData;

    var currentResult:MonthEnergyData = new MonthEnergyData();

    public function MonthlyEnergyResultProvider(dataContext:DataContext, month:int,calculator:IMonthEnergyCalculator) {
        this.dataContext = dataContext;
        this.month = month;
        this.calculator = calculator;

        this.monthInput = new MonthInputData(0,dataContext.environmentalData.groundTemperatures[month],
                dataContext.environmentalData.insolationData.groundInsolation45[month],
                dataContext.environmentalData.insolationData.southInsolation[month],
                dataContext.environmentalData.insolationData.westEastInsolation[month],
                dataContext.environmentalData.insolationData.northInsolation[month]);
    }

    public function getCalculatedResult():* {
        return currentResult;
    }

    public function applyRatio(tempM:Number, ratio:Number):void {
        monthInput.tOut = tempM;

        var energyData:MonthEnergyData = calculator.calcEnergy(new MonthEnergyData(),dataContext,monthInput);

        currentResult.enWalls = currentResult.enWalls + energyData.enWalls * ratio;
        currentResult.enRoof = currentResult.enRoof + energyData.enRoof * ratio;
        currentResult.enFloor = currentResult.enFloor + energyData.enFloor * ratio;
        currentResult.enFoundations = currentResult.enFoundations + energyData.enFoundations * ratio;
        currentResult.enWindows = currentResult.enWindows + energyData.enWindows * ratio;
        currentResult.enVent = currentResult.enVent + energyData.enVent * ratio;
        currentResult.enAir = currentResult.enAir + energyData.enAir * ratio;
        currentResult.enTightness = currentResult.enTightness + energyData.enTightness * ratio;
        currentResult.enRecuperator = currentResult.enRecuperator + energyData.enRecuperator * ratio;


        currentResult.enPersonGain = currentResult.enPersonGain + energyData.enPersonGain * ratio;
        currentResult.enElectricityGain = currentResult.enElectricityGain + energyData.enElectricityGain * ratio;
        currentResult.enSolGain = currentResult.enSolGain + energyData.enSolGain * ratio;
    }

}
}
