/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 01.06.14
 * Time: 13:32
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.locale {
import flash.system.Capabilities;

public class LangHelper {
    public static const US_LANG_CODE:String = 'en_US';
    public static const PL_LANG_CODE:String = 'pl_PL';

    public function LangHelper() {
    }


    public static function isPolishLang(lang:String):Boolean {
        return lang.substr(0, 2) == 'pl';
    }

    public static function isEnglishLang(lang:String):Boolean {
        return lang.substr(0, 2) == 'en';
    }

    public static function getLocalLanguage():String {
        var lang:String = Capabilities.language;
        if(isPolishLang(lang)){
            return PL_LANG_CODE;
        }
        return US_LANG_CODE;
    }
}
}
