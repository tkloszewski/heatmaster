/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.VentilationTypeConfig;

import pl.znr.heatmaster.constants.combo.VentilationMethod;

public class VentilationTypeConfigReader extends AbstractDictionaryReader{

    public function VentilationTypeConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }


    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        var ventilationTypes:ArrayCollection = readVentilationTypes(dictionaryXML.ventilation_types);
        var ventilationTypeConfig:VentilationTypeConfig = new VentilationTypeConfig(ventilationTypes);

        dictionaryConfig.ventilationTypeConfiguration = ventilationTypeConfig;
        return dictionaryConfig;
    }

    private function readVentilationTypes(ventilationTypesXML:XMLList):ArrayCollection {
        var ventilationTypes:ArrayCollection = new ArrayCollection();
        for each (var ventilationTypeXML:XML in ventilationTypesXML.ventilation_type) {
            ventilationTypes.addItem(readVentilationType(ventilationTypeXML));
        }
        return ventilationTypes;
    }

    private function readVentilationType(ventilationTypeXML:XML):VentilationMethod {
        var id:String = ventilationTypeXML.attribute("id");
        var ventType:int = ventilationTypeXML.attribute("type") == "1" ? VentilationMethod.GRAVITATIONAL : VentilationMethod.MECHANICAL;
        var efficiency:Number = Number(ventilationTypeXML.attribute("efficiency"));

        var ventilationMethod:VentilationMethod = new VentilationMethod(id,ventType,efficiency);
        fillBaseProperties(ventilationTypeXML,ventilationMethod);

        return ventilationMethod;
    }
}
}
