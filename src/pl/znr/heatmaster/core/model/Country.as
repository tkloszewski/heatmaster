/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 15:48
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
public class Country {

    private var _name:String;
    private var _lang:String;

    public function Country() {
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
    }

    public function get lang():String {
        return _lang;
    }

    public function set lang(value:String):void {
        _lang = value;
    }
}
}
