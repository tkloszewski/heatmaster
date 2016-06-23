/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 11.05.14
 * Time: 15:22
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config {
import mx.collections.ArrayCollection;

import pl.znr.heatmaster.core.DataContext;

public class CountryItemHelper {

    public static function getInitialConfigItemCode():String {
        return 'pl';
    }

    public static function isInitialLocalCurrencySet():Boolean {
        return true;
    }

    public static function getCountryElectricityPrice(countryItem:CountryItem,localCurrency:Boolean):Number {
        var rate:Number = localCurrency ? countryItem.currencyExchangeRate : 1.0;
        return countryItem.electricityPrice * rate;
    }

    public static function getInitialOrCachedRegionItem(cached:Boolean,cachedData:DataContext,configItems:ArrayCollection):RegionItem {
        var itemCode:String = CountryItemHelper.getInitialConfigItemCode();
        if (cached) {
            itemCode = getConfigItemCode(cachedData);
        }

        return CountryItemHelper.getRegionByCodeFromCountryList(configItems, itemCode);
    }

    public static function getInitialOrCachedCountryItem(cached:Boolean,cachedData:DataContext,configItems:ArrayCollection):CountryItem {
        var itemCode:String = getInitialConfigItemCode();
        if (cached) {
            itemCode = getConfigItemCode(cachedData);
        }

        return CountryItemHelper.getCountryByCode(configItems, itemCode);
    }

    public static function getConfigItemCode(cachedData:DataContext):String {
        if (cachedData != null && cachedData.selectedCountryRegion != null) {
            return cachedData.selectedCountryRegion;
        }
        return getInitialConfigItemCode();
    }

    public static function  getRegionList(countryList:ArrayCollection):ArrayCollection {
        var result:ArrayCollection = new ArrayCollection();
        if(countryList != null && countryList.length > 0){
            for(var i:int = 0; i < countryList.length;i++){
                var countryItem:CountryItem = countryList.getItemAt(i) as CountryItem;
                if(countryItem.regions.length > 0){
                    for(var j:int; j < countryItem.regions.length;j++){
                        var regionItem:RegionItem = countryItem.regions.getItemAt(j) as RegionItem;
                        result.addItem(regionItem);
                    }
                }
            }
        }
        return result;
    }

    public static function getCountryByCode(configItems:ArrayCollection, code:String):CountryItem {
        var countryItem:CountryItem = null;
        for (var i:int = 0; i < configItems.length; i++) {
            var configItem:CountryItem = configItems.getItemAt(i) as CountryItem;
            if (configItem.code == code) {
                countryItem = configItem;
                break;
            }
        }
        return countryItem;
    }

    public static function getRegionByCode(countryItem:CountryItem, code:String):RegionItem {
        var regionItemRes:RegionItem = null;
        trace("Searching for countryItem with regions: " + countryItem.regions.length);
        for (var i:int = 0; i < countryItem.regions.length; i++) {
            var regionItem:RegionItem =  countryItem.regions.getItemAt(i) as RegionItem;
            trace("Searching region " + regionItem.code);
            if (regionItem.code == code) {
                return regionItem;
            }
        }
        return regionItemRes;
    }

    public static function getRegionByCodeFromCountryList(countryList:ArrayCollection,code:String):RegionItem{
        trace("Searching getRegionByCodeFromCountryList for code: " + code);
        for (var i:int = 0; i < countryList.length; i++) {
            var configItem:CountryItem = countryList.getItemAt(i) as CountryItem;

            var regionItem:RegionItem = getRegionByCode(configItem,code);
            if(regionItem != null){
                return regionItem;
            }
        }
        return null;
    }

    public static function getCountryByCountryRegionCode(configItems:ArrayCollection,countryRegionCode:String):CountryItem {
        var countryItem:CountryItem = getCountryByCode(configItems,countryRegionCode);
        if(countryItem != null){
            return countryItem;
        }
        var regionItem:RegionItem = getRegionByCodeFromCountryList(configItems,countryRegionCode);
        return regionItem != null ? regionItem.country : null;
    }
}
}
