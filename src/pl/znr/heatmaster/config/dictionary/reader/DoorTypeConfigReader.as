/**
 * Created by Dom on 2016-07-28.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.DoorTypeConfig;
import pl.znr.heatmaster.constants.combo.DoorType;

public class DoorTypeConfigReader extends AbstractDictionaryReader{

    public function DoorTypeConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        var doorTypeConfig:DoorTypeConfig = readDoorTypeConfig(dictionaryXML.door_types);
        dictionaryConfig.doorTypeConfig = doorTypeConfig;
        return dictionaryConfig;
    }

    private function readDoorTypeConfig(doorTypesConfigXML:XMLList):DoorTypeConfig {
        var doorTypeConfig:DoorTypeConfig = new DoorTypeConfig();
        doorTypeConfig.selectedIndex = Number(doorTypesConfigXML.attribute("selected_index"));

        var doorTypes:ArrayCollection = new ArrayCollection();
        for each (var doorTypeXML:XML in doorTypesConfigXML.door_type) {
            var doorType:DoorType = readDoorType(doorTypeXML);
            doorTypes.addItem(doorType);
        }
        doorTypeConfig.doorTypes = doorTypes;
        return doorTypeConfig;
    }

    private function readDoorType(doorTypeXML:XML):DoorType {
        var doorType:DoorType = new DoorType(doorTypeXML.attribute("id"),Number(doorTypeXML.attribute("u_value")));
        fillBaseProperties(doorTypeXML,doorType);
        return doorType;
    }
}
}
