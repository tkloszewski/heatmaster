/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 03.06.13
 * Time: 21:10
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.model.EnvironmentalData;
import pl.znr.heatmaster.core.calc.MonthEnergyData;
import pl.znr.heatmaster.core.calc.MonthEnergyData;
import pl.znr.heatmaster.core.model.HouseData;

public interface IMonthEnergyCalculator {

    function calcEnergy(energyData:MonthEnergyData,contextData:DataContext,month:int,tOut:Number):MonthEnergyData;


}
}
