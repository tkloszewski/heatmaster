/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.08.13
 * Time: 18:11
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config.dictionary.model {
import pl.znr.heatmaster.config.dictionary.DictionaryConfig;

public class BaseComboObject {

    private var _id:String;
    private var _labelKey:String;
    private var _name:String;
    private var _enName:String;
    private var _plName:String;

    public function BaseComboObject(id:String) {
        _id = id;
    }

    public function getId():String {
        return _id;
    }


    public function get id():String {
        return _id;
    }

    public function set id(value:String):void {
        _id = value;
    }

    public function get labelKey():String {
        return _labelKey;
    }

    public function set labelKey(value:String):void {
        _labelKey = value;
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
    }

    public function get enName():String {
        return _enName;
    }

    public function set enName(value:String):void {
        _enName = value;
    }

    public function get plName():String {
        return _plName;
    }

    public function set plName(value:String):void {
        _plName = value;
    }
}
}
