/**
 * Created by Dom on 2016-07-28.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.ThermalBridgesTypeConfig;
import pl.znr.heatmaster.config.dictionary.model.ThermalBridgesType;

public class ThermalBridgesTypeConfigReader extends AbstractDictionaryReader{

    public function ThermalBridgesTypeConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        var thermalBridgesTypeConfig:ThermalBridgesTypeConfig = readThermalBridgesTypeConfig(dictionaryXML.thermal_bridges_types);
        dictionaryConfig.thermalBridgesTypeConfig = thermalBridgesTypeConfig;
        return dictionaryConfig;
    }

    private function readThermalBridgesTypeConfig(thermalBridgesTypesXML:XMLList):ThermalBridgesTypeConfig {
        var thermalBridgesTypeConfig:ThermalBridgesTypeConfig = new ThermalBridgesTypeConfig();
        thermalBridgesTypeConfig.selectedIndex = Number(thermalBridgesTypesXML.attribute("selected_index"));
        var thermalBridgesTypes:ArrayCollection = new ArrayCollection();
        for each (var thermalBridgesTypeXML:XML in thermalBridgesTypesXML.thermal_bridges_type) {
            thermalBridgesTypes.addItem(readThermalBridgesType(thermalBridgesTypeXML));
        }
        thermalBridgesTypeConfig.thermalBridgesTypes = thermalBridgesTypes;
        return thermalBridgesTypeConfig;
    }

    private function readThermalBridgesType(thermalBridgesTypeXML:XML):ThermalBridgesType {
        var max:Boolean = readBoolean(thermalBridgesTypeXML,"max");
        var thermalBridgesType:ThermalBridgesType = new ThermalBridgesType(thermalBridgesTypeXML.attribute("id"),Number(thermalBridgesTypeXML.attribute("u_value")),max);
        fillBaseProperties(thermalBridgesTypeXML,thermalBridgesType);
        return thermalBridgesType;
    }
}
}
