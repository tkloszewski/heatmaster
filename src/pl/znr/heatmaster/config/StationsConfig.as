/**
 * Created by Dom on 2016-06-20.
 */
package pl.znr.heatmaster.config {
import mx.collections.ArrayCollection;

public class StationsConfig {

    private var _countryCode:String;
    private var _mapImage:String;
    private var _stations:ArrayCollection;
    private var _defaultStation:StationItem;

    public function StationsConfig() {
    }

    public function get countryCode():String {
        return _countryCode;
    }

    public function set countryCode(value:String):void {
        _countryCode = value;
    }

    public function get mapImage():String {
        return _mapImage;
    }

    public function set mapImage(value:String):void {
        _mapImage = value;
    }

    public function get stations():ArrayCollection {
        return _stations;
    }

    public function set stations(value:ArrayCollection):void {
        _stations = value;
    }


    public function get defaultStation():StationItem {
        return _defaultStation;
    }

    public function set defaultStation(value:StationItem):void {
        _defaultStation = value;
    }
}
}
