/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 19:37
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import flash.utils.Dictionary;

public class WindowsType extends BaseComboObject{

    private static const valueMap:Dictionary = new Dictionary();

    public static const ONE_PANE_WINDOWS:WindowsType = new WindowsType("hm.windows.type.one_pane",5.2,0.85);
    public static const TWO_PANE_OLD_WINDOWS:WindowsType = new WindowsType("hm.windows.type.two_pane_old",2.6,0.75);
    public static const TWO_PANE_NEW_WINDOWS:WindowsType = new WindowsType("hm.windows.type.two_pane_new",1.4,0.6);
    public static const THREE_PANE_WINDOWS:WindowsType = new WindowsType("hm.windows.type.three_pane",0.9,0.55);
    public static const THREE_PANE_SPECIAL_WINDOWS:WindowsType = new WindowsType("hm.windows.type.three_pane_special",0.7,0.62);

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
