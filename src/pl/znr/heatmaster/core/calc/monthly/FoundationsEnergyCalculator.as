/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 27.06.13
 * Time: 08:19
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc.monthly {
import pl.znr.heatmaster.core.calc.*;
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.model.MonthEnergyData;
import pl.znr.heatmaster.core.calc.model.MonthInputData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.util.HouseTypeHelper;

public class FoundationsEnergyCalculator implements IMonthEnergyCalculator{
    public function FoundationsEnergyCalculator() {
    }


    public function calcEnergy(energyData:MonthEnergyData, contextData:DataContext, monthInput:MonthInputData):MonthEnergyData {
        var houseData:HouseData = contextData.houseData;
        var tAvg:Number = contextData.environmentalData.tAvg;

        var sideLength:Number = Math.sqrt(houseData.surfaceData.floorSurface);
        var housePerimeter:Number = 4 * sideLength;

        var enFloorCenter:Number = 0;
        var enFloorEdge:Number = 0;
        var isGroundType:Boolean = HouseTypeHelper.isGroundType(houseData.houseType);

        var foundationsEnabled:Boolean =  isGroundType && houseData.foundationsEnabled;

        if(foundationsEnabled){
            var foundationsUValue:Number = isNaN(houseData.foundationsUValue) ? 0.75 : houseData.foundationsUValue;
            enFloorEdge = foundationsUValue * (houseData.tIn - monthInput.tGround) * housePerimeter + foundationsUValue * (houseData.tIn - tAvg) * 0.5 * housePerimeter;
        }

        energyData.enFoundations = enFloorCenter + enFloorEdge;
        return energyData;
    }
}
}
