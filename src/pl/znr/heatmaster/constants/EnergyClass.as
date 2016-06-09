/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 18.07.13
 * Time: 00:29
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants {
public class EnergyClass {

    private var _fromValue:Number;
    private var _toValue:Number;
    private var _code:String;
    private var _description:String;
    private var _color:String;
    private var _separateIconUrl:Boolean;


    public function EnergyClass(fromValue:Number, toValue:Number, code:String, description:String, color:String, separateIconUrl:Boolean = false) {
        _fromValue = fromValue;
        _toValue = toValue;
        _code = code;
        _description = description;
        _color = color;
        _separateIconUrl = separateIconUrl;
    }

    public function contains(value:Number):Boolean {
        return value >= _fromValue && value < _toValue;
    }

    public function get fromValue():Number {
        return _fromValue;
    }

    public function get toValue():Number {
        return _toValue;
    }

    public function get code():String {
        return _code;
    }

    public function get description():String {
        return _description;
    }

    public function get color():String {
        return _color;
    }

    public function get separateIconUrl():Boolean {
        return _separateIconUrl;
    }
}
}
