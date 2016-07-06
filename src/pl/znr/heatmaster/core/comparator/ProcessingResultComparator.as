/**
 * Created by Dom on 2016-07-04.
 */
package pl.znr.heatmaster.core.comparator {
import pl.znr.heatmaster.core.ProcessingResult;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.converter.RatioClusterFactory;

public class ProcessingResultComparator implements IProcessingResultComparator{

    public function ProcessingResultComparator() {
    }

    public function compare(referenceResult:ProcessingResult, newResult:ProcessingResult):ComparatorResult {
        var comparatorResult:ComparatorResult = new ComparatorResult();

        var refJanuaryMonthEnergyData:MonthEnergyData = referenceResult.wattsEnergyResult.monthlyEnergyConsumption[0];
        var newJanuaryMonthEnergyData:MonthEnergyData = newResult.wattsEnergyResult.monthlyEnergyConsumption[0];

        comparatorResult.walls = createComparatorResultItem(refJanuaryMonthEnergyData.enWalls,newJanuaryMonthEnergyData.enWalls,1);
        comparatorResult.doors = createComparatorResultItem(refJanuaryMonthEnergyData.enDoor,newJanuaryMonthEnergyData.enDoor,1);
        comparatorResult.windows = createComparatorResultItem(refJanuaryMonthEnergyData.enWindows,newJanuaryMonthEnergyData.enWindows,1);
        comparatorResult.roof = createComparatorResultItem(refJanuaryMonthEnergyData.enRoof,newJanuaryMonthEnergyData.enRoof,1);
        comparatorResult.floor = createComparatorResultItem(refJanuaryMonthEnergyData.enFloor,newJanuaryMonthEnergyData.enFloor,1);
        comparatorResult.vent = createComparatorResultItem(refJanuaryMonthEnergyData.enVent,newJanuaryMonthEnergyData.enVent,1);
        comparatorResult.tightness = createComparatorResultItem(refJanuaryMonthEnergyData.enTightness,newJanuaryMonthEnergyData.enTightness,1);
        comparatorResult.solarGains = createComparatorResultItem(refJanuaryMonthEnergyData.enSolGain,newJanuaryMonthEnergyData.enSolGain,-1);
        comparatorResult.personGains = createComparatorResultItem(refJanuaryMonthEnergyData.enPersonGain,newJanuaryMonthEnergyData.enPersonGain,-1);

        comparatorResult.refBalanceValueInWatts = calculateBalanceValueInWatts(comparatorResult);
        comparatorResult.refBalanceValueInKwh = comparatorResult.refBalanceValueInWatts * RatioClusterFactory.fromWattsToKwhRatio();
        comparatorResult.savedBalancedValueInWatts = calculateBalanceValueSavedInWatts(comparatorResult);
        comparatorResult.savedBalancedValueInKwh = comparatorResult.savedBalancedValueInWatts * RatioClusterFactory.fromWattsToKwhRatio();

        return comparatorResult;
    }

    private function calculateBalanceValueInWatts(comparatorResult:ComparatorResult):Number{
        return  comparatorResult.walls.refValueInWatts + comparatorResult.doors.refValueInWatts +
                comparatorResult.windows.refValueInWatts + comparatorResult.roof.refValueInWatts +
                comparatorResult.floor.refValueInWatts + comparatorResult.vent.refValueInWatts -
                (comparatorResult.solarGains.refValueInWatts + comparatorResult.personGains.refValueInWatts);
    }

    private function calculateBalanceValueSavedInWatts(comparatorResult:ComparatorResult):Number{
        return  comparatorResult.walls.valueSavedInWatts + comparatorResult.doors.valueSavedInWatts +
                comparatorResult.windows.valueSavedInWatts + comparatorResult.roof.valueSavedInWatts +
                comparatorResult.floor.valueSavedInWatts + comparatorResult.vent.valueSavedInWatts +
                comparatorResult.solarGains.valueSavedInWatts + comparatorResult.personGains.valueSavedInWatts;
    }


    private function createComparatorResultItem(refValueWatts:Number, newValueWatts:Number, saveSign:int):ComparatorResultItem{
        var comparatorItem:ComparatorResultItem = new ComparatorResultItem();
        var refValueInKwh:Number = refValueWatts * RatioClusterFactory.fromWattsToKwhRatio();
        var newValueInKwh:Number = newValueWatts * RatioClusterFactory.fromWattsToKwhRatio();

        comparatorItem.refValueInWatts = refValueWatts;
        comparatorItem.refValueInKwh = refValueInKwh;
        comparatorItem.valueChanged = refValueWatts != newValueWatts;
        comparatorItem.valueSavedInWatts = saveSign * (refValueWatts - newValueWatts);
        comparatorItem.valueSavedInKwh = saveSign * (refValueInKwh - newValueInKwh);

        return comparatorItem;
    }

    private function toAverageWattsValue(monthlyEnergyConsumption:Array):MonthEnergyData{
        var avgMonthEnergyData:MonthEnergyData = new MonthEnergyData();
        var length:int = monthlyEnergyConsumption.length;
        for(var i:int = 0; i< length; i++){
            var monthEnergyData:MonthEnergyData = monthlyEnergyConsumption[i] as MonthEnergyData;
            avgMonthEnergyData.enWalls = avgMonthEnergyData.enWalls + monthEnergyData.enWalls/length;
            avgMonthEnergyData.enRoof = avgMonthEnergyData.enRoof + monthEnergyData.enRoof/length;
            avgMonthEnergyData.enFloor = avgMonthEnergyData.enFloor + monthEnergyData.enFloor/length;
            avgMonthEnergyData.enFoundations = avgMonthEnergyData.enFoundations + monthEnergyData.enFoundations/length;
            avgMonthEnergyData.enDoor = avgMonthEnergyData.enDoor + monthEnergyData.enDoor/length;
            avgMonthEnergyData.enTightness = avgMonthEnergyData.enTightness + monthEnergyData.enTightness/length;
            avgMonthEnergyData.enVent = avgMonthEnergyData.enVent + monthEnergyData.enVent/length;
            avgMonthEnergyData.enSolGain = avgMonthEnergyData.enSolGain + monthEnergyData.enSolGain/length;
            avgMonthEnergyData.enPersonGain = avgMonthEnergyData.enPersonGain + monthEnergyData.enPersonGain/length;
        }
        return avgMonthEnergyData;
    }





}
}
