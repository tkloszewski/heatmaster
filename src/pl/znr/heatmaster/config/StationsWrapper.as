/**
 * Created by Dom on 2016-06-21.
 */
package pl.znr.heatmaster.config {
import flash.utils.Dictionary;

import mx.collections.ArrayCollection;

public class StationsWrapper {

    private var countryStations:Dictionary = new Dictionary();

    public function StationsWrapper(stationsConfig:ArrayCollection) {
        fill(stationsConfig);
    }

    public function getStationsForCountry(countryCode:String):StationsConfig {
        return countryStations[countryCode] as StationsConfig;
    }

    private function fill(stationsConfigArray:ArrayCollection): void {
         for(var i:int = 0; i < stationsConfigArray.length;i++){
             var stationConfig:StationsConfig  = stationsConfigArray.getItemAt(i) as StationsConfig;
             countryStations[stationConfig.countryCode] = stationConfig;
         }
    }
}
}
