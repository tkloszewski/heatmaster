/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 07.05.14
 * Time: 20:12
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.locale {
import flash.system.Capabilities;

import mx.resources.IResourceManager;
import mx.utils.StringUtil;

public class HeatMasterLocaleManager {

    private var resourceManager:IResourceManager;

    private var lang:String;

    public function HeatMasterLocaleManager(resourceManager:IResourceManager) {
        this.resourceManager = resourceManager;
        var localLang:String = Capabilities.language;
        trace("localLang: " + localLang);
        var l:String;
        for each(l in resourceManager.getPreferredLocaleChain()){
            if(l == localLang){
                lang = l;
                break;
            }
        }
        if(lang == null){
            for each(l in resourceManager.getPreferredLocaleChain()){
                if(l.substring(0,2) == localLang){
                    lang = l;
                    break;
                }
            }
        }
        if(lang == null){
            lang = LangHelper.US_LANG_CODE;
        }
        trace("Selected lang: " + lang);
    }

    public function isPolishLanguage():Boolean {
        lang = resourceManager.localeChain[0];
        return LangHelper.isPolishLang(lang);
    }

    public function getLang():String {
        return lang;
    }

}
}
