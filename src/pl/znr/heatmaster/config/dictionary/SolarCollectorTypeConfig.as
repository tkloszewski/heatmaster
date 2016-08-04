/**
 * Created by Dom on 2016-06-15.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class SolarCollectorTypeConfig extends BaseTypeConfig{

    private var _solarCollectorTypes:ArrayCollection;

    public function get solarCollectorTypes():ArrayCollection {
        return _solarCollectorTypes;
    }

    public function set solarCollectorTypes(value:ArrayCollection):void {
        _solarCollectorTypes = value;
    }
}
}
