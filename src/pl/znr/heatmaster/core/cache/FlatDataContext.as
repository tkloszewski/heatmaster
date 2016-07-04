/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.08.13
 * Time: 18:26
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.cache {
public class FlatDataContext {
    public function FlatDataContext() {
    }

    private var _lang:String;

    private var _selectedCountryRegion:String;
    private var _countryCode:String;
    private var _selectedStation:String;
    private var _currencyLocaleCode:String;
    private var _localCurrency:Boolean;

    private var _selectedMonth:int;

    //conversionData
    private var _selectedUnit:int;
    private var _includeWarmWater:Boolean = false;
    private var _unitName:String;
    private var _shortUnitName:String;
    private var _conversionPricePerKwh:Number;
    private var _conversionWaterPricePerkWh:Number;
    private var _conversionElectricityPricePerkWh:Number;
    private var _houseHeatingEfficiency:Number;
    private var _warmWaterHeatingEfficiency:Number;
    private var _conversionDataFinalToPrimaryCoefficient:Number;
    private var _conversionDataWarmWaterFinalToPrimaryCoefficient:Number;
    private var _conversionDataEmissionCoefficient:Number;
    private var _conversionDataWaterEmissionCoefficient:Number;
    private var _toPLNCurrencyExchangeRate:Number;

    //heatingData
    private var _heatingTypeId:String;
    private var _heatingEfficiency:Number;
    private var _pricePerkWh:Number;
    private var _naturalUnitPrice:Number;
    private var _waterHeatingTypeId:String;
    private var _waterHeatingEfficiency:Number;
    private var _priceWaterPerkWh:Number;
    private var _finalToPrimaryCoefficient:Number;
    private var _warmWaterFinalToPrimaryCoefficient:Number;
    private var _emissionCoefficient:Number;
    private var _waterEmissionCoefficient:Number;

    //solarCollectorData
    private var _collectorTypeId:String;
    private var _surface:Number;
    private var _count:int;

    //houseData general
    private var _houseType:int;
    private var _buildingAgeId:String;
    private var _doorTypeId:String;
    private var _personNumber:int = 2;
    private var _foundationsEnabled:Boolean;
    private var _foundationsUValue:Number;
    private var _tIn:Number;
    private var _houseStandardTypeId:String;

    //warmWaterData
    private var _warmWaterDistributionId:String;
    private var _warmWaterStorageId:String;
    private var _warmWaterHeatingSourceTypeID:String;
    private var _distributorEfficiency:Number;
    private var _storeEfficiency:Number;
    private var _consumptionIntensity:Number;

    //ventilationData
    private var _gwcSet:Boolean;
    private var _ventilationMethod:int;
    private var _ventilationFreq:int;
    private var _recuperateEfficiency:Number;
    private var _co2Sensor:Boolean;
    private var _tightness:Number;

    //wallElement
    private var _wallWidth:Number;
    private var _wallUValue:Number;
    private var _wallInsulationQualityId:String;
    private var _wallHeatTransfer:Number;

    //roofElement
    private var _roofWidth:Number;
    private var _roofUValue:Number;
    private var _roofInsulationQualityId:String;
    private var _roofHeatTransfer:Number;

    //floorElement
    private var _floorWidth:Number;
    private var _floorUValue:Number;
    private var _floorInsulationQualityId:String;
    private var _floorHeatTransfer:Number;

    //windowElement
    private var _windowsUValue:Number;
    private var _windowType:int;
    private var _winGain:Number;
    private var _shutters:Boolean;
    private var _thermalBridgesId:String;

    //surfaceData
    private var _floorCount:Number;
    private var _floorHeight:Number;
    private var _totalSurface:Number;
    private var _floorArea:Number;
    private var _floorSurface:Number;
    private var _floorSurfaceC:Number;
    private var _floorSurfaceR:Number;
    private var _roofSurface:Number;
    private var _wallSurface:Number;
    private var _windowsSurface:Number;
    private var _windowsSurfaceS:Number;
    private var _windowsSurfaceWE:Number;
    private var _windowsSurfaceN:Number;

    //insolationData
    private var _southInsolation:Array;
    private var _westEastInsolation:Array;
    private var _northInsolation:Array;
    private var _groundInsolation45:Array;

    //other environmentalData
    private var _temperatures:Array;
    private var _groundTemperatures:Array;
    private var _tAvg:Number;
    private var _tMin:Number;
    private var _tMax:Number;
    private var _tSigma:Number;


    public function get selectedUnit():int {
        return _selectedUnit;
    }

    public function set selectedUnit(value:int):void {
        _selectedUnit = value;
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

    public function get conversionPricePerKwh():Number {
        return _conversionPricePerKwh;
    }

    public function set conversionPricePerKwh(value:Number):void {
        _conversionPricePerKwh = value;
    }

    public function get conversionWaterPricePerkWh():Number {
        return _conversionWaterPricePerkWh;
    }

    public function set conversionWaterPricePerkWh(value:Number):void {
        _conversionWaterPricePerkWh = value;
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

    public function get conversionDataFinalToPrimaryCoefficient():Number {
        return _conversionDataFinalToPrimaryCoefficient;
    }

    public function set conversionDataFinalToPrimaryCoefficient(value:Number):void {
        _conversionDataFinalToPrimaryCoefficient = value;
    }

    public function get conversionDataWarmWaterFinalToPrimaryCoefficient():Number {
        return _conversionDataWarmWaterFinalToPrimaryCoefficient;
    }

    public function set conversionDataWarmWaterFinalToPrimaryCoefficient(value:Number):void {
        _conversionDataWarmWaterFinalToPrimaryCoefficient = value;
    }

    public function get conversionDataEmissionCoefficient():Number {
        return _conversionDataEmissionCoefficient;
    }

    public function set conversionDataEmissionCoefficient(value:Number):void {
        _conversionDataEmissionCoefficient = value;
    }

    public function get conversionDataWaterEmissionCoefficient():Number {
        return _conversionDataWaterEmissionCoefficient;
    }

    public function set conversionDataWaterEmissionCoefficient(value:Number):void {
        _conversionDataWaterEmissionCoefficient = value;
    }

    public function get heatingTypeId():String {
        return _heatingTypeId;
    }

    public function set heatingTypeId(value:String):void {
        _heatingTypeId = value;
    }

    public function get heatingEfficiency():Number {
        return _heatingEfficiency;
    }

    public function set heatingEfficiency(value:Number):void {
        _heatingEfficiency = value;
    }

    public function get pricePerkWh():Number {
        return _pricePerkWh;
    }

    public function set pricePerkWh(value:Number):void {
        _pricePerkWh = value;
    }

    public function get naturalUnitPrice():Number {
        return _naturalUnitPrice;
    }

    public function set naturalUnitPrice(value:Number):void {
        _naturalUnitPrice = value;
    }

    public function get waterHeatingTypeId():String {
        return _waterHeatingTypeId;
    }

    public function set waterHeatingTypeId(value:String):void {
        _waterHeatingTypeId = value;
    }

    public function get waterHeatingEfficiency():Number {
        return _waterHeatingEfficiency;
    }

    public function set waterHeatingEfficiency(value:Number):void {
        _waterHeatingEfficiency = value;
    }

    public function get priceWaterPerkWh():Number {
        return _priceWaterPerkWh;
    }

    public function set priceWaterPerkWh(value:Number):void {
        _priceWaterPerkWh = value;
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

    public function get collectorTypeId():String {
        return _collectorTypeId;
    }

    public function set collectorTypeId(value:String):void {
        _collectorTypeId = value;
    }

    public function get surface():Number {
        return _surface;
    }

    public function set surface(value:Number):void {
        _surface = value;
    }

    public function get count():int {
        return _count;
    }

    public function set count(value:int):void {
        _count = value;
    }

    public function get houseType():int {
        return _houseType;
    }

    public function set houseType(value:int):void {
        _houseType = value;
    }

    public function get buildingAgeId():String {
        return _buildingAgeId;
    }

    public function set buildingAgeId(value:String):void {
        _buildingAgeId = value;
    }

    public function get doorTypeId():String {
        return _doorTypeId;
    }

    public function set doorTypeId(value:String):void {
        _doorTypeId = value;
    }

    public function get personNumber():int {
        return _personNumber;
    }

    public function set personNumber(value:int):void {
        _personNumber = value;
    }

    public function get foundationsEnabled():Boolean {
        return _foundationsEnabled;
    }

    public function set foundationsEnabled(value:Boolean):void {
        _foundationsEnabled = value;
    }

    public function get tIn():Number {
        return _tIn;
    }

    public function set tIn(value:Number):void {
        _tIn = value;
    }

    public function get warmWaterDistributionId():String {
        return _warmWaterDistributionId;
    }

    public function set warmWaterDistributionId(value:String):void {
        _warmWaterDistributionId = value;
    }

    public function get warmWaterStorageId():String {
        return _warmWaterStorageId;
    }

    public function set warmWaterStorageId(value:String):void {
        _warmWaterStorageId = value;
    }

    public function get warmWaterHeatingSourceTypeID():String {
        return _warmWaterHeatingSourceTypeID;
    }

    public function set warmWaterHeatingSourceTypeID(value:String):void {
        _warmWaterHeatingSourceTypeID = value;
    }

    public function get distributorEfficiency():Number {
        return _distributorEfficiency;
    }

    public function set distributorEfficiency(value:Number):void {
        _distributorEfficiency = value;
    }

    public function get storeEfficiency():Number {
        return _storeEfficiency;
    }

    public function set storeEfficiency(value:Number):void {
        _storeEfficiency = value;
    }

    public function get consumptionIntensity():Number {
        return _consumptionIntensity;
    }

    public function set consumptionIntensity(value:Number):void {
        _consumptionIntensity = value;
    }

    public function get gwcSet():Boolean {
        return _gwcSet;
    }

    public function set gwcSet(value:Boolean):void {
        _gwcSet = value;
    }

    public function get ventilationMethod():int {
        return _ventilationMethod;
    }

    public function set ventilationMethod(value:int):void {
        _ventilationMethod = value;
    }

    public function get ventilationFreq():int {
        return _ventilationFreq;
    }

    public function set ventilationFreq(value:int):void {
        _ventilationFreq = value;
    }

    public function get recuperateEfficiency():Number {
        return _recuperateEfficiency;
    }

    public function set recuperateEfficiency(value:Number):void {
        _recuperateEfficiency = value;
    }

    public function get co2Sensor():Boolean {
        return _co2Sensor;
    }

    public function set co2Sensor(value:Boolean):void {
        _co2Sensor = value;
    }

    public function get tightness():Number {
        return _tightness;
    }

    public function set tightness(value:Number):void {
        _tightness = value;
    }

    public function get wallWidth():Number {
        return _wallWidth;
    }

    public function set wallWidth(value:Number):void {
        _wallWidth = value;
    }

    public function get wallUValue():Number {
        return _wallUValue;
    }

    public function set wallUValue(value:Number):void {
        _wallUValue = value;
    }

    public function get wallInsulationQualityId():String {
        return _wallInsulationQualityId;
    }

    public function set wallInsulationQualityId(value:String):void {
        _wallInsulationQualityId = value;
    }

    public function get roofWidth():Number {
        return _roofWidth;
    }

    public function set roofWidth(value:Number):void {
        _roofWidth = value;
    }

    public function get roofUValue():Number {
        return _roofUValue;
    }

    public function set roofUValue(value:Number):void {
        _roofUValue = value;
    }

    public function get roofInsulationQualityId():String {
        return _roofInsulationQualityId;
    }

    public function set roofInsulationQualityId(value:String):void {
        _roofInsulationQualityId = value;
    }

    public function get floorWidth():Number {
        return _floorWidth;
    }

    public function set floorWidth(value:Number):void {
        _floorWidth = value;
    }

    public function get floorUValue():Number {
        return _floorUValue;
    }

    public function set floorUValue(value:Number):void {
        _floorUValue = value;
    }

    public function get floorInsulationQualityId():String {
        return _floorInsulationQualityId;
    }

    public function set floorInsulationQualityId(value:String):void {
        _floorInsulationQualityId = value;
    }

    public function get windowsUValue():Number {
        return _windowsUValue;
    }

    public function set windowsUValue(value:Number):void {
        _windowsUValue = value;
    }

    public function get windowType():int {
        return _windowType;
    }

    public function set windowType(value:int):void {
        _windowType = value;
    }

    public function get winGain():Number {
        return _winGain;
    }

    public function set winGain(value:Number):void {
        _winGain = value;
    }

    public function get shutters():Boolean {
        return _shutters;
    }

    public function set shutters(value:Boolean):void {
        _shutters = value;
    }


    public function get thermalBridgesId():String {
        return _thermalBridgesId;
    }

    public function set thermalBridgesId(value:String):void {
        _thermalBridgesId = value;
    }

    public function get floorCount():Number {
        return _floorCount;
    }

    public function set floorCount(value:Number):void {
        _floorCount = value;
    }

    public function get floorHeight():Number {
        return _floorHeight;
    }

    public function set floorHeight(value:Number):void {
        _floorHeight = value;
    }

    public function get totalSurface():Number {
        return _totalSurface;
    }

    public function set totalSurface(value:Number):void {
        _totalSurface = value;
    }

    public function get floorArea():Number {
        return _floorArea;
    }

    public function set floorArea(value:Number):void {
        _floorArea = value;
    }

    public function get floorSurface():Number {
        return _floorSurface;
    }

    public function set floorSurface(value:Number):void {
        _floorSurface = value;
    }

    public function get floorSurfaceC():Number {
        return _floorSurfaceC;
    }

    public function set floorSurfaceC(value:Number):void {
        _floorSurfaceC = value;
    }

    public function get floorSurfaceR():Number {
        return _floorSurfaceR;
    }

    public function set floorSurfaceR(value:Number):void {
        _floorSurfaceR = value;
    }

    public function get roofSurface():Number {
        return _roofSurface;
    }

    public function set roofSurface(value:Number):void {
        _roofSurface = value;
    }

    public function get wallSurface():Number {
        return _wallSurface;
    }

    public function set wallSurface(value:Number):void {
        _wallSurface = value;
    }

    public function get windowsSurface():Number {
        return _windowsSurface;
    }

    public function set windowsSurface(value:Number):void {
        _windowsSurface = value;
    }

    public function get windowsSurfaceS():Number {
        return _windowsSurfaceS;
    }

    public function set windowsSurfaceS(value:Number):void {
        _windowsSurfaceS = value;
    }

    public function get windowsSurfaceWE():Number {
        return _windowsSurfaceWE;
    }

    public function set windowsSurfaceWE(value:Number):void {
        _windowsSurfaceWE = value;
    }

    public function get windowsSurfaceN():Number {
        return _windowsSurfaceN;
    }

    public function set windowsSurfaceN(value:Number):void {
        _windowsSurfaceN = value;
    }

    public function get groundTemperatures():Array {
        return _groundTemperatures;
    }

    public function set groundTemperatures(value:Array):void {
        _groundTemperatures = value;
    }


    public function get temperatures():Array {
        return _temperatures;
    }

    public function set temperatures(value:Array):void {
        _temperatures = value;
    }

    public function get tAvg():Number {
        return _tAvg;
    }

    public function set tAvg(value:Number):void {
        _tAvg = value;
    }

    public function get tMin():Number {
        return _tMin;
    }

    public function set tMin(value:Number):void {
        _tMin = value;
    }

    public function get tMax():Number {
        return _tMax;
    }

    public function set tMax(value:Number):void {
        _tMax = value;
    }

    public function get tSigma():Number {
        return _tSigma;
    }

    public function set tSigma(value:Number):void {
        _tSigma = value;
    }


    public function get southInsolation():Array {
        return _southInsolation;
    }

    public function set southInsolation(value:Array):void {
        _southInsolation = value;
    }

    public function get westEastInsolation():Array {
        return _westEastInsolation;
    }

    public function set westEastInsolation(value:Array):void {
        _westEastInsolation = value;
    }

    public function get northInsolation():Array {
        return _northInsolation;
    }

    public function set northInsolation(value:Array):void {
        _northInsolation = value;
    }

    public function get groundInsolation45():Array {
        return _groundInsolation45;
    }

    public function set groundInsolation45(value:Array):void {
        _groundInsolation45 = value;
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


    public function get toPLNCurrencyExchangeRate():Number {
        return _toPLNCurrencyExchangeRate;
    }

    public function set toPLNCurrencyExchangeRate(value:Number):void {
        _toPLNCurrencyExchangeRate = value;
    }


    public function get wallHeatTransfer():Number {
        return _wallHeatTransfer;
    }

    public function set wallHeatTransfer(value:Number):void {
        _wallHeatTransfer = value;
    }

    public function get roofHeatTransfer():Number {
        return _roofHeatTransfer;
    }

    public function set roofHeatTransfer(value:Number):void {
        _roofHeatTransfer = value;
    }

    public function get floorHeatTransfer():Number {
        return _floorHeatTransfer;
    }

    public function set floorHeatTransfer(value:Number):void {
        _floorHeatTransfer = value;
    }

    public function get foundationsUValue():Number {
        return _foundationsUValue;
    }

    public function set foundationsUValue(value:Number):void {
        _foundationsUValue = value;
    }


    public function get houseStandardTypeId():String {
        return _houseStandardTypeId;
    }

    public function set houseStandardTypeId(value:String):void {
        _houseStandardTypeId = value;
    }

    public function get conversionElectricityPricePerkWh():Number {
        return _conversionElectricityPricePerkWh;
    }

    public function set conversionElectricityPricePerkWh(value:Number):void {
        _conversionElectricityPricePerkWh = value;
    }

    public function get selectedStation():String {
        return _selectedStation;
    }

    public function set selectedStation(value:String):void {
        _selectedStation = value;
    }
}
}
