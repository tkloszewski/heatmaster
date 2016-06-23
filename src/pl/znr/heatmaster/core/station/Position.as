/**
 * Created by Dom on 2016-06-21.
 */
package pl.znr.heatmaster.core.station {
public class Position {

    private var _x:int;
    private var _y:int;

    public function Position(x:int, y:int) {
        _x = x;
        _y = y;
    }

    public function distance(position:Position):Number {
        return (_x - position.x) * (_x - position.x) +
               (_y - position.y) * (_y - position.y)
    }

    public function get x():int {
        return _x;
    }

    public function get y():int {
        return _y;
    }
}
}
