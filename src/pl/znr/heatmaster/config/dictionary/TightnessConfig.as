/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class TightnessConfig {

    private var _tightnessItems:ArrayCollection;

    public function TightnessConfig(tightnessItems:ArrayCollection) {
        this._tightnessItems = tightnessItems;
    }

    public function get tightnessItems():ArrayCollection {
        return _tightnessItems;
    }

    public function set tightnessItems(value:ArrayCollection):void {
        _tightnessItems = value;
    }
}
}
