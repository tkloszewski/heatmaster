/**
 * Created by Dom on 2016-07-28.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.ThermalBridgesTypeConfig;
import pl.znr.heatmaster.constants.combo.ThermalBridgesType;

public class ThermalBridgesTypeConfigReader extends AbstractDictionaryReader{

    public function ThermalBridgesTypeConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        var thermalBridgesTypeConfig:ThermalBridgesTypeConfig = readThermalBridgesTypeConfig(dictionaryXML.door_types);
        dictionaryConfig.thermalBridgesTypeConfig = thermalBridgesTypeConfig;
        return dictionaryConfig;
    }

    private function readThermalBridgesTypeConfig(thermalBridgesTypesXML:XMLList):ThermalBridgesTypeConfig {
        var thermalBridgesTypeConfig:ThermalBridgesTypeConfig = new ThermalBridgesTypeConfig();
        thermalBridgesTypeConfig.selectedIndex = Number(thermalBridgesTypesXML.attribute("selected_index"));
        var thermalBridgesTypes:ArrayCollection = new ArrayCollection();
        for each (var thermalBridgesTypeXML:XML in thermalBridgesTypesXML.door_type) {
            thermalBridgesTypes.addItem(readThermalBridgesType(thermalBridgesTypeXML));
        }
        thermalBridgesTypeConfig.thermalBridgesTypes = thermalBridgesTypes;
        return thermalBridgesTypeConfig;
    }

    private function readThermalBridgesType(thermalBridgesTypeXML:XML):ThermalBridgesType {
        var doorType:ThermalBridgesType = new ThermalBridgesType(thermalBridgesTypeXML.attribute("id"),Number(thermalBridgesTypeXML.attribute("u_value")));
        fillBaseProperties(thermalBridgesTypeXML,doorType);
        return doorType;
    }
}
}
