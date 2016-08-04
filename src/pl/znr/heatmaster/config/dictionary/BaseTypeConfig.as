/**
 * Created by Dom on 2016-07-27.
 */
package pl.znr.heatmaster.config.dictionary {
public class BaseTypeConfig {

    private var _selectedIndex:int;

    public function BaseTypeConfig() {
    }

    public function get selectedIndex():int {
        return _selectedIndex;
    }

    public function set selectedIndex(value:int):void {
        _selectedIndex = value;
    }
}
}
