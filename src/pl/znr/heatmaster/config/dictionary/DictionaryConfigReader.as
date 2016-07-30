/**
 * Created by Dom on 2016-07-27.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.reader.DictionaryReader;
import pl.znr.heatmaster.config.dictionary.reader.DoorTypeConfigReader;
import pl.znr.heatmaster.config.dictionary.reader.FoundationsTypeConfigReader;
import pl.znr.heatmaster.config.dictionary.reader.HeatingSourceTypeConfigReader;
import pl.znr.heatmaster.config.dictionary.reader.InsulationMaterialTypeConfigReader;
import pl.znr.heatmaster.config.dictionary.reader.SolarCollectorTypeConfigReader;
import pl.znr.heatmaster.config.dictionary.reader.ThermalBridgesTypeConfigReader;
import pl.znr.heatmaster.config.dictionary.reader.TightnessConfigReader;
import pl.znr.heatmaster.config.dictionary.reader.VentilationTypeConfigReader;
import pl.znr.heatmaster.config.dictionary.reader.WarmWaterConsumptionConfigReader;
import pl.znr.heatmaster.config.dictionary.reader.WaterStorageDistributionConfigReader;
import pl.znr.heatmaster.config.dictionary.reader.WindowTypeConfigReader;

public class DictionaryConfigReader {

    private var dictionaryXML:XML;
    private var resourceManager:IResourceManager;
    private var dictionaryConfigurationReaders:ArrayCollection = new ArrayCollection();

    public function DictionaryConfigReader(dictionaryXML:XML, resourceManager:IResourceManager) {
        this.dictionaryXML = dictionaryXML;
        this.resourceManager = resourceManager;

        dictionaryConfigurationReaders.addItem(new DoorTypeConfigReader(resourceManager));
        dictionaryConfigurationReaders.addItem(new InsulationMaterialTypeConfigReader(resourceManager));
        dictionaryConfigurationReaders.addItem(new SolarCollectorTypeConfigReader(resourceManager));
        dictionaryConfigurationReaders.addItem(new ThermalBridgesTypeConfigReader(resourceManager));
        dictionaryConfigurationReaders.addItem(new VentilationTypeConfigReader(resourceManager));
        dictionaryConfigurationReaders.addItem(new WindowTypeConfigReader(resourceManager));
        dictionaryConfigurationReaders.addItem(new TightnessConfigReader(resourceManager));
        dictionaryConfigurationReaders.addItem(new FoundationsTypeConfigReader(resourceManager));

        dictionaryConfigurationReaders.addItem(new HeatingSourceTypeConfigReader(resourceManager));
        dictionaryConfigurationReaders.addItem(new WaterStorageDistributionConfigReader(resourceManager));
        dictionaryConfigurationReaders.addItem(new WarmWaterConsumptionConfigReader(resourceManager));
    }

    public function readConfig():DictionaryConfig {
        var dictionaryConfig:DictionaryConfig = new DictionaryConfig();

        for(var i:int = 0;i < dictionaryConfigurationReaders.length;i++){
            var dictionaryReader:DictionaryReader = dictionaryConfigurationReaders.getItemAt(i) as DictionaryReader;
            dictionaryConfig = dictionaryReader.readXMLConfig(dictionaryConfig,dictionaryXML);
        }

        return dictionaryConfig;
    }
}
}
