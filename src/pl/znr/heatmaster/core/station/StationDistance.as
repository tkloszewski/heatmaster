/**
 * Created by Dom on 2016-06-21.
 */
package pl.znr.heatmaster.core.station {
import pl.znr.heatmaster.config.StationItem;

public class StationDistance {

    private var _station:StationItem;
    private var _distance:int;

    public function StationDistance(position:Position, station:StationItem) {
        _station = station;
        this._distance = position.distance(new Position(station.mapX,station.mapY));
    }

    public function get distance():int {
        return _distance;
    }

    public function set distance(value:int):void {
        _distance = value;
    }


    public function get station():StationItem {
        return _station;
    }
}
}
