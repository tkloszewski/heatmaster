/**
 * Created by Dom on 2016-06-15.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class InsulationMaterialTypeConfig extends BaseTypeConfig{

    private var _insulationMaterialTypes:ArrayCollection;

    public function get insulationMaterialTypes():ArrayCollection {
        return _insulationMaterialTypes;
    }

    public function set insulationMaterialTypes(value:ArrayCollection):void {
        _insulationMaterialTypes = value;
    }
}
}
