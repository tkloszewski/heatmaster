/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.WaterStorageDistributionConfig;
import pl.znr.heatmaster.config.dictionary.model.WarmWaterDistribution;
import pl.znr.heatmaster.config.dictionary.model.WarmWaterStorage;

public class WaterStorageDistributionConfigReader extends AbstractDictionaryReader{

    public function WaterStorageDistributionConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        var warmWaterDistributionTypes:ArrayCollection = readWaterDistributionTypes(dictionaryXML.warm_water_distribution_types);
        var warmWaterStorageTypes:ArrayCollection = readWaterStorageTypes(dictionaryXML.warm_water_storage_types);

        var waterStorageDistributionConfiguration:WaterStorageDistributionConfig = new WaterStorageDistributionConfig();
        waterStorageDistributionConfiguration.waterDistributionTypes = warmWaterDistributionTypes;
        waterStorageDistributionConfiguration.waterStorageTypes = warmWaterStorageTypes;
        waterStorageDistributionConfiguration.storageSelectedIndex = getSelectedIndex(dictionaryXML.warm_water_storage_types);
        waterStorageDistributionConfiguration.distributionSelectedIndex = getSelectedIndex(dictionaryXML.warm_water_distribution_types);


        dictionaryConfig.waterStorageDistributionConfiguration = waterStorageDistributionConfiguration;
        return dictionaryConfig;
    }

    private function readWaterDistributionTypes(waterDistributionTypesXML:XMLList):ArrayCollection {
        var waterDistributionTypes:ArrayCollection = new ArrayCollection();
        for each (var waterDistributionXML:XML in waterDistributionTypesXML.warm_water_distribution_type) {
            waterDistributionTypes.addItem(readWaterDistributionType(waterDistributionXML));
        }
        return waterDistributionTypes;
    }

    private function readWaterStorageTypes(waterStorageTypesXML:XMLList):ArrayCollection {
        var waterStorageTypes:ArrayCollection = new ArrayCollection();
        for each (var waterStorageXML:XML in waterStorageTypesXML.warm_water_storage_type) {
            waterStorageTypes.addItem(readWaterStorageType(waterStorageXML));
        }
        return waterStorageTypes;
    }

    private function readWaterDistributionType(waterDistributionXML:XML):WarmWaterDistribution {
        var id:String = waterDistributionXML.attribute("id");
        var efficiency:Number = Number(waterDistributionXML.attribute("efficiency"));

        var warmWaterDistribution:WarmWaterDistribution = new WarmWaterDistribution(id,efficiency);
        fillBaseProperties(waterDistributionXML,warmWaterDistribution);

        return warmWaterDistribution;
    }

    private function readWaterStorageType(waterStorageXML:XML):WarmWaterStorage {
        var id:String = waterStorageXML.attribute("id");
        var efficiency:Number = Number(waterStorageXML.attribute("efficiency"));

        var warmWaterStorage:WarmWaterStorage = new WarmWaterStorage(id,efficiency);
        fillBaseProperties(waterStorageXML,warmWaterStorage);

        return warmWaterStorage;
    }

}
}
