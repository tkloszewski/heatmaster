/**
 * Created by Dom on 2016-06-20.
 */
package pl.znr.heatmaster.config {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

public class StationConfigurationReader {

    private var stationsXML:XML;
    private var resourceManager:IResourceManager;

    private var stationList:ArrayCollection;

    public function StationConfigurationReader(stationsXML:XML,resourceManager:IResourceManager) {
        this.stationsXML = stationsXML;
        this.resourceManager = resourceManager;
    }

    public function getStationForCountry(countryCode:String):StationItem {
        return null;
    }

    private function readConfig(){

    }
}
}
