/**
 * Created by Dom on 2016-07-28.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.SolarCollectorTypeConfig;
import pl.znr.heatmaster.constants.combo.InsulationMaterialType;
import pl.znr.heatmaster.constants.combo.SolarCollectorType;

public class SolarCollectorTypeConfigReader extends AbstractDictionaryReader{

    public function SolarCollectorTypeConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        dictionaryConfig.solarCollectorsTypeConfig = readSolarCollectorTypeConfig(dictionaryXML.solar_collector_types);
        return dictionaryConfig;
    }

    private function readSolarCollectorTypeConfig(solarCollectorsXML:XMLList):SolarCollectorTypeConfig {
        var solarCollectorsTypeConfig:SolarCollectorTypeConfig = new SolarCollectorTypeConfig();
        solarCollectorsTypeConfig.selectedIndex =  getSelectedIndex(solarCollectorsXML);

        var solarCollectorTypes:ArrayCollection = new ArrayCollection();
        for each (var solarCollectorTypeXML:XML in solarCollectorsXML.solar_collector_type) {
            var solarCollectorType:SolarCollectorType = readSolarCollectorType(solarCollectorTypeXML);
            solarCollectorTypes.addItem(solarCollectorType);
        }
        solarCollectorsTypeConfig.solarCollectorTypes = solarCollectorTypes;
        return solarCollectorsTypeConfig;
    }

    private function readSolarCollectorType(solarCollectorTypeXML:XML):SolarCollectorType {
        var id:String = solarCollectorTypeXML.attribute("id");
        var numericType:Number = Number(solarCollectorTypeXML.attribute("type"));
        var efficiency:Number = Number(solarCollectorTypeXML.attribute("efficiency"));
        var unitSurface:Number = Number(solarCollectorTypeXML.attribute("unit_surface"));
        var persons:Number = Number(solarCollectorTypeXML.attribute("persons"));

        var solarCollectorType:SolarCollectorType = new SolarCollectorType(id,numericType,efficiency,unitSurface,persons);
        fillBaseProperties(solarCollectorTypeXML,solarCollectorType);

        return solarCollectorType;
    }
}
}
