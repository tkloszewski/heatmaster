/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.FoundationsTypeConfig;

import pl.znr.heatmaster.constants.combo.FoundationsType;

public class FoundationsTypeConfigReader extends AbstractDictionaryReader{

    public function FoundationsTypeConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        dictionaryConfig.foundationConfiguration = new FoundationsTypeConfig(readFoundationTypes(dictionaryXML.foundation_types));
        return dictionaryConfig;
    }

    private function readFoundationTypes(foundationItemsXML:XMLList):ArrayCollection {
        var foundationItems:ArrayCollection = new ArrayCollection();
        for each (var foundationItemXML:XML in foundationItemsXML.foundation_type) {
            foundationItems.addItem(readFoundationType(foundationItemXML));
        }
        return foundationItems;
    }

    private function readFoundationType(foundationTypeXML:XML):FoundationsType {
        var id:String = foundationTypeXML.attribute("id");
        var fType:int = Number(foundationTypeXML.attribute("type"));
        var uValue:Number = Number(foundationTypeXML.attribute("u_value"));

        var foundationsType:FoundationsType = new FoundationsType(id,fType,uValue);
        fillBaseProperties(foundationTypeXML,foundationsType);
        return foundationsType;
    }
}
}
