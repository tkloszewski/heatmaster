/**
 * Created by Dom on 2016-07-28.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import flash.utils.Dictionary;

import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.constants.combo.BaseComboObject;
import pl.znr.heatmaster.locale.LangHelper;

public class AbstractDictionaryReader implements DictionaryReader{

    protected var resourceManager:IResourceManager;

    public function AbstractDictionaryReader(resourceManager:IResourceManager) {
        this.resourceManager = resourceManager;
    }

    public function readXMLConfig(dictionaryConfig:DictionaryConfig, dictionaryXML:XML):DictionaryConfig {
        throw new Error();
    }

    protected function fillBaseProperties(dictionaryTypeXML:XML, baseComboObject:BaseComboObject):BaseComboObject {
        baseComboObject.id = dictionaryTypeXML.attribute("id");
        if(dictionaryTypeXML.attribute("label_key") != null){
            baseComboObject.labelKey = dictionaryTypeXML.attribute("label_key");
            baseComboObject.name = resourceManager.getString('hm',baseComboObject.labelKey);
        }
        else if(dictionaryTypeXML.attribute("en_name") != null && dictionaryTypeXML.attribute("pl_name") != null){
            baseComboObject.enName = dictionaryTypeXML.attribute("en_name");
            baseComboObject.plName = dictionaryTypeXML.attribute("pl_name");
            baseComboObject.name = LangHelper.isEnglishLang(resourceManager.localeChain[0]) ?
                    dictionaryTypeXML.attribute("en_name") : dictionaryTypeXML.attribute("pl_name")
        }
        return baseComboObject;
    }

    protected function readNumber(xml:XML,attrName:String):Number {
        var attrValue:String = xml.attribute(attrName);
        return attrValue != null && attrValue != "" ? Number(attrValue) : Number.NaN;
    }

    protected function readBoolean(xml:XML,attrName:String):Boolean {
        var attrValue:String = xml.attribute(attrName);
        return attrValue != null && attrValue == "true";
    }

    protected function toDictionary(dictionaryItems:ArrayCollection):Dictionary {
        var dictionary:Dictionary = new Dictionary();
        for(var i:int =0;i < dictionaryItems.length; i++){
            var dictionaryItem:BaseComboObject = dictionaryItems.getItemAt(i) as BaseComboObject;
            dictionary[dictionaryItem.id] = dictionaryItem;
        }
        return dictionary;
    }

    protected function getSelectedIndex(xmlItem:XMLList):int {
        return Number(xmlItem.attribute("selected_index"));
    }
}
}
