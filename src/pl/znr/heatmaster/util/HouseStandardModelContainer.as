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

public class HouseStandardModelContainer {

    private static const _oldNonInsulated:HouseStandardTypeModel = new HouseStandardTypeModel(
            InsulationMaterialType.STANDARD,
            InsulationMaterialType.STANDARD,
            InsulationMaterialType.STANDARD,
            VentilationMethod.NATURAL,
            FoundationsType.TRADITIONAL,
            ThermalBridgesType.MAX,
            DoorType.NON_ENERGY_SAVING,
            WindowsType.TWO_PANE_OLD_WINDOWS,
            HeatingSourceType.COAL_OLD,
            HeatingSourceType.BOILER_GAS_OLD,
            HeatingSourceType.BOILER_GAS_OLD,
            HeatingSourceType.BOILER_GAS_OLD,
            SolarCollectorData.createSolarCollectorData(SolarCollectorType.NONE,0),
            WarmWaterDistribution.NOT_ISOLATED_PIPES,
            WarmWaterStorage.HEAT_NODE_WITHOUT_STORAGE,
            0.8,
            1.2,
            0.5,
            AirTightness.LOOSE,
            1.0,
            Number.NaN,
            false,
            false
    );

    private static const _oldInsulated:HouseStandardTypeModel = new HouseStandardTypeModel(
            InsulationMaterialType.STANDARD,
            InsulationMaterialType.STANDARD,
            InsulationMaterialType.STANDARD,
            VentilationMethod.NATURAL,
            FoundationsType.TRADITIONAL,
            ThermalBridgesType.MAX,
            DoorType.STANDARD,
            WindowsType.TWO_PANE_OLD_WINDOWS,
            HeatingSourceType.COAL_MODERN,
            HeatingSourceType.BOILER_GAS_MODERN,
            HeatingSourceType.BOILER_GAS_MODERN,
            HeatingSourceType.BOILER_GAS_MODERN,
            SolarCollectorData.createSolarCollectorData(SolarCollectorType.NONE,0),
            WarmWaterDistribution.NOT_ISOLATED_PIPES,
            WarmWaterStorage.HEAT_NODE_WITHOUT_STORAGE,
            0.35,
            0.4,
            0.5,
            AirTightness.LOOSE,
            1.0,
            Number.NaN,
            false,
            false
    );

    private static const _normWT2014:HouseStandardTypeModel = new HouseStandardTypeModel(
            InsulationMaterialType.STANDARD,
            InsulationMaterialType.STANDARD,
            InsulationMaterialType.STANDARD,
            VentilationMethod.NATURAL_REGULATED,
            FoundationsType.TRADITIONAL_INSULATED,
            ThermalBridgesType.AVG,
            DoorType.STANDARD,
            WindowsType.TWO_PANE_NEW_WINDOWS,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            SolarCollectorData.createSolarCollectorData(SolarCollectorType.NONE,0),
            WarmWaterDistribution.WELL_ISOLATED_PIPES,
            WarmWaterStorage.HEAT_NODE_WITHOUT_STORAGE,
            0.15,
            0.2,
            0.2,
            AirTightness.TIGHT_NO_RECUP,
            1.0,
            Number.NaN,
            false,
            false
    );

    private static const _energySaving:HouseStandardTypeModel = new HouseStandardTypeModel(
            InsulationMaterialType.GOOD,
            InsulationMaterialType.GOOD,
            InsulationMaterialType.GOOD,
            VentilationMethod.MECHANICAL_75_PER_CENT,
            FoundationsType.TRADITIONAL_INSULATED,
            ThermalBridgesType.AVG,
            DoorType.ENERGY_SAVING,
            WindowsType.THREE_PANE_WINDOWS,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            SolarCollectorData.createSolarCollectorData(SolarCollectorType.NONE,0),
            WarmWaterDistribution.WELL_ISOLATED_PIPES,
            WarmWaterStorage.HEAT_NODE_WITHOUT_STORAGE,
            0.11,
            0.13,
            0.13,
            AirTightness.TIGHT_RECUP,
            1.0,
            Number.NaN,
            false,
            false
    );

    private static const _passive:HouseStandardTypeModel = new HouseStandardTypeModel(
            InsulationMaterialType.VERY_GOOD,
            InsulationMaterialType.VERY_GOOD,
            InsulationMaterialType.VERY_GOOD,
            VentilationMethod.MECHANICAL_85_PER_CENT,
            FoundationsType.SLAB,
            ThermalBridgesType.MIN,
            DoorType.SUPER_ENERGY_SAVING,
            WindowsType.THREE_PANE_SPECIAL_WINDOWS,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            HeatingSourceType.BOILER_GAS_CONDENSING,
            SolarCollectorData.createSolarCollectorData(SolarCollectorType.NONE,0),
            WarmWaterDistribution.WELL_ISOLATED_PIPES,
            WarmWaterStorage.HEAT_NODE_WITHOUT_STORAGE,
            0.09,
            0.09,
            0.08,
            AirTightness.STANDARD_PASSIVE,
            1.5,
            1.0,
            false,
            false
    );

    private static const _addStandard:HouseStandardTypeModel = new HouseStandardTypeModel(
            InsulationMaterialType.VERY_GOOD,
            InsulationMaterialType.VERY_GOOD,
            InsulationMaterialType.VERY_GOOD,
            VentilationMethod.MECHANICAL_85_PER_CENT,
            FoundationsType.SLAB,
            ThermalBridgesType.MIN,
            DoorType.SUPER_ENERGY_SAVING,
            WindowsType.THREE_PANE_SPECIAL_WINDOWS,
            HeatingSourceType.HEAT_PUMP,
            HeatingSourceType.HEAT_PUMP,
            HeatingSourceType.HEAT_PUMP,
            HeatingSourceType.HEAT_PUMP,
            SolarCollectorData.createSolarCollectorDataWithCount(SolarCollectorType.VACUUM,4.0),
            WarmWaterDistribution.WELL_ISOLATED_PIPES,
            WarmWaterStorage.MODERN_STORAGE,
            0.09,
            0.09,
            0.08,
            AirTightness.STANDARD_PASSIVE,
            1.5,
            1.0,
            true,
            true
    );

    private static var standardToModelMap:Dictionary = new Dictionary();
    {
        standardToModelMap[HouseStandardType.OLD_NON_INSULATED] = _oldNonInsulated;
        standardToModelMap[HouseStandardType.OLD_INSULATED] = _oldInsulated;
        standardToModelMap[HouseStandardType.NEW_NORM_WT_2014] = _normWT2014;
        standardToModelMap[HouseStandardType.ENERGY_SAVING_NF40] = _energySaving;
        standardToModelMap[HouseStandardType.PASSIVE_NF15] = _passive;
        standardToModelMap[HouseStandardType.ADD] = _addStandard;
    }

    public static function getHouseStandardTypeModelForStandardType(standardType:HouseStandardType):HouseStandardTypeModel {
        return standardToModelMap[standardType];
    }

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


    public function HouseStandardModelContainer() {
    }
}
}
