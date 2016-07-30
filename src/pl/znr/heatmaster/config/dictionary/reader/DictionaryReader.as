/**
 * Created by Dom on 2016-07-28.
 */
package pl.znr.heatmaster.config.dictionary.reader {
import pl.znr.heatmaster.config.dictionary.DictionaryConfig;

public interface DictionaryReader {

   function readXMLConfig(dictionaryConfig:DictionaryConfig,dictionaryXML:XML):DictionaryConfig;
}
}
