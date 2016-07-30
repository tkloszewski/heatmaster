/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.WindowTypeConfig;

import pl.znr.heatmaster.constants.combo.WindowsType;

public class WindowTypeConfigReader extends AbstractDictionaryReader{

    public function WindowTypeConfigReader(resourceManager:IResourceManager) {
        super(resourceManager);
    }

    override public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        dictionaryConfig.windowTypeConfiguration = new WindowTypeConfig(readWindowTypes(dictionaryXML.window_types));
        return dictionaryConfig;
    }

    private function readWindowTypes(windowTypesXML:XMLList):ArrayCollection {
        var windowTypes:ArrayCollection = new ArrayCollection();
        for each (var windowTypeXML:XML in windowTypesXML.window_type) {
            windowTypes.addItem(readWindowType(windowTypeXML));
        }
        return windowTypes;
    }

    private function readWindowType(windowTypeXML:XML):WindowsType {
        var id:String = windowTypeXML.attribute("id");
        var uValue:Number = Number(windowTypeXML.attribute("u_value"));
        var winGain:Number = Number(windowTypeXML.attribute("win_gain"));

        var windowType:WindowsType = new WindowsType(id,uValue,winGain);
        fillBaseProperties(windowTypeXML,windowType);

        return windowType;
    }
}
}
