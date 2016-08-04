/**
 * Created by Dom on 2016-07-31.
 */
package pl.znr.heatmaster.config {
import mx.collections.ArrayCollection;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;

public class BusinessConfiguration {

    private var _countryItems:ArrayCollection;
    private var _dictionaryConfig:DictionaryConfig;
    private var _polishExchangeRate:Number;

    private var _countryRegionCode:String;
    private var _regionItem:RegionItem;
    private var _countryItem:CountryItem;

    public function BusinessConfiguration() {
    }

    public function get countryItems():ArrayCollection {
        return _countryItems;
    }

    public function set countryItems(value:ArrayCollection):void {
        _countryItems = value;
    }

    public function get dictionaryConfig():DictionaryConfig {
        return _dictionaryConfig;
    }

    public function set dictionaryConfig(value:DictionaryConfig):void {
        _dictionaryConfig = value;
    }

    public function get polishExchangeRate():Number {
        return _polishExchangeRate;
    }

    public function set polishExchangeRate(value:Number):void {
        _polishExchangeRate = value;
    }

    public function get countryRegionCode():String {
        return _countryRegionCode;
    }

    public function set countryRegionCode(value:String):void {
        _countryRegionCode = value;
    }

    public function get regionItem():RegionItem {
        return _regionItem;
    }

    public function set regionItem(value:RegionItem):void {
        _regionItem = value;
    }

    public function get countryItem():CountryItem {
        return _countryItem;
    }

    public function set countryItem(value:CountryItem):void {
        _countryItem = value;
    }
}
}
