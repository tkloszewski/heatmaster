/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

import pl.znr.heatmaster.config.dictionary.model.FoundationsType;

public class FoundationsTypeConfig {

    private var _foundationsType:ArrayCollection;

    public function FoundationsTypeConfig(foundationsType:ArrayCollection) {
        this._foundationsType = foundationsType;
    }

    public function get foundationsType():ArrayCollection {
        return _foundationsType;
    }

    public function set foundationsType(value:ArrayCollection):void {
        _foundationsType = value;
    }
}
}
