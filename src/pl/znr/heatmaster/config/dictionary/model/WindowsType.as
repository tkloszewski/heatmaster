/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 19:37
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config.dictionary.model {
import flash.utils.Dictionary;

import pl.znr.heatmaster.config.dictionary.model.BaseComboObject;

public class WindowsType extends BaseComboObject{

    private static const valueMap:Dictionary = new Dictionary();

    private var _uValue:Number;
    private var _winGain:Number;

    public function WindowsType(id:String,uValue:Number,winGain:Number) {
        super(id);
        valueMap[id] = this;
        this._uValue = uValue;
        this._winGain = winGain;
    }

    public static function getWindowsTypeById(id:String):WindowsType {
        return valueMap[id] as WindowsType;
    }

    public function get uValue():Number {
        return _uValue;
    }

    public function set uValue(value:Number):void {
        _uValue = value;
    }

    public function get winGain():Number {
        return _winGain;
    }

    public function set winGain(value:Number):void {
        _winGain = value;
    }
}
}
