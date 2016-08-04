/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class VentilationTypeConfig {

    private var _ventilationTypes:ArrayCollection;
    private var _selectedIndex:int;

    public function VentilationTypeConfig(ventilationTypes:ArrayCollection) {
        _ventilationTypes = ventilationTypes;
    }

    public function get ventilationTypes():ArrayCollection {
        return _ventilationTypes;
    }

    public function set ventilationTypes(value:ArrayCollection):void {
        _ventilationTypes = value;
    }

    public function get selectedIndex():int {
        return _selectedIndex;
    }

    public function set selectedIndex(value:int):void {
        _selectedIndex = value;
    }
}
}
