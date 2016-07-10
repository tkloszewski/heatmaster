/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 13.04.14
 * Time: 13:58
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config {

import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.util.SortingUtil;

import spark.collections.Sort;
import spark.collections.SortField;

public class HeatMasterConfigurationReader {

    private var countryConfigReader:CountryConfigurationReader;
    private var stationConfigReader:StationConfigurationReader;
    private var resManager:IResourceManager;

    private var config:ArrayCollection;

    public function HeatMasterConfigurationReader(countryXML:XML,stationsXML:XML,resManager:IResourceManager = null) {
        this.countryConfigReader = new CountryConfigurationReader(countryXML,resManager);
        this.stationConfigReader = new StationConfigurationReader(stationsXML,resManager);
        this.resManager = resManager;
    }

    public function readConfig():ArrayCollection {
        if(config != null){
           return config;
        }
        config = countryConfigReader.readConfig();
        config = applyStationConfig(new StationsWrapper(stationConfigReader.readConfig()),config);
        return config;
    }


    public function getEuroToPLNExchangeRate():Number {
        return countryConfigReader.getEuroToPLNExchangeRate();
    }

    private function applyStationConfig(stationsWrapper:StationsWrapper,config:ArrayCollection):ArrayCollection {
        for(var i:int =0;i < config.length; i++){
            var countryItem:CountryItem = config.getItemAt(i) as CountryItem;
            var stationConfig:StationsConfig = stationsWrapper.getStationsForCountry(countryItem.code);
            if(stationConfig != null){
                countryItem.stationsConfig = stationConfig;
                countryItem.noRegions = true;
                countryItem.regions = new ArrayCollection();
                countryItem.ignoreConfigPrices = true;
            }
        }
        return config;
    }




}
}
