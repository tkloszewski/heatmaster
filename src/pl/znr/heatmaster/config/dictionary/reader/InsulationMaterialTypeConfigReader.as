/**
 * Created by Dom on 2016-07-28.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.InsulationMaterialTypeConfig;
import pl.znr.heatmaster.config.dictionary.model.InsulationMaterialType;

public class InsulationMaterialTypeConfigReader extends AbstractDictionaryReader{

    public function InsulationMaterialTypeConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        dictionaryConfig.insulationMaterialTypeConfig = readInsulationMaterialTypeConfig(dictionaryXML.insulation_material_types);
        return dictionaryConfig;
    }

    private function readInsulationMaterialTypeConfig(insulationMaterialXML:XMLList):InsulationMaterialTypeConfig {
        var insulationMaterialTypeConfig:InsulationMaterialTypeConfig = new InsulationMaterialTypeConfig();
        insulationMaterialTypeConfig.selectedIndex =  Number(insulationMaterialXML.attribute("selected_index"));

        var insulationMaterialTypes:ArrayCollection = new ArrayCollection();
        for each (var insulationMaterialTypeXML:XML in insulationMaterialXML.insulation_material_type) {
            var insulationMaterialType:InsulationMaterialType = readInsulationMaterialType(insulationMaterialTypeXML);
            insulationMaterialTypes.addItem(insulationMaterialType);
        }
        insulationMaterialTypeConfig.insulationMaterialTypes = insulationMaterialTypes;
        return insulationMaterialTypeConfig;
    }

    private function readInsulationMaterialType(insulationMaterialTypeXML:XML):InsulationMaterialType {
        var labelCode:String = insulationMaterialTypeXML.attribute("label_code");
        var id:String = insulationMaterialTypeXML.attribute("id");
        var heatTransfer:Number = Number(insulationMaterialTypeXML.attribute("heat_transfer"));

        var insulationMaterialType:InsulationMaterialType = new InsulationMaterialType(id,heatTransfer,labelCode);
        fillBaseProperties(insulationMaterialTypeXML,insulationMaterialType);

        return insulationMaterialType;
    }
}
}
