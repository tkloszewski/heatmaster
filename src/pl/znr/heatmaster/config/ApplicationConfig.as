/**
 * Created by Dom on 2016-06-14.
 */
package pl.znr.heatmaster.config {
import mx.collections.ArrayCollection;

public class ApplicationConfig {

    private var _countries:ArrayCollection;

    public function ApplicationConfig() {
    }


    public function get countries():ArrayCollection {
        return _countries;
    }

    public function set countries(value:ArrayCollection):void {
        _countries = value;
    }
}
}
