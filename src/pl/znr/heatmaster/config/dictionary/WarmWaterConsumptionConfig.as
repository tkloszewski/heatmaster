/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class WarmWaterConsumptionConfig {

    private var _consumptionIntensities:ArrayCollection;
    private var _selectedIndex:int;

    public function WarmWaterConsumptionConfig(consumptionIntensities:ArrayCollection) {
        this._consumptionIntensities = consumptionIntensities;
    }

    public function get consumptionIntensities():ArrayCollection {
        return _consumptionIntensities;
    }

    public function set consumptionIntensities(value:ArrayCollection):void {
        _consumptionIntensities = value;
    }


    public function get selectedIndex():int {
        return _selectedIndex;
    }

    public function set selectedIndex(value:int):void {
        _selectedIndex = value;
    }
}
}
