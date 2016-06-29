/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 13.04.14
 * Time: 13:32
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config {
import flash.sampler._getInvocationCount;

import mx.collections.ArrayCollection;

public class CountryItem implements IEnvironmentalDataConfig{

    private var _code:String;
    private var _localeCode:String;
    private var _countryCode:String;
    private var _regionCode:String;
    private var _name:String;

    private var _currencyName:String;
    private var _currencyLocaleCode:String;

    private var _currencyExchangeRate:Number;

    //image url to


    private var _temperatures:Array;
    private var _groundTemperatures:Array;
    private var _insolationS:Array;
    private var _insolationWE:Array;
    private var _insolationN:Array;
    private var _optimalInsolation:Array;

    // per kwH
    private var _electricityPrice:Number;
    private var _gasPrice:Number;
    private var _heatingOilPrice:Number;
    private var _coalPrice:Number;
    private var _woodChipsPrice:Number;
    private var _firewoodPrice:Number;
    private var _pelletsPrice:Number;

    //0.9 * gasPrice
    private var _combinedPrice:Number;

    private var _noRegions:Boolean;

    private var _regions:ArrayCollection = new ArrayCollection();

    private var _stationsConfig:StationsConfig;

    //if true ignore local country item prices
    private var _ignoreConfigPrices:Boolean;

    public function CountryItem() {
    }


    public function get stationsConfig():StationsConfig {
        return _stationsConfig;
    }

    public function set stationsConfig(value:StationsConfig):void {
        _stationsConfig = value;
    }

    public function get electricityPrice():Number {
        return _electricityPrice;
    }

    public function set electricityPrice(value:Number):void {
        _electricityPrice = value;
    }

    public function get gasPrice():Number {
        return _gasPrice;
    }

    public function set gasPrice(value:Number):void {
        _gasPrice = value;
    }

    public function get heatingOilPrice():Number {
        return _heatingOilPrice;
    }

    public function set heatingOilPrice(value:Number):void {
        _heatingOilPrice = value;
    }

    public function get coalPrice():Number {
        return _coalPrice;
    }

    public function set coalPrice(value:Number):void {
        _coalPrice = value;
    }

    public function get woodChipsPrice():Number {
        return _woodChipsPrice;
    }

    public function set woodChipsPrice(value:Number):void {
        _woodChipsPrice = value;
    }

    public function get firewoodPrice():Number {
        return _firewoodPrice;
    }

    public function set firewoodPrice(value:Number):void {
        _firewoodPrice = value;
    }

    public function get pelletsPrice():Number {
        return _pelletsPrice;
    }

    public function set pelletsPrice(value:Number):void {
        _pelletsPrice = value;
    }

    public function get code():String {
        return _code;
    }

    public function set code(value:String):void {
        _code = value;
    }

    public function get localeCode():String {
        return _localeCode;
    }

    public function set localeCode(value:String):void {
        _localeCode = value;
    }

    public function get countryCode():String {
        return _countryCode;
    }

    public function set countryCode(value:String):void {
        _countryCode = value;
    }

    public function get regionCode():String {
        return _regionCode;
    }

    public function set regionCode(value:String):void {
        _regionCode = value;
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
    }

    public function get temperatures():Array {
        return _temperatures;
    }

    public function set temperatures(value:Array):void {
        _temperatures = value;
    }

    public function get groundTemperatures():Array {
        return _groundTemperatures;
    }

    public function set groundTemperatures(value:Array):void {
        _groundTemperatures = value;
    }

    public function get insolationS():Array {
        return _insolationS;
    }

    public function set insolationS(value:Array):void {
        _insolationS = value;
    }

    public function get insolationWE():Array {
        return _insolationWE;
    }

    public function set insolationWE(value:Array):void {
        _insolationWE = value;
    }

    public function get insolationN():Array {
        return _insolationN;
    }

    public function set insolationN(value:Array):void {
        _insolationN = value;
    }

    public function get optimalInsolation():Array {
        return _optimalInsolation;
    }

    public function set optimalInsolation(value:Array):void {
        _optimalInsolation = value;
    }

    public function get combinedPrice():Number {
        return _combinedPrice;
    }

    public function set combinedPrice(value:Number):void {
        _combinedPrice = value;
    }


    public function get noRegions():Boolean {
        return _noRegions;
    }

    public function set noRegions(value:Boolean):void {
        _noRegions = value;
    }

    public function get regions():ArrayCollection {
        return _regions;
    }

    public function set regions(value:ArrayCollection):void {
        _regions = value;
    }


    public function get currencyName():String {
        return _currencyName;
    }

    public function set currencyName(value:String):void {
        _currencyName = value;
    }

    public function get currencyLocaleCode():String {
        return _currencyLocaleCode;
    }

    public function set currencyLocaleCode(value:String):void {
        _currencyLocaleCode = value;
    }

    public function get currencyExchangeRate():Number {
        return _currencyExchangeRate;
    }

    public function set currencyExchangeRate(value:Number):void {
        _currencyExchangeRate = value;
    }


    public function get ignoreConfigPrices():Boolean {
        return _ignoreConfigPrices;
    }

    public function set ignoreConfigPrices(value:Boolean):void {
        _ignoreConfigPrices = value;
    }
}
}
