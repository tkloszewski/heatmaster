/**
 * Created by Dom on 2016-06-14.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;

import pl.znr.heatmaster.config.dictionary.DictionaryConfigAware;

public class DictionaryConfigAwareContainer {

    private static var listeners:ArrayCollection = new ArrayCollection();

    public function DictionaryConfigAwareContainer() {
    }

    public static function addListener(listener:DictionaryConfigAware):void{
            listeners.addItem(listener);
    }

    public static function dictionaryConfigInitialized(config:DictionaryConfig){
        for(var i:int = 0; i< listeners.length; i++){
            var dictionaryAware:DictionaryConfigAware = listeners.getItemAt(i) as DictionaryConfigAware;
            dictionaryAware.dictionaryInitialized(config);
        }
    }
}
}
