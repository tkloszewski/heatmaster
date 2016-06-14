/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.08.13
 * Time: 18:11
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import pl.znr.heatmaster.config.DictionaryConfig;
import pl.znr.heatmaster.config.DictionaryConfigAware;
import pl.znr.heatmaster.config.DictionaryConfigAwareContainer;

public class BaseComboObject implements DictionaryConfigAware{

    private var _id:String;

    public function BaseComboObject(id:String) {
        _id = id;
        DictionaryConfigAwareContainer.addListener(this);
    }

    public function dictionaryInitialized(config:DictionaryConfig):void {
    }

    public function getId():String {
        return _id;
    }
}
}
