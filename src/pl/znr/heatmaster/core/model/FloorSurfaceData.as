/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 05.09.13
 * Time: 01:02
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
public class FloorSurfaceData {

    private var _a:Number;
    private var _b:Number;


    public function FloorSurfaceData(a:Number, b:Number) {
        _a = a;
        _b = b;
    }

    public function get a():Number {
        return _a;
    }

    public function set a(value:Number):void {
        _a = value;
    }

    public function get b():Number {
        return _b;
    }

    public function set b(value:Number):void {
        _b = value;
    }
}
}
