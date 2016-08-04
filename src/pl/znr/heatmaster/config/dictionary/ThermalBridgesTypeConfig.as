/**
 * Created by Dom on 2016-06-15.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class ThermalBridgesTypeConfig extends BaseTypeConfig{

    private var _thermalBridgesTypes:ArrayCollection;

    public function get thermalBridgesTypes():ArrayCollection {
        return _thermalBridgesTypes;
    }

    public function set thermalBridgesTypes(value:ArrayCollection):void {
        _thermalBridgesTypes = value;
    }
}
}
