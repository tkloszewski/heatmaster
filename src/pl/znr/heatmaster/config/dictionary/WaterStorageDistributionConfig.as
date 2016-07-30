/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class WaterStorageDistributionConfig {

    private var _waterDistributionTypes:ArrayCollection;
    private var _waterStorageTypes:ArrayCollection;

    public function WaterStorageDistributionConfig() {
    }

    public function get waterDistributionTypes():ArrayCollection {
        return _waterDistributionTypes;
    }

    public function set waterDistributionTypes(value:ArrayCollection):void {
        _waterDistributionTypes = value;
    }

    public function get waterStorageTypes():ArrayCollection {
        return _waterStorageTypes;
    }

    public function set waterStorageTypes(value:ArrayCollection):void {
        _waterStorageTypes = value;
    }
}
}
