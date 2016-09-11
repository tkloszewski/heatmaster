/**
 * Created by Dom on 2016-07-31.
 */
package pl.znr.heatmaster.config {
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;

import pl.znr.heatmaster.config.dictionary.DictionaryConfigReader;

public class BusinessConfigurationReader {

    private var dictionaryConfigurationReader:DictionaryConfigReader;
    private var countryStationConfigurationReader:CountryStationConfigurationReader;

    private var configXML:XML;

    public function BusinessConfigurationReader(countryXML:XML,stationsXML:XML,dictionaryXML:XML,resManager:IResourceManager) {
        this.configXML = countryXML;
        countryStationConfigurationReader = new CountryStationConfigurationReader(countryXML,stationsXML,resManager);
        dictionaryConfigurationReader = new DictionaryConfigReader(dictionaryXML,resManager);
    }

    public function readBusinessConfiguration():BusinessConfiguration{
        var verticalResThreshold:Number = Number(configXML.vertical_res_threshold);

        var countryItems:ArrayCollection = countryStationConfigurationReader.readConfig();
        var dictionaryConfig:DictionaryConfig = dictionaryConfigurationReader.readConfig();

        var businessConfiguration:BusinessConfiguration = new BusinessConfiguration();
        businessConfiguration.countryItems = countryItems;
        businessConfiguration.dictionaryConfig = dictionaryConfig;
        businessConfiguration.polishExchangeRate = countryStationConfigurationReader.getEuroToPLNExchangeRate();

        var countryRegionCode:String = CountryItemHelper.getInitialConfigItemCode();
        var regionItem:RegionItem = CountryItemHelper.getRegionByCodeFromCountryList(countryItems, countryRegionCode);
        var countryItem:CountryItem = regionItem != null ? regionItem.country : CountryItemHelper.getCountryByCode(countryItems, countryRegionCode);

        businessConfiguration.countryRegionCode = countryRegionCode;
        businessConfiguration.regionItem = regionItem;
        businessConfiguration.countryItem = countryItem;
        businessConfiguration.verticalResThreshold = verticalResThreshold;

        return businessConfiguration;
    }


}
}
