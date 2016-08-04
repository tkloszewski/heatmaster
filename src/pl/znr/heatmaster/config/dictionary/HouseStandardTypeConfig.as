/**
 * Created by Dom on 2016-07-31.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class HouseStandardTypeConfig {

    private var _houseStandardTypes:ArrayCollection;

    public function HouseStandardTypeConfig(houseStandardTypes:ArrayCollection) {
        _houseStandardTypes = houseStandardTypes;
    }

    public function get houseStandardTypes():ArrayCollection {
        return _houseStandardTypes;
    }

    public function set houseStandardTypes(value:ArrayCollection):void {
        _houseStandardTypes = value;
    }
}
}
