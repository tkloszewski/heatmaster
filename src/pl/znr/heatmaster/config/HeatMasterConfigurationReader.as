/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 13.04.14
 * Time: 13:58
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config {

import flash.globalization.StringTools;

import mx.collections.XMLListCollection;
import mx.formatters.NumberFormatter;
import mx.collections.ArrayCollection;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;
import mx.utils.StringUtil;
import mx.utils.StringUtil;
import mx.validators.StringValidator;

import pl.znr.heatmaster.constants.GlobalValues;

public class HeatMasterConfigurationReader {

    private static var EURO_TO_ZL:Number = 4.2;

    private var countryXML:XML;

    private var countryList:ArrayCollection = null;

    private var resourceManager:IResourceManager;

    private var numberFormatter:NumberFormatter;

    private var polishExchangeRate:Number;


    public function HeatMasterConfigurationReader(countryXML:XML,resManager:IResourceManager = null) {
        this.countryXML = countryXML;
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

        for each (var country:XML in countryXML.country){

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
            if(country.has_stattions != null && "true" == country.has_stattions){

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
                var regionCodeMain:String = mainRegion.code;

                var temperatures:Array = new Array(12);
                var groundTemperatures:Array = new Array(12);
                var insolationS:Array = new Array(12);
                var insolationWE:Array = new Array(12);
                var insolationN:Array = new Array(12);
                var optimalInsolation:Array = new Array(12);

                for(var k:int = 0;k<12;k++){
                    temperatures[k] = new Number(mainRegion.temperatures.t[k]);
                    groundTemperatures[k] = new Number(mainRegion.temperaturesGround.t[k]);
                    optimalInsolation[k] = new Number(mainRegion.insolation.optimal.i[k]);
                    insolationS[k] = new Number(mainRegion.insolation.south.i[k]);
                    insolationWE[k] = new Number(mainRegion.insolation.west_east.i[k]);
                    insolationN[k] = new Number(mainRegion.insolation.north.i[k]);
                }

                countryItem.temperatures = temperatures;
                countryItem.groundTemperatures = groundTemperatures;
                countryItem.optimalInsolation = optimalInsolation;
                countryItem.insolationS = insolationS;
                countryItem.insolationN = insolationN;
                countryItem.insolationWE = insolationWE;
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

                    var temperatures:Array = new Array(12);
                    var groundTemperatures:Array = new Array(12);
                    var insolationS:Array = new Array(12);
                    var insolationWE:Array = new Array(12);
                    var insolationN:Array = new Array(12);
                    var optimalInsolation:Array = new Array(12);

                    for(var i:int = 0;i<12;i++){
                        temperatures[i] = new Number(region.temperatures.t[i]);
                        groundTemperatures[i] = new Number(region.temperaturesGround.t[i]);
                        optimalInsolation[i] = new Number(region.insolation.optimal.i[i]);
                        insolationS[i] = new Number(region.insolation.south.i[i]);
                        insolationWE[i] = new Number(region.insolation.west_east.i[i]);
                        insolationN[i] = new Number(region.insolation.north.i[i]);
                    }

                    var regionItem:RegionItem = new RegionItem();
                    regionItem.regionCode = regionCode;
                    regionItem.localeCode = localeCode;
                    regionItem.code = code;
                    regionItem.name = name;

                    regionItem.temperatures = temperatures;
                    regionItem.groundTemperatures = groundTemperatures;
                    regionItem.optimalInsolation = optimalInsolation;
                    regionItem.insolationS = insolationS;
                    regionItem.insolationN = insolationN;
                    regionItem.insolationWE = insolationWE;

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

    private function fillTemperaturesAndInsolationData(region:Object,temperatures:Array,groundTemperatures:Array,
                                                       optimalInsolation:Array,insolationS:Array,insolationWE:Array,
                                                       insolationN:Array):void {

        for(var i:int = 0;i<12;i++){
            temperatures[i] = new Number(region.temperatures.t[i]);
            groundTemperatures[i] = new Number(region.temperaturesGround.t[i]);
            optimalInsolation[i] = new Number(region.insolation.optimal.i[i]);
            insolationS[i] = new Number(region.insolation.south.i[i]);
            insolationWE[i] = new Number(region.insolation.west_east.i[i]);
            insolationN[i] = new Number(region.insolation.north.i[i]);
        }

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
