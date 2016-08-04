/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.TightnessConfig;

import pl.znr.heatmaster.config.dictionary.model.AirTightness;

public class TightnessConfigReader extends AbstractDictionaryReader{

    public function TightnessConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        var tightnessConfiguration:TightnessConfig = new TightnessConfig(readTightnessItems(dictionaryXML.tightness_configuration));
        tightnessConfiguration.selectedIndex = getSelectedIndex(dictionaryXML.tightness_configuration);
        dictionaryConfig.tightnessConfiguration = tightnessConfiguration;
        return dictionaryConfig;
    }

    private function readTightnessItems(tightnessItemsXML:XMLList):ArrayCollection {
        var tightnessItems:ArrayCollection = new ArrayCollection();
        for each (var tightnessItemXML:XML in tightnessItemsXML.tightness_item) {
            tightnessItems.addItem(readTightnessItem(tightnessItemXML));
        }
        return tightnessItems;
    }

    private function readTightnessItem(tightnessItemXML:XML):AirTightness {
        var id:String = tightnessItemXML.attribute("id");
        var value:Number = Number(tightnessItemXML.attribute("value"));

        var airTightness:AirTightness = new AirTightness(id,value);
        fillBaseProperties(tightnessItemXML,airTightness);
        return airTightness;
    }
}
}
