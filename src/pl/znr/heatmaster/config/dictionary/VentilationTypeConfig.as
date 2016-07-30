/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class VentilationTypeConfig {

    private var _ventilationTypes:ArrayCollection;

    public function VentilationTypeConfig(ventilationTypes:ArrayCollection) {
        _ventilationTypes = ventilationTypes;
    }

    public function get ventilationTypes():ArrayCollection {
        return _ventilationTypes;
    }

    public function set ventilationTypes(value:ArrayCollection):void {
        _ventilationTypes = value;
    }
}
}
