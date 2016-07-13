/**
 * Created by Dom on 2016-07-12.
 */
package pl.znr.heatmaster.ui.plot {
public class RenderMode {

    private var _rangeMode:int;
    private var _columnMode:int;

    public function RenderMode(rangeMode:int, columnMode:int) {
        _rangeMode = rangeMode;
        _columnMode = columnMode;
    }

    public function get rangeMode():int {
        return _rangeMode;
    }

    public function set rangeMode(value:int):void {
        _rangeMode = value;
    }

    public function get columnMode():int {
        return _columnMode;
    }

    public function set columnMode(value:int):void {
        _columnMode = value;
    }
}
}
