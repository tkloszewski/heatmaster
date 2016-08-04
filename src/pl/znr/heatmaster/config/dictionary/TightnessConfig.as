/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class TightnessConfig {

    private var _tightnessItems:ArrayCollection;
    private var _selectedIndex:int;

    public function TightnessConfig(tightnessItems:ArrayCollection) {
        this._tightnessItems = tightnessItems;
    }

    public function get tightnessItems():ArrayCollection {
        return _tightnessItems;
    }

    public function set tightnessItems(value:ArrayCollection):void {
        _tightnessItems = value;
    }

    public function get selectedIndex():int {
        return _selectedIndex;
    }

    public function set selectedIndex(value:int):void {
        _selectedIndex = value;
    }
}
}
