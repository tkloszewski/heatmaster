/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 14.05.15
 * Time: 21:58
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.util {
import flash.utils.Dictionary;

import pl.znr.heatmaster.constants.combo.AirTightness;
import pl.znr.heatmaster.constants.combo.DoorType;
import pl.znr.heatmaster.constants.combo.FoundationsType;
import pl.znr.heatmaster.constants.combo.HeatingSourceType;
import pl.znr.heatmaster.constants.combo.HouseStandardType;
import pl.znr.heatmaster.constants.combo.HouseType;
import pl.znr.heatmaster.constants.combo.InsulationElementType;
import pl.znr.heatmaster.constants.combo.InsulationMaterialType;
import pl.znr.heatmaster.constants.combo.SolarCollectorType;
import pl.znr.heatmaster.constants.combo.ThermalBridgesType;
import pl.znr.heatmaster.constants.combo.VentilationMethod;
import pl.znr.heatmaster.constants.combo.WarmWaterDistribution;
import pl.znr.heatmaster.constants.combo.WarmWaterStorage;
import pl.znr.heatmaster.constants.combo.WindowsType;
import pl.znr.heatmaster.core.model.FloorElement;
import pl.znr.heatmaster.core.model.HouseStandardTypeModel;
import pl.znr.heatmaster.core.model.SolarCollectorData;

public class HouseStandardModelHelper {


    public static function getUValueForElementType(insulationElementType:int,model:HouseStandardTypeModel):Number {
        if(insulationElementType == InsulationElementType.FLOOR){
           return model.floorUValue;
        }
        else if(insulationElementType == InsulationElementType.WALL){
            return model.wallUValue;
        }
        else if(insulationElementType == InsulationElementType.ROOF){
            return model.roofUValue;
        }
        return model.wallUValue;
    }

    public static function getMaterialInsulationForElementType(insulationElementType:int,model:HouseStandardTypeModel):InsulationMaterialType {
        if(insulationElementType == InsulationElementType.FLOOR){
            return model.floorInsulationMaterialType;
        }
        else if(insulationElementType == InsulationElementType.WALL){
            return model.wallInsulationMaterialType;
        }
        else if(insulationElementType == InsulationElementType.ROOF){
            return model.roofInsulationMaterialType;
        }
        return model.wallInsulationMaterialType;
    }

    public function HouseStandardModelHelper() {
    }
}
}
