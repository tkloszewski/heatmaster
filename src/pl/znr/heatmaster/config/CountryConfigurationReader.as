/**
 * Created by Dom on 2016-06-21.
 */
package pl.znr.heatmaster.config {
import mx.collections.ArrayCollection;
import mx.formatters.NumberFormatter;
import mx.resources.IResourceManager;
import mx.utils.StringUtil;

import pl.znr.heatmaster.constants.GlobalValues;


public class CountryConfigurationReader {

    private var countriesXML:XML;

    private var countryList:ArrayCollection = null;

    private var resourceManager:IResourceManager;

    private var numberFormatter:NumberFormatter;

    private var polishExchangeRate:Number;

    public function CountryConfigurationReader(countriesXML:XML,resManager:IResourceManager = null) {
        this.countriesXML = countriesXML;
        this.resourceManager = resManager;
        numberFormatter = new NumberFormatter();
        numberFormatter.precision = 2;
        numberFormatter.decimalSeparatorFrom = ",";
    }

    public function readConfig():ArrayCollection {
        if(countryList == null){
            try {
                countryList = doReadConfigHierarchical();
            } catch (e:Error) {
                trace("Error reading file: " + e.getStackTrace())
            }
        }
        return countryList;
    }

    private function doReadConfigHierarchical():ArrayCollection {
        var result:ArrayCollection = new ArrayCollection();

        for each (var country:XML in countriesXML.country){

            var countryCode:String = country.code;

            trace("Reading configuration for country: " + countryCode);


            var electricityPrice:Number = getPrice(country.prices.electricity,GlobalValues.PRICE_ELECTRICITY_KWH_DEFAULT);
            var gasPrice:Number = getPrice(country.prices.gas,GlobalValues.PRICE_ELECTRICITY_KWH_DEFAULT);
            var heatingOilPrice:Number = getPrice(country.prices.heating_oil,GlobalValues.PRICE_OIL_KWH_DEFAULT);
            var coalPrice:Number = getPrice(country.prices.coal,GlobalValues.PRICE_COAL_KWH_DEFAULT);
            var pelletsPrice:Number = getPrice(country.prices.pellets,GlobalValues.PRICE_PELLETS_KWH_DEFAULT);
            var woodChipsPrice:Number = getPrice(country.prices.wood_chips,GlobalValues.PRICE_WOOD_CHIPS_KWH_DEFAULT);
            var firewoodPrice:Number = getPrice(country.prices.firewood,GlobalValues.PRICE_WOOD_KWH_DEFAULT);
            var combinedPrice:Number = country.prices.firewood != null ? new Number(country.prices.combined) : NaN;

            var countryItem:CountryItem = new CountryItem();
            countryItem.electricityPrice = electricityPrice ;
            countryItem.gasPrice = gasPrice ;
            countryItem.heatingOilPrice = heatingOilPrice ;
            countryItem.coalPrice = coalPrice ;
            countryItem.woodChipsPrice = woodChipsPrice ;
            countryItem.firewoodPrice = firewoodPrice ;
            countryItem.pelletsPrice = pelletsPrice ;

            countryItem.combinedPrice = isNaN(combinedPrice) ? 0.9 * gasPrice : combinedPrice;

            var currencyLocaleCode:String = country.currency_name;
            var exchangeRate:Number = new Number(country.exchange_rate);

            if(countryCode == 'pl'){
                polishExchangeRate = exchangeRate;
            }

            countryItem.currencyLocaleCode = currencyLocaleCode;
            countryItem.currencyExchangeRate = exchangeRate;

            countryItem.localeCode = country.name;
            if(resourceManager != null){
                var countryName:String = resourceManager.getString('hm',country.name);
                countryItem.name = countryName;
                countryItem.currencyName = resourceManager.getString('hm',countryItem.currencyLocaleCode);
            }

            countryItem.code = countryCode;

            if(country.regions.region.length() == 1){
                trace("Only one region for country: " + countryCode);
                var mainRegion:XML = country.regions.region[0];

                fillCountryEnvironmentalData(countryItem,mainRegion);

                countryItem.noRegions = true;
            }
            else {
                for each (var region:XML in country.regions.region){
                    var regionCode:String = region.code;
                    var localeCode:String = region.name;
                    var code:String = countryCode + "_" + regionCode;
                    var name:String = localeCode;

                    if(resourceManager != null){
                        name = resourceManager.getString('hm',localeCode);
                        if(name == null || name == ""){
                            name = region.name;
                        }
                    }

                    var regionItem:RegionItem = new RegionItem();
                    regionItem.regionCode = regionCode;
                    regionItem.localeCode = localeCode;
                    regionItem.code = code;
                    regionItem.name = name;

                    fillRegionEnvironmentalData(regionItem,region);

                    regionItem.country = countryItem;
                    countryItem.regions.addItem(regionItem);
                }
            }
            result.addItem(countryItem);
        }

        return result;
    }

    public function getEuroToPLNExchangeRate():Number {
        return polishExchangeRate;
    }

    private function fillCountryEnvironmentalData(countryItem:CountryItem,regionXML:XML):void {
        var temperatures:Array = new Array(12);
        var groundTemperatures:Array = new Array(12);
        var insolationS:Array = new Array(12);
        var insolationWE:Array = new Array(12);
        var insolationN:Array = new Array(12);
        var optimalInsolation:Array = new Array(12);

        for(var k:int = 0;k<12;k++){
            temperatures[k] = new Number(regionXML.temperatures.t[k]);
            groundTemperatures[k] = new Number(regionXML.temperaturesGround.t[k]);
            optimalInsolation[k] = new Number(regionXML.insolation.optimal.i[k]);
            insolationS[k] = new Number(regionXML.insolation.south.i[k]);
            insolationWE[k] = new Number(regionXML.insolation.west_east.i[k]);
            insolationN[k] = new Number(regionXML.insolation.north.i[k]);
        }

        countryItem.temperatures = temperatures;
        countryItem.groundTemperatures = groundTemperatures;
        countryItem.optimalInsolation = optimalInsolation;
        countryItem.insolationS = insolationS;
        countryItem.insolationN = insolationN;
        countryItem.insolationWE = insolationWE;
    }

    private function fillRegionEnvironmentalData(regionItem:RegionItem,regionXML:XML):void {
        var temperatures:Array = new Array(12);
        var groundTemperatures:Array = new Array(12);
        var insolationS:Array = new Array(12);
        var insolationWE:Array = new Array(12);
        var insolationN:Array = new Array(12);
        var optimalInsolation:Array = new Array(12);

        for(var k:int = 0;k<12;k++){
            temperatures[k] = new Number(regionXML.temperatures.t[k]);
            groundTemperatures[k] = new Number(regionXML.temperaturesGround.t[k]);
            optimalInsolation[k] = new Number(regionXML.insolation.optimal.i[k]);
            insolationS[k] = new Number(regionXML.insolation.south.i[k]);
            insolationWE[k] = new Number(regionXML.insolation.west_east.i[k]);
            insolationN[k] = new Number(regionXML.insolation.north.i[k]);
        }

        regionItem.temperatures = temperatures;
        regionItem.groundTemperatures = groundTemperatures;
        regionItem.optimalInsolation = optimalInsolation;
        regionItem.insolationS = insolationS;
        regionItem.insolationN = insolationN;
        regionItem.insolationWE = insolationWE;
    }


    private function getPrice(xmlPrice:String,defaultPrice:Number):Number {
        if(xmlPrice == null || xmlPrice.length == 0){
            return defaultPrice;
        }
        return new Number(xmlPrice);
    }

    private function getNumberValue(str:String):Number {
        str = str.replace(new RegExp(",","g"),".");
        return new Number(str);
    }

    private function isNotEmpty(s:String):Boolean {
        if(s == null || StringUtil.isWhitespace(StringUtil.trim(s))){
            return false;
        }
        var trimmed:String = StringUtil.trim(s);
        for(var i:int = 0; i < trimmed.length; i++){
            if(!StringUtil.isWhitespace(trimmed.charAt(i))){
                return true;
            }
        }
        return false;
    }
}
}
