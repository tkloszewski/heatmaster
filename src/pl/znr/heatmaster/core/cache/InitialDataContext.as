/**
 * Created by Dom on 2016-08-06.
 */
package pl.znr.heatmaster.core.cache {
public class InitialDataContext {

    private var _lang:String;

    public function InitialDataContext() {
    }

    public function get lang():String {
        return _lang;
    }

    public function set lang(value:String):void {
        _lang = value;
    }
}
}
