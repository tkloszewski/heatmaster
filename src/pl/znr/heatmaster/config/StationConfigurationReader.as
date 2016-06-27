/**
 * Created by Dom on 2016-06-20.
 */
package pl.znr.heatmaster.config {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.core.calc.util.TemperatureCalculator;

public class StationConfigurationReader {

    private var stationsXML:XML;
    private var resourceManager:IResourceManager;

    private var stationsConfig:ArrayCollection;

    public function StationConfigurationReader(stationsXML:XML,resourceManager:IResourceManager) {
        this.stationsXML = stationsXML;
        this.resourceManager = resourceManager;
    }

    public function readConfig():ArrayCollection{
        if(stationsConfig == null){
           stationsConfig = doReadConfig();
        }
        return stationsConfig;
    }

    private function doReadConfig():ArrayCollection{
        var result:ArrayCollection = new ArrayCollection();
        for each (var stationConfigXML:XML in stationsXML.station_config) {
           result.addItem(readStationConfig(stationConfigXML));
        }
        return result;
    }

    private function readStationConfig(stationConfigXML:XML):StationsConfig {
        var stationConfig:StationsConfig = new StationsConfig();
        stationConfig.countryCode = stationConfigXML.country;
        stationConfig.mapImage = stationConfigXML.map_image;

        var stations:ArrayCollection = new ArrayCollection();

        for each (var stationXML:XML in stationConfigXML.stations.station) {
            var station:StationItem = readStationItem(stationXML);
            stations.addItem(station);
            if(station.isDefaultStation()){
               stationConfig.defaultStation = station;
            }
        }

        stationConfig.stations = stations;
        return stationConfig;
    }


    private function readStationItem(stationXML:XML):StationItem {
        var stationItem:StationItem = new StationItem();
        stationItem.localeCode = stationXML.name;
        stationItem.code = stationXML.name;
        stationItem.name = resourceManager.getString("hm",stationItem.localeCode);

        stationItem.mapX = new Number(stationXML.position.img_x);
        stationItem.mapY = new Number(stationXML.position.img_y);


        if(stationXML.default_station != null && stationXML.default_station == "true"){
           stationItem.setDefaultStation(true);
        }

        var temperatures:Array = new Array(12);
        var insolationS:Array = new Array(12);
        var insolationWE:Array = new Array(12);
        var insolationN:Array = new Array(12);
        var optimalInsolation:Array = new Array(12);

        for(var k:int = 0;k<12;k++){
            temperatures[k] = new Number(stationXML.temperatures.t[k]);
            optimalInsolation[k] = new Number(stationXML.insolation.optimal.i[k]);
            insolationS[k] = new Number(stationXML.insolation.south.i[k]);
            insolationWE[k] = new Number(stationXML.insolation.west_east.i[k]);
            insolationN[k] = new Number(stationXML.insolation.north.i[k]);
        }

        stationItem.temperatures = temperatures;
        stationItem.groundTemperatures = TemperatureCalculator.calcGroundTemperatures(temperatures);
        stationItem.insolationN = insolationN;
        stationItem.insolationS = insolationS;
        stationItem.insolationWE = insolationWE;
        stationItem.optimalInsolation = optimalInsolation;

        return stationItem;
    }



}
}
