/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.08.13
 * Time: 21:42
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import pl.znr.heatmaster.core.model.EnvironmentalData;
import pl.znr.heatmaster.core.model.HeatingSourceData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.model.InsolationData;
import pl.znr.heatmaster.core.model.WarmWaterData;

public class DataContextValidator {
    public function DataContextValidator() {
    }

    public function validate(dataContext:DataContext)  {
        var houseData:HouseData = dataContext.houseData;
        if(houseData == null){
            throw new Error("No houseData");
        }
        if(houseData.buildingAge == null){
            throw new Error("No BuildingAge");
        }
        if(houseData.doorType == null){
            throw new Error("No DoorType");
        }
        if(houseData.floorElement == null){
            throw new Error("Np floorElement");
        }

        if(houseData.wallElement == null){
            throw new Error("Np wallElement");
        }

        if(houseData.roofElement == null){
            throw new Error("Np roofElement");
        }

        if(houseData.windowElement == null){
            throw new Error("Np windowElement");
        }
        if(houseData.warmWaterData == null){
            throw new Error("No warmWaterData");
        }
        var warmWaterData:WarmWaterData =  houseData.warmWaterData;
        if(warmWaterData.warmWaterDistribution == null){
            throw new Error("No WarmWaterDistribution");
        }
        if(warmWaterData.warmWaterStorage == null){
            throw new Error("No WarmWaterStorage");
        }

        if(houseData.surfaceData == null){
            throw new Error("No SurfaceData");
        }

        if(houseData.ventilationData == null){
            throw new Error("No VentilationData");
        }

        if(dataContext.conversionData == null){
            throw new Error("No ConversionData");
        }

        var heatingData:HeatingSourceData = dataContext.heatingData;
        if(heatingData == null){
            throw new Error("No HeatingData");
        }
        var environmentalData:EnvironmentalData = dataContext.environmentalData;
        if(environmentalData == null){
            throw new Error("No environmentalData");
        }
        if(environmentalData.groundTemperatures == null){
            throw new Error("No groundTemperatures");
        }
        if(environmentalData.temperatures == null){
            throw new Error("No temperatures");
        }
        var insolationData:InsolationData = environmentalData.insolationData;
        if(insolationData == null){
            throw new Error("No InsolationData");
        }
        if(insolationData.northInsolation == null){
            throw new Error("No northInsolationa")
        }
        if(insolationData.southInsolation == null){
            throw new Error("No southInsolation")
        }
        if(insolationData.westEastInsolation == null){
            throw new Error("No westEastInsolation")
        }
        if(insolationData.groundInsolation45 == null){
            throw new Error("No groundInsolation45");
        }
    }
}
}
