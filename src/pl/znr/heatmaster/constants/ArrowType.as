/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 15.07.13
 * Time: 18:50
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants {
public class ArrowType {
    public static const LOSS_TYPE:int = 1;
    public static const GAIN_TYPE:int = 2;

    public static var LOSS_ARROW:ArrowType = new ArrowType(LOSS_TYPE,"#8A620C");
    public static var GAIN_ARROW:ArrowType = new ArrowType(GAIN_TYPE,"0x669900");

    private var _type:int;
    private var _color:String;

    function ArrowType(type:int, color:String) {
        this._type = type;
        this._color = color;
    }

    public function get type():int {
        return _type;
    }

    public function get color():String {
        return _color;
    }
}
}
