/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 14.05.15
 * Time: 21:58
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.util {
import pl.znr.heatmaster.config.dictionary.model.InsulationMaterialType;
import pl.znr.heatmaster.constants.combo.InsulationElementType;
import pl.znr.heatmaster.core.model.HouseStandardTypeModel;

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
