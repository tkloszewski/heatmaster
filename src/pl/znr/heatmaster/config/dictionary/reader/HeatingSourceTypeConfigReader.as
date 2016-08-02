/**
 * Created by Dom on 2016-07-29.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import flash.utils.Dictionary;

import mx.collections.ArrayCollection;

import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.HeatingSourceTypeConfig;
import pl.znr.heatmaster.constants.HeatingType;
import pl.znr.heatmaster.constants.NaturalUnit;
import pl.znr.heatmaster.constants.combo.HeatingSourceType;

public class HeatingSourceTypeConfigReader extends AbstractDictionaryReader{

    public function HeatingSourceTypeConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        var heatingSourceTypesMap:Dictionary = readHeatingSourceTypes(dictionaryXML.heating_source_types);
        var detachedHeatingSourceTypes:ArrayCollection = getReferencedHeatingSourceTypes(dictionaryXML.detached_heating_source_types,heatingSourceTypesMap);
        var multiFamilyHeatingSourceTypes:ArrayCollection = getReferencedHeatingSourceTypes(dictionaryXML.multi_family_heating_source_types,heatingSourceTypesMap);
        var warmWaterDetachedHeatingSourceTypes:ArrayCollection = getReferencedHeatingSourceTypes(dictionaryXML.warm_water_detached_heating_source_types,heatingSourceTypesMap);
        var warmWaterMultiFamilyHeatingSourceTypes:ArrayCollection = getReferencedHeatingSourceTypes(dictionaryXML.warm_water_multi_family_heating_source_types,heatingSourceTypesMap);

        var heatingSourceTypeConfiguration:HeatingSourceTypeConfig = new HeatingSourceTypeConfig();
        heatingSourceTypeConfiguration.heatingSourceTypes = heatingSourceTypesMap;
        heatingSourceTypeConfiguration.detachedHeatingSourceTypes = detachedHeatingSourceTypes;
        heatingSourceTypeConfiguration.multiFamilyHeatingSourceTypes = multiFamilyHeatingSourceTypes;
        heatingSourceTypeConfiguration.warmWaterDetachedHeatingSourceTypes = warmWaterDetachedHeatingSourceTypes;
        heatingSourceTypeConfiguration.warmWaterMultiFamilyHeatingSourceTypes = warmWaterMultiFamilyHeatingSourceTypes;

        heatingSourceTypeConfiguration.detachedHeatingSelectedIndex = getSelectedIndex(dictionaryXML.detached_heating_source_types);
        heatingSourceTypeConfiguration.warmWaterDetachedSelectedIndex = getSelectedIndex(dictionaryXML.warm_water_detached_heating_source_types);
        heatingSourceTypeConfiguration.multiFamilySelectedIndex = getSelectedIndex(dictionaryXML.multi_family_heating_source_types);
        heatingSourceTypeConfiguration.warmWaterMultiFamilySelectedIndex = getSelectedIndex(dictionaryXML.warm_water_multi_family_heating_source_types);


        dictionaryConfig.heatingSourceTypeConfiguration = heatingSourceTypeConfiguration;

        return dictionaryConfig;
    }

    private function getReferencedHeatingSourceTypes(referringHeatingSourceTypesXML:XMLList,heatingSourceTypesMap:Dictionary):ArrayCollection{
        var result:ArrayCollection = new ArrayCollection();
        for each (var referringXML:XML in referringHeatingSourceTypesXML.heating_source_type) {
            var heatingSourceTypeRefId:String = referringXML.attribute("ref");
            var heatingSourceType:HeatingSourceType = heatingSourceTypesMap[heatingSourceTypeRefId];
            if(heatingSourceType != null){
               result.addItem(heatingSourceType);
            }
        }
        return result;
    }

    private function readHeatingSourceTypes(heatingSourceTypesXML:XMLList):Dictionary {
        var heatingSourceTypesMap:Dictionary = new Dictionary();
        for each (var heatingSourceTypeXML:XML in heatingSourceTypesXML.heating_source_type) {
            var heatingSourceType:HeatingSourceType = readHeatingSourceType(heatingSourceTypeXML);
            heatingSourceTypesMap[heatingSourceType.id] = heatingSourceType;
        }
        return heatingSourceTypesMap;
    }

    private function getSelectedIndex(xmlItem:XMLList):int {
        return Number(xmlItem.attribute("selected_index"));
    }

    private function readHeatingSourceType(heatingSourceTypeXML:XML):HeatingSourceType {
        var id:String = heatingSourceTypeXML.attribute("id");
        var naturalUnit:NaturalUnit = NaturalUnit.getNaturalUnitByCode(heatingSourceTypeXML.attribute("natural_unit"));
        var naturalUnitPrice:Number = Number(heatingSourceTypeXML.attribute("natural_unit_price"));
        var calorificValue:Number = Number(heatingSourceTypeXML.attribute("calorific_value"));
        var efficiency:Number = Number(heatingSourceTypeXML.attribute("efficiency"));
        var emissionPerKwh:Number = Number(heatingSourceTypeXML.attribute("emission_per_kwh"));
        var finalToPrimaryCoefficient:Number = Number(heatingSourceTypeXML.attribute("final_to_primary_coefficient"));
        var showNaturalUnit:Boolean = heatingSourceTypeXML.attribute("show_natural_unit") == "true";
        var calorificValueEditable:Boolean = heatingSourceTypeXML.attribute("calorific_value_editable") == "true";

        var heatingSourceType:HeatingSourceType = new HeatingSourceType(id,naturalUnit,naturalUnitPrice,calorificValue,efficiency,emissionPerKwh,
                finalToPrimaryCoefficient,showNaturalUnit,calorificValueEditable);
        fillBaseProperties(heatingSourceTypeXML,heatingSourceType);

        var heatingType:HeatingType = HeatingType.of(heatingSourceTypeXML.attribute("type"));
        heatingSourceType.heatingType = heatingType;

        return heatingSourceType
    }


}
}
