/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class WarmWaterConsumptionConfig {

    private var _consumptionIntensities:ArrayCollection;

    public function WarmWaterConsumptionConfig(consumptionIntensities:ArrayCollection) {
        this._consumptionIntensities = consumptionIntensities;
    }

    public function get consumptionIntensities():ArrayCollection {
        return _consumptionIntensities;
    }

    public function set consumptionIntensities(value:ArrayCollection):void {
        _consumptionIntensities = value;
    }
}
}
