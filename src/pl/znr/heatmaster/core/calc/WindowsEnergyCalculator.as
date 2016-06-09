/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 04.06.13
 * Time: 20:45
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.calc.EnergyCalcHelper;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.calc.MonthEnergyData;
import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.core.model.WindowElement;

public class WindowsEnergyCalculator implements IMonthEnergyCalculator{
    public function WindowsEnergyCalculator() {
    }


    public function calcEnergy(energyData:MonthEnergyData, contextData:DataContext, month:int, tOut:Number):MonthEnergyData {
        var houseData:HouseData = contextData.houseData;
        var surfaceData:SurfaceData = houseData.surfaceData;
        var windowElement:WindowElement = houseData.windowElement;

        var enWindows:Number = EnergyCalcHelper.calcHeatTransfer(windowElement.uValue,
                surfaceData.windowsSurface,houseData.tIn,tOut);

        if(houseData.windowElement.shutters){
            enWindows = enWindows * 0.8;
        }

        var thermalBridgesUValue:Number = windowElement.thermalBridgesType.uValue;
        enWindows += thermalBridgesUValue * (houseData.tIn - tOut) * surfaceData.windowsSurface * 3;


        energyData.enWindows = Math.max(enWindows,0);
        return energyData;
    }
}
}
