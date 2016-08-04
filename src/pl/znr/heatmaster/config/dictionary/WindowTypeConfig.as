/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class WindowTypeConfig {

    private var _windowTypes:ArrayCollection;
    private var _selectedIndex:int;

    public function WindowTypeConfig(windowTypes:ArrayCollection) {
        this._windowTypes = windowTypes;
    }

    public function get windowTypes():ArrayCollection {
        return _windowTypes;
    }

    public function set windowTypes(value:ArrayCollection):void {
        _windowTypes = value;
    }


    public function get selectedIndex():int {
        return _selectedIndex;
    }

    public function set selectedIndex(value:int):void {
        _selectedIndex = value;
    }
}
}
