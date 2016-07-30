/**
 * Created by Dom on 2016-06-14.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class DoorTypeConfig extends BaseTypeConfig{

    private var _doorTypes:ArrayCollection;

    public function get doorTypes():ArrayCollection {
        return _doorTypes;
    }

    public function set doorTypes(value:ArrayCollection):void {
        _doorTypes = value;
    }
}
}
