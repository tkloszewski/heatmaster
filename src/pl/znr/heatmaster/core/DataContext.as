/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 15:35
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import pl.znr.heatmaster.config.CountryItem;
import pl.znr.heatmaster.core.converter.ConversionData;
import pl.znr.heatmaster.core.model.Country;
import pl.znr.heatmaster.core.model.EnvironmentalData;
import pl.znr.heatmaster.core.calc.MonthEnergyData;
import pl.znr.heatmaster.core.model.HeatingSourceData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.model.SolarCollectorData;

public class DataContext {

    private var _lang:String;

    private var _conversionData:ConversionData = new ConversionData();
    private var _houseData:HouseData = new HouseData();
    private var _heatingData:HeatingSourceData;
    private var _environmentalData:EnvironmentalData = new EnvironmentalData();
    private var _solarCollectorData:SolarCollectorData;

    private var _includeWarmWater:Boolean = false;
    private var _selectedMonth:int = 0;

    private var _selectedCountryRegion:String;
    private var _countryCode:String;
    private var _initialConfigItem:CountryItem;
    private var _selectedStation:String;

    private var _currencyLocaleCode:String;
    private var _localCurrency:Boolean;

    public function DataContext() {
    }


    public function get houseData():HouseData {
        return _houseData;
    }

    public function set houseData(value:HouseData):void {
        _houseData = value;
    }


    public function get solarCollectorData():SolarCollectorData {
        return _solarCollectorData;
    }

    public function set solarCollectorData(value:SolarCollectorData):void {
        _solarCollectorData = value;
    }

    public function get heatingData():HeatingSourceData {
        return _heatingData;
    }

    public function set heatingData(value:HeatingSourceData):void {
        _heatingData = value;
    }

    public function get environmentalData():EnvironmentalData {
        return _environmentalData;
    }

    public function set environmentalData(value:EnvironmentalData):void {
        _environmentalData = value;
    }


    public function get conversionData():ConversionData {
        return _conversionData;
    }

    public function set conversionData(value:ConversionData):void {
        _conversionData = value;
    }

    public function get selectedMonth():int {
        return _selectedMonth;
    }

    public function set selectedMonth(value:int):void {
        _selectedMonth = value;
    }

    public function get includeWarmWater():Boolean {
        return _includeWarmWater;
    }

    public function set includeWarmWater(value:Boolean):void {
        _includeWarmWater = value;
    }

    public function get selectedCountryRegion():String {
        return _selectedCountryRegion;
    }

    public function set selectedCountryRegion(value:String):void {
        _selectedCountryRegion = value;
    }

    public function get initialConfigItem():CountryItem {
        return _initialConfigItem;
    }

    public function set initialConfigItem(value:CountryItem):void {
        _initialConfigItem = value;
    }

    public function get currencyLocaleCode():String {
        return _currencyLocaleCode;
    }

    public function set currencyLocaleCode(value:String):void {
        _currencyLocaleCode = value;
    }


    public function get countryCode():String {
        return _countryCode;
    }

    public function set countryCode(value:String):void {
        _countryCode = value;
    }


    public function get localCurrency():Boolean {
        return _localCurrency;
    }

    public function set localCurrency(value:Boolean):void {
        _localCurrency = value;
    }

    public function get lang():String {
        return _lang;
    }

    public function set lang(value:String):void {
        _lang = value;
    }


    public function get selectedStation():String {
        return _selectedStation;
    }

    public function set selectedStation(value:String):void {
        _selectedStation = value;
    }
}
}
