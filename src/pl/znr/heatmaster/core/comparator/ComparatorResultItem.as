/**
 * Created by Dom on 2016-07-04.
 */
package pl.znr.heatmaster.core.comparator {
public class ComparatorResultItem {

    private var _refValueInWatts:Number;
    private var _refValueInKwh:Number;
    private var _valueChanged:Boolean;
    private var _valueSavedInWatts:Number;
    private var _valueSavedInKwh:Number;

    public function ComparatorResultItem() {
    }


    public function get refValueInWatts():Number {
        return _refValueInWatts;
    }

    public function set refValueInWatts(value:Number):void {
        _refValueInWatts = value;
    }

    public function get refValueInKwh():Number {
        return _refValueInKwh;
    }

    public function set refValueInKwh(value:Number):void {
        _refValueInKwh = value;
    }

    public function get valueChanged():Boolean {
        return _valueChanged;
    }

    public function set valueChanged(value:Boolean):void {
        _valueChanged = value;
    }

    public function get valueSavedInWatts():Number {
        return _valueSavedInWatts;
    }

    public function set valueSavedInWatts(value:Number):void {
        _valueSavedInWatts = value;
    }

    public function get valueSavedInKwh():Number {
        return _valueSavedInKwh;
    }

    public function set valueSavedInKwh(value:Number):void {
        _valueSavedInKwh = value;
    }
}
}
