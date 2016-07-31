/**
 * Created by Dom on 2016-07-31.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.HouseStandardTypeConfig;
import pl.znr.heatmaster.config.dictionary.model.HouseStandardTypeItem;
import pl.znr.heatmaster.constants.combo.AirTightness;
import pl.znr.heatmaster.constants.combo.DoorType;
import pl.znr.heatmaster.constants.combo.FoundationsType;
import pl.znr.heatmaster.constants.combo.HeatingSourceType;
import pl.znr.heatmaster.constants.combo.InsulationMaterialType;
import pl.znr.heatmaster.constants.combo.SolarCollectorType;
import pl.znr.heatmaster.constants.combo.ThermalBridgesType;
import pl.znr.heatmaster.constants.combo.VentilationMethod;
import pl.znr.heatmaster.constants.combo.WarmWaterDistribution;
import pl.znr.heatmaster.constants.combo.WarmWaterStorage;
import pl.znr.heatmaster.constants.combo.WindowsType;
import pl.znr.heatmaster.core.model.HouseStandardTypeModel;
import pl.znr.heatmaster.core.model.SolarCollectorData;

public class HouseStandardTypeConfigReader extends AbstractDictionaryReader{

    public function HouseStandardTypeConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        dictionaryConfig.houseStandardTypeConfiguration = new HouseStandardTypeConfig(readHouseStandardTypes(dictionaryXML.standard_type_configuration));
        return dictionaryConfig;
    }

    private function readHouseStandardTypes(houseStandardTypesXML:XMLList):ArrayCollection {
        var standardTypeItems:ArrayCollection = new ArrayCollection();
        for each (var houseStandardTypeXML:XML in houseStandardTypesXML.standard_type) {
            standardTypeItems.addItem(readHouseStandardType(houseStandardTypeXML));
        }
        return standardTypeItems;
    }

    private function readHouseStandardType(houseStandardTypeXML:XML):HouseStandardTypeItem {
        var id:String = houseStandardTypeXML.attribute("id");
        var roofInsulationMaterialTypeId:String = houseStandardTypeXML.attribute("roof_insulation_material_type");
        var wallInsulationMaterialTypeId:String = houseStandardTypeXML.attribute("wall_insulation_material_type");
        var floorInsulationMaterialTypeId:String = houseStandardTypeXML.attribute("floor_insulation_material_type");
        var ventilationTypeId:String = houseStandardTypeXML.attribute("ventilation_type");
        var foundationTypeId:String = houseStandardTypeXML.attribute("foundation_type");
        var thermalBridgesTypeId:String = houseStandardTypeXML.attribute("thermal_bridges_type");
        var doorTypeId:String = houseStandardTypeXML.attribute("door_type");
        var windowTypeId:String = houseStandardTypeXML.attribute("window_type");
        var tightnessTypeId:String = houseStandardTypeXML.attribute("tightness_item");
        var detachedHeatingSourceTypeId:String = houseStandardTypeXML.attribute("detached_heating_source_type");
        var multiFamilyHeatingSourceTypeId:String = houseStandardTypeXML.attribute("multi_family_heating_source_type");
        var waterDetachedHeatingSourceTypeId:String = houseStandardTypeXML.attribute("water_detached_heating_source_type");
        var waterMultiFamilyHeatingSourceTypeId:String = houseStandardTypeXML.attribute("water_multi_family_heating_source_type");
        var waterStorageId:String = houseStandardTypeXML.attribute("water_storage");
        var waterDistributionId:String = houseStandardTypeXML.attribute("water_distribution");


        var roofInsulationMaterialType:InsulationMaterialType = InsulationMaterialType.getMaterialInsulationTypeById(roofInsulationMaterialTypeId);
        if(roofInsulationMaterialType == null){
           throw new Error("Unrecognized roof insulation material type id: " + roofInsulationMaterialTypeId);
        }

        var wallInsulationMaterialType:InsulationMaterialType = InsulationMaterialType.getMaterialInsulationTypeById(wallInsulationMaterialTypeId);
        if(wallInsulationMaterialType == null){
            throw new Error("Unrecognized wall insulation material type id: " + wallInsulationMaterialTypeId);
        }

        var floorInsulationMaterialType:InsulationMaterialType = InsulationMaterialType.getMaterialInsulationTypeById(floorInsulationMaterialTypeId);
        if(floorInsulationMaterialType == null){
            throw new Error("Unrecognized floor insulation material type id: " + floorInsulationMaterialTypeId);
        }

        var ventilationMethod:VentilationMethod = VentilationMethod.getVentilationMethodById(ventilationTypeId);
        if(ventilationMethod == null){
           throw new Error("Unrecognized ventilation type id: " + ventilationTypeId);
        }

        var foundationsType:FoundationsType = FoundationsType.getFoundationById(foundationTypeId);
        if(foundationsType == null){
           throw new Error("Unrecognized foundations type id: " + foundationTypeId);
        }

        var thermalBridgesType:ThermalBridgesType = ThermalBridgesType.getThermalBridgesTypeById(thermalBridgesTypeId);
        if(thermalBridgesType == null){
           throw new Error("Unrecognized thermal bridges type id: " + thermalBridgesTypeId);
        }

        var doorType:DoorType = DoorType.getDoorTypeById(doorTypeId);
        if(doorType == null){
           throw new Error("Unrecognized door type id: " + doorTypeId);
        }

        var windowType:WindowsType = WindowsType.getWindowsTypeById(windowTypeId);
        if(windowType == null){
           throw new Error("Unrecognized window type id: " + windowTypeId);
        }

        var tightnessType:AirTightness = AirTightness.getAirTightnessById(tightnessTypeId);
        if(tightnessType == null){
           throw new Error("Unrecognized tightness type id: " + tightnessTypeId);
        }

        var detachedHeatingSourceType:HeatingSourceType = HeatingSourceType.getHeatingSourceTypeById(detachedHeatingSourceTypeId);
        if(detachedHeatingSourceType == null){
           throw new Error("Unrecognized detached heating source type id: " + detachedHeatingSourceTypeId);
        }

        var multiFamilyHeatingSourceType:HeatingSourceType = HeatingSourceType.getHeatingSourceTypeById(multiFamilyHeatingSourceTypeId);
        if(multiFamilyHeatingSourceType == null){
            throw new Error("Unrecognized non-detached heating source type id: " + multiFamilyHeatingSourceTypeId);
        }

        var waterDetachedHeatingSourceType:HeatingSourceType = HeatingSourceType.getHeatingSourceTypeById(waterDetachedHeatingSourceTypeId);
        if(waterDetachedHeatingSourceType == null){
            throw new Error("Unrecognized water detached heating source type id: " + waterDetachedHeatingSourceTypeId);
        }

        var waterMultiFamilyHeatingSourceType:HeatingSourceType = HeatingSourceType.getHeatingSourceTypeById(waterMultiFamilyHeatingSourceTypeId);
        if(waterMultiFamilyHeatingSourceType == null){
            throw new Error("Unrecognized water non-detached heating source type id: " + waterMultiFamilyHeatingSourceTypeId);
        }

        var waterStorage:WarmWaterStorage = WarmWaterStorage.getWarmWaterStorageById(waterStorageId);
        if(waterStorage == null){
           throw new Error("Unrecognized water storage type id: " + waterStorageId);
        }

        var waterDistribution:WarmWaterDistribution = WarmWaterDistribution.getWarmWaterDistributionById(waterDistributionId);
        if(waterDistribution ==null){
           throw new Error("Unrecognized water distribution id: " + waterDistributionId);
        }

        var solarCollectorsData:SolarCollectorData = readSolarCollectorsData(houseStandardTypeXML.solar_collector_data);

        var roofUValue:Number = Number(houseStandardTypeXML.attribute("roof_u_value"));
        var wallUValue:Number = Number(houseStandardTypeXML.attribute("wall_u_value"));
        var floorUValue:Number = Number(houseStandardTypeXML.attribute("floor_u_value"));

        var southWindowSurfaceFactor:Number = readNumber(houseStandardTypeXML,"south_windows_surface_factor");
        var northWindowsSurfaceFactor:Number = readNumber(houseStandardTypeXML,"north_windows_surface_factor");

        var shuttersEnabled:Boolean = readBoolean(houseStandardTypeXML,"shutters_enabled");
        var co2SensorEnabled:Boolean = readBoolean(houseStandardTypeXML,"carbon_dioxide_sensor");


        var houseStandardTypeModel:HouseStandardTypeModel = new HouseStandardTypeModel(
             roofInsulationMaterialType,
             wallInsulationMaterialType,
             floorInsulationMaterialType,
             ventilationMethod,
             foundationsType,
             thermalBridgesType,
             doorType,
             windowType,
             detachedHeatingSourceType,
             multiFamilyHeatingSourceType,
             waterDetachedHeatingSourceType,
             waterMultiFamilyHeatingSourceType,
             solarCollectorsData,
             waterDistribution,
             waterStorage,
             roofUValue,
             wallUValue,
             floorUValue,
             tightnessType,
             southWindowSurfaceFactor,
             northWindowsSurfaceFactor,
             shuttersEnabled,
             co2SensorEnabled
        );

        var houseStandardTypeItem:HouseStandardTypeItem = new HouseStandardTypeItem(id,houseStandardTypeModel);
        fillBaseProperties(houseStandardTypeXML,houseStandardTypeItem);

        return houseStandardTypeItem;
    }

    private function readSolarCollectorsData(collectorsDataXML:XMLList):SolarCollectorData {
        var collectorsTypeId:String = collectorsDataXML.attribute("solar_collector_type");
        var solarCollectorType:SolarCollectorType = SolarCollectorType.getSolarCollectorTypeById(collectorsTypeId);
        if(solarCollectorType == null){
           throw new Error("Unrecognized solar collector type id: " + collectorsTypeId);
        }
        if(solarCollectorType.type == SolarCollectorType.NONE_TYPE){
           return SolarCollectorData.createSolarCollectorData(solarCollectorType,0);
        }

        var surface:Number = Number(collectorsDataXML.attribute("surface"));
        return SolarCollectorData.createSolarCollectorDataWithCountCalculated(solarCollectorType,surface);


    }


}
}
