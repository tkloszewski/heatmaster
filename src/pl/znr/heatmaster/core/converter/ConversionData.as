/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 21.06.13
 * Time: 20:46
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.converter {
public class ConversionData {

    private var _selectedUnit:int;
    private var _unitName:String;
    private var _shortUnitName:String;
    private var _pricePerKwh:Number;
    private var _electricityPricePerKwh:Number;
    private var _waterPricePerkWh:Number;
    private var _houseHeatingEfficiency:Number;
    private var _warmWaterHeatingEfficiency:Number;
    private var _finalToPrimaryCoefficient:Number;
    private var _warmWaterFinalToPrimaryCoefficient:Number;
    private var _emissionCoefficient:Number;
    private var _waterEmissionCoefficient:Number;
    private var _toPLNCurrencyExchangeRate:Number;

    public function ConversionData() {
    }

    public static function buildConversionDataFromConversionData(conversionData:ConversionData,unit:int){
        var result:ConversionData = buildConversionData(unit,conversionData.pricePerKwh);
        result.waterPricePerkWh = conversionData.waterPricePerkWh;
        result.houseHeatingEfficiency = conversionData.houseHeatingEfficiency;
        result.warmWaterHeatingEfficiency = conversionData.warmWaterHeatingEfficiency;
        result.electricityPricePerKwh = conversionData.electricityPricePerKwh;
        return result;
    }

    public static function buildConversionData(selectedUnit:int,privePerkWh:Number):ConversionData {
        var conversionData:ConversionData = new ConversionData();
        conversionData.selectedUnit = selectedUnit;
        conversionData.pricePerKwh = privePerkWh;
        return conversionData;
    }

    public static function buildConversionDataWithEmissionCoefficient(selectedUnit:int,privePerkWh:Number,emissionCoefficient:Number):ConversionData {
        var conversionData:ConversionData = new ConversionData();
        conversionData.selectedUnit = selectedUnit;
        conversionData.pricePerKwh = privePerkWh;
        conversionData.emissionCoefficient = emissionCoefficient;
        conversionData.waterEmissionCoefficient = emissionCoefficient;
        return conversionData;
    }

    public function toString():String{
        return "SelectedUnit: " + _selectedUnit + " pricekWh " + _pricePerKwh + " unitName " + _unitName + " " +
                " waterPricePerKwh: " + _waterPricePerkWh + " houseHeatingEfficiency: " + _houseHeatingEfficiency +
                " warmWaterEfficiency: " + _warmWaterHeatingEfficiency + " ";
    }




    public function get unitName():String {
        return _unitName;
    }

    public function set unitName(value:String):void {
        _unitName = value;
    }

    public function get shortUnitName():String {
        return _shortUnitName;
    }

    public function set shortUnitName(value:String):void {
        _shortUnitName = value;
    }

    public function get selectedUnit():int {
        return _selectedUnit;
    }

    public function set selectedUnit(value:int):void {
        _selectedUnit = value;
    }

    public function get pricePerKwh():Number {
        return _pricePerKwh;
    }

    public function set pricePerKwh(value:Number):void {
        _pricePerKwh = value;
    }

    public function get waterPricePerkWh():Number {
        return _waterPricePerkWh;
    }

    public function set waterPricePerkWh(value:Number):void {
        _waterPricePerkWh = value;
    }

    public function get houseHeatingEfficiency():Number {
        return _houseHeatingEfficiency;
    }

    public function set houseHeatingEfficiency(value:Number):void {
        _houseHeatingEfficiency = value;
    }

    public function get warmWaterHeatingEfficiency():Number {
        return _warmWaterHeatingEfficiency;
    }

    public function set warmWaterHeatingEfficiency(value:Number):void {
        _warmWaterHeatingEfficiency = value;
    }

    public function get finalToPrimaryCoefficient():Number {
        return _finalToPrimaryCoefficient;
    }

    public function set finalToPrimaryCoefficient(value:Number):void {
        _finalToPrimaryCoefficient = value;
    }

    public function get warmWaterFinalToPrimaryCoefficient():Number {
        return _warmWaterFinalToPrimaryCoefficient;
    }

    public function set warmWaterFinalToPrimaryCoefficient(value:Number):void {
        _warmWaterFinalToPrimaryCoefficient = value;
    }

    public function get emissionCoefficient():Number {
        return _emissionCoefficient;
    }

    public function set emissionCoefficient(value:Number):void {
        _emissionCoefficient = value;
    }

    public function get waterEmissionCoefficient():Number {
        return _waterEmissionCoefficient;
    }

    public function set waterEmissionCoefficient(value:Number):void {
        _waterEmissionCoefficient = value;
    }


    public function get toPLNCurrencyExchangeRate():Number {
        return _toPLNCurrencyExchangeRate;
    }

    public function set toPLNCurrencyExchangeRate(value:Number):void {
        _toPLNCurrencyExchangeRate = value;
    }

    public function get electricityPricePerKwh():Number {
        return _electricityPricePerKwh;
    }

    public function set electricityPricePerKwh(value:Number):void {
        _electricityPricePerKwh = value;
    }
}
}
