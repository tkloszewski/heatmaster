/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 03.06.13
 * Time: 21:09
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import mx.collections.ArrayCollection;

import pl.znr.heatmaster.core.DataContext;

public class CompositeEnergyCalculator implements IMonthEnergyCalculator{

    private var energyCalculators:ArrayCollection = new ArrayCollection();

    public function CompositeEnergyCalculator() {
    }

    public function calcEnergy(energyData:MonthEnergyData,dataContext:DataContext, month:int, tOut:Number):MonthEnergyData {
        for(var i:int = 0;i < energyCalculators.length;i++){
            var energyCalculator:IMonthEnergyCalculator = energyCalculators.getItemAt(i) as IMonthEnergyCalculator;
            energyData = energyCalculator.calcEnergy(energyData,dataContext,month,tOut);
        }

        return energyData;
    }

    public function addEnergyCalculator(energyCalculator:IMonthEnergyCalculator):void {
        energyCalculators.addItem(energyCalculator);
    }
}
}
