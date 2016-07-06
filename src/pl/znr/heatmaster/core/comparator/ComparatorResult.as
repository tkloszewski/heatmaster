/**
 * Created by Dom on 2016-07-04.
 */
package pl.znr.heatmaster.core.comparator {
import pl.znr.heatmaster.core.comparator.ComparatorResultItem;

public class ComparatorResult {

    private var _walls:ComparatorResultItem;
    private var _doors:ComparatorResultItem;
    private var _windows:ComparatorResultItem;
    private var _roof:ComparatorResultItem;
    private var _floor:ComparatorResultItem;
    private var _vent:ComparatorResultItem;
    private var _tightness:ComparatorResultItem;
    private var _solarGains:ComparatorResultItem;
    private var _personGains:ComparatorResultItem;

    private var _refBalanceValueInWatts:Number;
    private var _refBalanceValueInKwh:Number;
    private var _savedBalancedValueInWatts:Number;
    private var _savedBalancedValueInKwh;Number;

    public function ComparatorResult() {
    }


    public function get refBalanceValueInWatts():Number {
        return _refBalanceValueInWatts;
    }

    public function set refBalanceValueInWatts(value:Number):void {
        _refBalanceValueInWatts = value;
    }

    public function get refBalanceValueInKwh():Number {
        return _refBalanceValueInKwh;
    }

    public function set refBalanceValueInKwh(value:Number):void {
        _refBalanceValueInKwh = value;
    }

    public function get savedBalancedValueInWatts():Number {
        return _savedBalancedValueInWatts;
    }

    public function set savedBalancedValueInWatts(value:Number):void {
        _savedBalancedValueInWatts = value;
    }

    public function get savedBalancedValueInKwh():* {
        return _savedBalancedValueInKwh;
    }

    public function set savedBalancedValueInKwh(value):void {
        _savedBalancedValueInKwh = value;
    }

    public function get walls():ComparatorResultItem {
        return _walls;
    }

    public function set walls(value:ComparatorResultItem):void {
        _walls = value;
    }

    public function get doors():ComparatorResultItem {
        return _doors;
    }

    public function set doors(value:ComparatorResultItem):void {
        _doors = value;
    }

    public function get windows():ComparatorResultItem {
        return _windows;
    }

    public function set windows(value:ComparatorResultItem):void {
        _windows = value;
    }

    public function get roof():ComparatorResultItem {
        return _roof;
    }

    public function set roof(value:ComparatorResultItem):void {
        _roof = value;
    }

    public function get floor():ComparatorResultItem {
        return _floor;
    }

    public function set floor(value:ComparatorResultItem):void {
        _floor = value;
    }

    public function get vent():ComparatorResultItem {
        return _vent;
    }

    public function set vent(value:ComparatorResultItem):void {
        _vent = value;
    }

    public function get tightness():ComparatorResultItem {
        return _tightness;
    }

    public function set tightness(value:ComparatorResultItem):void {
        _tightness = value;
    }

    public function get solarGains():ComparatorResultItem {
        return _solarGains;
    }

    public function set solarGains(value:ComparatorResultItem):void {
        _solarGains = value;
    }

    public function get personGains():ComparatorResultItem {
        return _personGains;
    }

    public function set personGains(value:ComparatorResultItem):void {
        _personGains = value;
    }
}
}
