/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 07:37
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.converter {
public class ConvertedValue {

    private var _zlotyValue:Number;
    private var _wattsValue:Number;
    private var _kWhValue:Number;

    public function ConvertedValue() {
    }


    public function get zlotyValue():Number {
        return _zlotyValue;
    }

    public function set zlotyValue(value:Number):void {
        _zlotyValue = value;
    }

    public function get wattsValue():Number {
        return _wattsValue;
    }

    public function set wattsValue(value:Number):void {
        _wattsValue = value;
    }

    public function get kWhValue():Number {
        return _kWhValue;
    }

    public function set kWhValue(value:Number):void {
        _kWhValue = value;
    }
}
}
