/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.WarmWaterConsumptionConfig;

import pl.znr.heatmaster.constants.combo.WarmWaterConsumption;

public class WarmWaterConsumptionConfigReader extends AbstractDictionaryReader{

    public function WarmWaterConsumptionConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        var waterConsumptionItems:ArrayCollection = readWarmWaterConsumptionConfiguration(dictionaryXML.warm_water_consumption_configuration);
        var warmWaterConsumptionConfiguration:WarmWaterConsumptionConfig = new WarmWaterConsumptionConfig(waterConsumptionItems);

        dictionaryConfig.waterConsumptionConfiguration = warmWaterConsumptionConfiguration;
        return dictionaryConfig;
    }

    private function readWarmWaterConsumptionConfiguration(consumptionItemsXML:XMLList):ArrayCollection {
        var warmWaterConsumptionItems:ArrayCollection = new ArrayCollection();
        for each (var warmWaterConsumptionXML:XML in consumptionItemsXML.warm_water_consumption) {
            warmWaterConsumptionItems.addItem(readWarmWaterConsumptionItem(warmWaterConsumptionXML));
        }
        return warmWaterConsumptionItems;
    }

    private function readWarmWaterConsumptionItem(consumptionItemXML:XML):WarmWaterConsumption {
        var id:String = consumptionItemXML.attribute("id");
        var intensity:Number = Number(consumptionItemXML.attribute("intensity"));

        var warmWaterConsumption:WarmWaterConsumption = new WarmWaterConsumption(id,intensity);
        fillBaseProperties(consumptionItemXML,warmWaterConsumption);

        return warmWaterConsumption;
    }
}
}