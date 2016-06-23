/**
 * Created by Dom on 2016-06-14.
 */
package pl.znr.heatmaster.config.dictionary {
import pl.znr.heatmaster.config.dictionary.DictionaryConfig;

public interface DictionaryConfigAware {

    function dictionaryInitialized(config:DictionaryConfig):void;

}
}
