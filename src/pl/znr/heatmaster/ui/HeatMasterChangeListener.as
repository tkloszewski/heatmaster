/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 16.06.13
 * Time: 16:03
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui {
import avmplus.accessorXml;

import mx.collections.ArrayList;

import mx.controls.Alert;

import pl.znr.heatmaster.HeatMaster;

import pl.znr.heatmaster.config.CountryItem;
import pl.znr.heatmaster.config.CountryItemHelper;
import pl.znr.heatmaster.config.HeatMasterConfigurationReader;
import pl.znr.heatmaster.config.IEnvironmentalDataConfig;
import pl.znr.heatmaster.config.RegionItem;
import pl.znr.heatmaster.config.StationItem;

import pl.znr.heatmaster.constants.combo.BuildingAge;

import pl.znr.heatmaster.constants.combo.ConversionUnits;
import pl.znr.heatmaster.constants.combo.DoorType;
import pl.znr.heatmaster.constants.combo.FoundationsType;
import pl.znr.heatmaster.constants.combo.HouseStandardType;

import pl.znr.heatmaster.constants.combo.InsulationElementType;
import pl.znr.heatmaster.constants.combo.ThermalBridgesType;
import pl.znr.heatmaster.constants.combo.VentilationFrequency;
import pl.znr.heatmaster.constants.combo.VentilationMethod;
import pl.znr.heatmaster.core.CachedDataContextManager;
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.HeatMasterController;
import pl.znr.heatmaster.core.HouseStandardTypeContext;
import pl.znr.heatmaster.core.IBuildingAgeChangeListener;
import pl.znr.heatmaster.core.converter.ConversionData;
import pl.znr.heatmaster.core.converter.ConverterHelper;
import pl.znr.heatmaster.core.model.EnvironmentalData;
import pl.znr.heatmaster.core.model.FloorElement;
import pl.znr.heatmaster.core.model.HeatingSourceData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.model.HouseStandardTypeModel;
import pl.znr.heatmaster.core.model.InsolationData;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.core.model.RoofElement;
import pl.znr.heatmaster.core.model.SolarCollectorData;
import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.core.model.WallElement;
import pl.znr.heatmaster.core.model.WarmWaterData;
import pl.znr.heatmaster.core.model.WindowElement;
import pl.znr.heatmaster.ui.builder.prepare.EnvironmentalDataPreparer;
import pl.znr.heatmaster.ui.builder.prepare.EnvironmentalDataPreparer;
import pl.znr.heatmaster.ui.components.EnergyMeter;
import pl.znr.heatmaster.ui.components.panel.HousePanel;
import pl.znr.heatmaster.ui.components.HouseStandardChangeListener;
import pl.znr.heatmaster.ui.components.IHeatMasterListenerAware;
import pl.znr.heatmaster.ui.components.popup.HeatingPopup;
import pl.znr.heatmaster.ui.components.popup.HousePopup;
import pl.znr.heatmaster.util.HouseStandardModelContainer;

public class HeatMasterChangeListener {

    private var heatMasterController:HeatMasterController;
    private var cacheManager:CachedDataContextManager;
    private var housePanel:HousePanel;
    private var heatingPopup:HeatingPopup;
    private var housePopup:HousePopup;
    private var energyMeter:EnergyMeter;
    private var configurationReader:HeatMasterConfigurationReader;

    private var buildingAgeChangeListeners:ArrayList = new ArrayList();
    private var houseStandardChangeListeners:ArrayList = new ArrayList();

    private var cacheEnabled:Boolean = false;

    public function HeatMasterChangeListener() {
    }

    public function setHeatMasterController(hmController:HeatMasterController):void {
        this.heatMasterController = hmController;
    }

    public function setConfigurationReader(confReader:HeatMasterConfigurationReader):void {
        this.configurationReader = confReader;
    }

    public function setHousePanel(housePanel:HousePanel):void {
        this.housePanel = housePanel;
    }

    public function setHeatingPopup(heatingPopup:HeatingPopup):void {
        this.heatingPopup = heatingPopup;
    }

    public function setHousePopup(housePopup:HousePopup):void {
        this.housePopup = housePopup;
    }

    public function setEnergyMeter(energyMeter:EnergyMeter):void {
        this.energyMeter = energyMeter;
    }

    public function addBuildingChangeListener(buildingAgeListener:IBuildingAgeChangeListener):void {
        buildingAgeChangeListeners.addItem(buildingAgeListener);
    }

    public function addHouseStandardChangeListener(houseStandardChangeListener:HouseStandardChangeListener):void {

        var placeIndex:int = houseStandardChangeListeners.length;
        for(var i:int = 0; i < houseStandardChangeListeners.length;i++){
            var standardChangeListener:HouseStandardChangeListener = houseStandardChangeListeners.getItemAt(i) as HouseStandardChangeListener;
            if(standardChangeListener.getOrder() >= houseStandardChangeListener.getOrder()){
               placeIndex = i;
               break;
            }
        }

        houseStandardChangeListeners.addItemAt(houseStandardChangeListener,placeIndex);
    }

    public function buildingAgeChanged(buildingAge:BuildingAge):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.buildingAge = buildingAge;
        for(var i:int = 0; i < buildingAgeChangeListeners.length;i++){
            var buildingAgeListener:IBuildingAgeChangeListener = buildingAgeChangeListeners.getItemAt(i) as IBuildingAgeChangeListener;
            buildingAgeListener.buildingAgeChanged(buildingAge);
        }
    }

    public function warmWaterDataChanged(warmWaterData:WarmWaterData):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.warmWaterData = warmWaterData;
        heatMasterController.calculate();
    }

    public function storeAndDistributeEfficiencyChanged(warmWaterData:WarmWaterData):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.warmWaterData.storeEfficiency = warmWaterData.storeEfficiency;
        dataContext.houseData.warmWaterData.distributorEfficiency = warmWaterData.distributorEfficiency;
        dataContext.houseData.warmWaterData.warmWaterDistribution = warmWaterData.warmWaterDistribution;
        dataContext.houseData.warmWaterData.warmWaterStorage = warmWaterData.warmWaterStorage;
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function warmWaterConsumptionChanged(intensity:Number):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.warmWaterData.consumptionIntensity = intensity;
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function solarCollectorsDataChanged(solarCollectorData:SolarCollectorData):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.solarCollectorData = solarCollectorData;
        housePanel.collectorDataChanged(solarCollectorData);
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function  languageChanged(language:String):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.lang = language;
        writeCache(dataContext);
    }

    public function houseStandardChanged(standardType:HouseStandardType):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        var houseData:HouseData = dataContext.houseData;
        houseData.standardType = standardType;

        dataContext = applyHouseStandardChanged(dataContext,standardType);

        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function applyHouseStandardChanged(dataContext:DataContext,standardType:HouseStandardType):DataContext {
        var houseStandardTypeModel:HouseStandardTypeModel = HouseStandardModelContainer.getHouseStandardTypeModelForStandardType(standardType);
        var houseStandardContext:HouseStandardTypeContext = new HouseStandardTypeContext(houseStandardTypeModel);

        for(var i:int = 0; i < houseStandardChangeListeners.length;i++){
            var standardChangeListener:HouseStandardChangeListener = houseStandardChangeListeners.getItemAt(i) as HouseStandardChangeListener;
            standardChangeListener.standardChanged(dataContext,houseStandardContext);
        }

        return dataContext;
    }

    public function countryChanged(countryItem:CountryItem,regionItem:RegionItem):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        var conversionData:ConversionData = dataContext.conversionData;
        var envData:EnvironmentalData = dataContext.environmentalData;
        var conversionUnit:int = conversionData.selectedUnit;


        if (regionItem != null) {
            dataContext.selectedCountryRegion = regionItem.code;
            dataContext.environmentalData = EnvironmentalDataPreparer.prepareFromConfig(dataContext.environmentalData,regionItem);
            dataContext.selectedStation = null;
        }
        else {
            dataContext.selectedCountryRegion = countryItem.code;
            dataContext.countryCode = countryItem.code;
            if(countryItem.stationsConfig != null){
                dataContext.selectedStation = countryItem.stationsConfig.defaultStation.code;
                dataContext.environmentalData = EnvironmentalDataPreparer.prepareFromConfig(dataContext.environmentalData,countryItem.stationsConfig.defaultStation);
            }
            else {
                dataContext.selectedStation = null;
                dataContext.environmentalData = EnvironmentalDataPreparer.prepareFromConfig(dataContext.environmentalData,countryItem);
            }
        }

        var localCurrency:Boolean = ConversionUnits.isLocalCurrencyCostUnit(conversionUnit);

        if(localCurrency){
            var shortUnitName:String = countryItem.currencyLocaleCode + ".";
            shortUnitName += ConversionUnits.isYearUnit(conversionUnit) ? 'year_cost' : 'month_cost';
            conversionData.shortUnitName = shortUnitName;
            dataContext.currencyLocaleCode = countryItem.currencyLocaleCode;
        }

        heatingPopup.configChanged(countryItem,dataContext.localCurrency);
        energyMeter.countryChanged(countryItem);
        energyMeter.environmentalDataChanged(dataContext.environmentalData);

        conversionData.pricePerKwh = heatingPopup.getConfigAppliedHeatingPrice();
        conversionData.waterPricePerkWh = heatingPopup.getConfigAppliedWarmWaterPrice();
        conversionData.electricityPricePerKwh = CountryItemHelper.getCountryElectricityPrice(countryItem,localCurrency);

        conversionData.toPLNCurrencyExchangeRate = ConverterHelper.calcToPLNExchangeRate(conversionData.selectedUnit,configurationReader.getEuroToPLNExchangeRate(),countryItem.currencyExchangeRate);

        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function regionChanged(regionItem:RegionItem):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.selectedCountryRegion = regionItem.code;
        dataContext.environmentalData = EnvironmentalDataPreparer.prepareFromConfig(dataContext.environmentalData,regionItem);

        energyMeter.environmentalDataChanged(dataContext.environmentalData);

        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function stationChanged(stationItem:StationItem,notifyHousePopup:Boolean = false){
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.selectedStation = stationItem.code;
        dataContext.environmentalData = EnvironmentalDataPreparer.prepareFromConfig(dataContext.environmentalData,stationItem);

        energyMeter.environmentalDataChanged(dataContext.environmentalData);
        if(notifyHousePopup){
           housePopup.notifyStationChanged(stationItem);
        }

        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function monthChanged(month:int):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.selectedMonth = month;
        heatMasterController.monthChanged(month);
        writeCache(dataContext);
    }

    public function personNumberChanged(persons:Number):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.personNumber = persons;
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function houseTypeChanged(houseType:int,surfaceData:SurfaceData):void {
        try {
            var dataContext:DataContext = heatMasterController.getDataContext();
            dataContext.houseData.houseType = houseType;
            dataContext.houseData.surfaceData = surfaceData;
            try {
                var warmWaterData:WarmWaterData = heatingPopup.houseTypeChanged(houseType,dataContext.houseData.standardType);
                dataContext.houseData.warmWaterData.storeEfficiency = warmWaterData.storeEfficiency;
                dataContext.houseData.warmWaterData.distributorEfficiency = warmWaterData.distributorEfficiency;
                dataContext.houseData.warmWaterData.warmWaterDistribution = warmWaterData.warmWaterDistribution;
                dataContext.houseData.warmWaterData.warmWaterStorage = warmWaterData.warmWaterStorage;

            } catch (e:Error) {
                Alert.show("Error in heatingPopup.houseTypeChanged: " + e.message);
                trace(e.getStackTrace());
            }

            housePanel.houseTypeChanged(houseType);
            heatMasterController.calculate();

            writeCache(dataContext);
        } catch (e:Error) {
            Alert.show("House type changed error: ", e.getStackTrace());
        }
    }

    public function doorTypeChanged(doorType:DoorType):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.doorType = doorType;
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function mainHouseDataChanged(surfaceData:SurfaceData):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.surfaceData = surfaceData;
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function environmentalDataChanged(data:EnvironmentalData):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.environmentalData = data;
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function ventilationFrequencyChanged(ventFreq:int):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.ventilationData.ventilationFreq = ventFreq;
        var ventGravitational:Boolean = dataContext.houseData.ventilationData.ventilationMethodObject.type == VentilationMethod.GRAVITATIONAL;

        if(ventGravitational && ventFreq == VentilationFrequency.OFTEN || ventFreq == VentilationFrequency.VERY_OFTEN ||
                ventFreq == VentilationFrequency.NON_STOP){
            housePanel.setOpenWindowVisible(true)
        }
        else {
            housePanel.setOpenWindowVisible(false);
        }

        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function ventilationMethodChanged(ventMethod:VentilationMethod,carbonDioxideSensorEnabled:Boolean):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.ventilationData.ventilationMethodObject = ventMethod;

        dataContext.houseData.ventilationData.co2Sensor = carbonDioxideSensorEnabled;

        var ventGravitational:Boolean = ventMethod.type == VentilationMethod.GRAVITATIONAL;
        var ventFreq:int = dataContext.houseData.ventilationData.ventilationFreq;

        housePanel.setRecuperatorVisible(ventMethod.type == VentilationMethod.MECHANICAL);
        housePanel.ventilationTypeChanged(ventMethod.type == VentilationMethod.MECHANICAL);

        if(ventGravitational && (ventFreq == VentilationFrequency.OFTEN || ventFreq == VentilationFrequency.VERY_OFTEN ||
                ventFreq == VentilationFrequency.NON_STOP)){
            housePanel.setOpenWindowVisible(true)
        }
        else {
            housePanel.setOpenWindowVisible(false);
        }


        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function foundationsChanged(enabled:Boolean,uValue:Number,type:int,insulationElement:InsulationElement):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.foundationsEnabled = enabled;
        dataContext.houseData.foundationsUValue = uValue;
        housePanel.foundationsChanged(enabled,enabled);
        housePanel.insulationElementChanged(insulationElement,InsulationElementType.FLOOR,type);
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function sensorCO2Enabled(enabled:Boolean):void{
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.ventilationData.co2Sensor = enabled;
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function groundHeatExchangerEnabled(enabled:Boolean):void {
        housePanel.groundHeatExchangerChanged(enabled);
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.ventilationData.gwcSet = enabled;
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function tightnessChanged(tightness:Number):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.houseData.ventilationData.tightness = tightness;
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function insulationElementChanged(insulationElement:InsulationElement,type:int,calculationRequired:Boolean = true,writeCacheRequired:Boolean = true,foundationsType:int = FoundationsType.TRADITIONAL_INSULATED):void {
        var dataContext:DataContext =  heatMasterController.getDataContext();
        if(type == InsulationElementType.WALL){
            dataContext.houseData.wallElement = insulationElement;
        }
        else if(type == InsulationElementType.FLOOR){
            dataContext.houseData.floorElement = insulationElement;
        }
        else if(type == InsulationElementType.ROOF){
            dataContext.houseData.roofElement = insulationElement;
        }

        housePanel.insulationElementChanged(insulationElement,type,foundationsType);

        if (calculationRequired) {
            heatMasterController.calculate();
        }
        if (writeCacheRequired) {
            writeCache(dataContext);
        }
    }

    public function windowElementChanged(windowElement:WindowElement):void {
        var dataContext:DataContext =  heatMasterController.getDataContext();
        dataContext.houseData.windowElement = windowElement;

        housePanel.setShuttersVisible(windowElement.shutters);
        housePanel.setBridgesDisabled(!(windowElement.thermalBridgesType == ThermalBridgesType.MAX));

        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function inHouseTempChanged(temp:int):void {
        var dataContext:DataContext =  heatMasterController.getDataContext();
        dataContext.houseData.tIn = temp;
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function unitChanged(newUnit:int,unitName:String,shortUnitName:String):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        var conversionData:ConversionData = heatMasterController.getDataContext().conversionData;
        var oldUnit:int = conversionData.selectedUnit;
        var conversionNotRequired:Boolean =
                (ConversionUnits.isKiloWattsUnit(newUnit) && ConversionUnits.isKiloWattsUnit(oldUnit))
                        || (ConversionUnits.isLocalCurrencyCostUnit(newUnit) && ConversionUnits.isLocalCurrencyCostUnit(oldUnit))
                        || (ConversionUnits.isEuroCostUnit(newUnit) && ConversionUnits.isEuroCostUnit(oldUnit));

        var countryItem:CountryItem = housePopup.getSelectedCountry();

        if(!conversionNotRequired && ConversionUnits.isCostUnit(newUnit)){
            if(ConversionUnits.isLocalCurrencyCostUnit(newUnit)){
                dataContext.currencyLocaleCode = countryItem.currencyLocaleCode;
                dataContext.localCurrency = true;
            }
            else {
                dataContext.currencyLocaleCode = HeatMaster.CURRENCY_EURO_LOCALE_CODE;
                dataContext.localCurrency = false;
            }

            heatingPopup.configChanged(countryItem,dataContext.localCurrency);

            conversionData.pricePerKwh = heatingPopup.getConfigAppliedHeatingPrice();
            conversionData.waterPricePerkWh = heatingPopup.getConfigAppliedWarmWaterPrice();
            conversionData.electricityPricePerKwh = CountryItemHelper.getCountryElectricityPrice(countryItem,dataContext.localCurrency);
        }

        conversionData.selectedUnit = newUnit;
        conversionData.unitName = unitName;
        conversionData.shortUnitName = shortUnitName;
        conversionData.toPLNCurrencyExchangeRate = ConverterHelper.calcToPLNExchangeRate(newUnit,configurationReader.getEuroToPLNExchangeRate(),countryItem.currencyExchangeRate);

        heatMasterController.conversionDataChanged(!conversionNotRequired);
        writeCache(heatMasterController.getDataContext());
    }

    public function heatingDataChanged(heatingSourceData:HeatingSourceData):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        var conversionData:ConversionData = dataContext.conversionData;

        dataContext.heatingData = heatingSourceData;

        conversionData.pricePerKwh = heatingSourceData.pricePerkWh;
        conversionData.waterPricePerkWh = heatingSourceData.priceWaterPerkWh;
        conversionData.houseHeatingEfficiency = heatingSourceData.heatingEfficiency/100;
        conversionData.warmWaterHeatingEfficiency = heatingSourceData.waterHeatingEfficiency/100;
        conversionData.finalToPrimaryCoefficient = heatingSourceData.finalToPrimaryCoefficient;
        conversionData.warmWaterFinalToPrimaryCoefficient = heatingSourceData.warmWaterFinalToPrimaryCoefficient;
        conversionData.emissionCoefficient = heatingSourceData.emissionCoefficient;
        conversionData.waterEmissionCoefficient = heatingSourceData.waterEmissionCoefficient;
        heatMasterController.conversionDataChanged(true);
        writeCache(dataContext);
    }

    public function setConversionData(heatingSourceData:HeatingSourceData):void {
        var conversionData:ConversionData = heatMasterController.getDataContext().conversionData;
        conversionData.pricePerKwh = heatingSourceData.pricePerkWh;
        conversionData.waterPricePerkWh = heatingSourceData.priceWaterPerkWh;
        conversionData.houseHeatingEfficiency = heatingSourceData.heatingEfficiency/100;
        conversionData.warmWaterHeatingEfficiency = heatingSourceData.waterHeatingEfficiency/100;
        conversionData.finalToPrimaryCoefficient = heatingSourceData.finalToPrimaryCoefficient;
        conversionData.warmWaterFinalToPrimaryCoefficient = heatingSourceData.warmWaterFinalToPrimaryCoefficient;
        conversionData.emissionCoefficient = heatingSourceData.emissionCoefficient;
        conversionData.waterEmissionCoefficient = heatingSourceData.waterEmissionCoefficient;
        writeCache(heatMasterController.getDataContext());
    }


    public function initVentilationMethod(ventMethod:VentilationMethod):void{
        housePanel.ventilationTypeChanged(ventMethod.type == VentilationMethod.MECHANICAL);
    }

    public function initInsulationElementChanged(insulationElement:InsulationElement,type:int,foundationsType:int):void {
        housePanel.insulationElementChanged(insulationElement,type,foundationsType);
    }

    public function includeWarmWaterChanged(included:Boolean):void {
        var dataContext:DataContext = heatMasterController.getDataContext();
        dataContext.includeWarmWater = included;
        housePanel.setCollectorAndWarmWaterComponentsVisibility(included);
        heatMasterController.calculate();
        writeCache(dataContext);
    }

    public function setCacheManager(value:CachedDataContextManager):void {
        this.cacheManager = value;
    }

    public function setCacheEnabled(cacheReady:Boolean):void {
        this.cacheEnabled = cacheReady;
    }

    public function getDataContext():DataContext {
        return heatMasterController.getDataContext();
    }

    private function writeCache(dataContext:DataContext):void {
        if(cacheEnabled){
            cacheManager.writeCache(dataContext);
        }
    }
}
}
