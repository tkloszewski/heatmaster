/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.08.13
 * Time: 20:04
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import mx.controls.Alert;

import pl.znr.heatmaster.constants.combo.BuildingAge;
import pl.znr.heatmaster.constants.combo.DoorType;

import pl.znr.heatmaster.constants.combo.HeatingSourceType;
import pl.znr.heatmaster.constants.combo.HouseStandardType;
import pl.znr.heatmaster.constants.combo.InsulationQuality;
import pl.znr.heatmaster.constants.combo.InsulationQuality;
import pl.znr.heatmaster.constants.combo.InsulationQuality;
import pl.znr.heatmaster.constants.combo.SolarCollectorType;
import pl.znr.heatmaster.constants.combo.ThermalBridgesType;
import pl.znr.heatmaster.constants.combo.VentilationMethod;
import pl.znr.heatmaster.constants.combo.WarmWaterDistribution;
import pl.znr.heatmaster.constants.combo.WarmWaterStorage;

import pl.znr.heatmaster.core.converter.ConversionData;
import pl.znr.heatmaster.core.model.EnvironmentalData;
import pl.znr.heatmaster.core.model.HeatingSourceData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.model.InsolationData;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.core.model.RoofElement;
import pl.znr.heatmaster.core.model.SolarCollectorData;
import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.core.model.VentilationData;
import pl.znr.heatmaster.core.model.WallElement;
import pl.znr.heatmaster.core.model.WarmWaterData;
import pl.znr.heatmaster.core.model.WindowElement;

public class FlatDataContextBuilder {
    public function FlatDataContextBuilder() {
    }

    public static function buildFlatDataContext(dataContext:DataContext):FlatDataContext {
        var flatDataContext:FlatDataContext = new FlatDataContext();
        flatDataContext.lang = dataContext.lang;
        flatDataContext.selectedMonth = dataContext.selectedMonth;
        flatDataContext.includeWarmWater = dataContext.includeWarmWater;
        flatDataContext.selectedCountryRegion = dataContext.selectedCountryRegion;
        flatDataContext.countryCode = dataContext.countryCode;
        flatDataContext.selectedStation = dataContext.selectedStation;
        flatDataContext.currencyLocaleCode = dataContext.currencyLocaleCode;
        flatDataContext.localCurrency = dataContext.localCurrency;

        var conversionData:ConversionData = dataContext.conversionData;

        try {
            flatDataContext.selectedUnit = conversionData.selectedUnit;
            flatDataContext.unitName = conversionData.unitName;
            flatDataContext.shortUnitName = conversionData.shortUnitName;
            flatDataContext.conversionPricePerKwh = conversionData.pricePerKwh;
            flatDataContext.conversionWaterPricePerkWh = conversionData.waterPricePerkWh;
            flatDataContext.conversionElectricityPricePerkWh = conversionData.electricityPricePerKwh;
            flatDataContext.houseHeatingEfficiency = conversionData.houseHeatingEfficiency;
            flatDataContext.warmWaterHeatingEfficiency = conversionData.warmWaterHeatingEfficiency;
            flatDataContext.conversionDataFinalToPrimaryCoefficient = conversionData.finalToPrimaryCoefficient;
            flatDataContext.conversionDataWarmWaterFinalToPrimaryCoefficient = conversionData.warmWaterFinalToPrimaryCoefficient;
            flatDataContext.conversionDataEmissionCoefficient = conversionData.emissionCoefficient;
            flatDataContext.conversionDataWaterEmissionCoefficient = conversionData.waterEmissionCoefficient;
            flatDataContext.toPLNCurrencyExchangeRate = conversionData.toPLNCurrencyExchangeRate;
        } catch (e:Error) {
            Alert.show("Error writing conversionData");
        }


        var heatingData:HeatingSourceData = dataContext.heatingData;

        try {
            flatDataContext.heatingTypeId = heatingData.heatingType.getId();
            flatDataContext.heatingEfficiency = heatingData.heatingEfficiency;
            flatDataContext.pricePerkWh = heatingData.pricePerkWh;
            flatDataContext.naturalUnitPrice = heatingData.naturalUnitPrice;
            flatDataContext.waterHeatingTypeId = heatingData.waterHeatingType.getId();
            flatDataContext.waterHeatingEfficiency = heatingData.waterHeatingEfficiency;
            flatDataContext.priceWaterPerkWh = heatingData.priceWaterPerkWh;
            flatDataContext.finalToPrimaryCoefficient = heatingData.finalToPrimaryCoefficient;
            flatDataContext.warmWaterFinalToPrimaryCoefficient = heatingData.warmWaterFinalToPrimaryCoefficient;
            flatDataContext.emissionCoefficient = heatingData.emissionCoefficient;
            flatDataContext.waterEmissionCoefficient = heatingData.waterEmissionCoefficient;
        } catch (e:Error) {
            Alert.show("Error writing heatingData: " + e.message)
        }

        var solarCollectorData:SolarCollectorData = dataContext.solarCollectorData;

        try {
            flatDataContext.collectorTypeId = solarCollectorData.collectorType.getId();
            flatDataContext.surface = solarCollectorData.surface;
            flatDataContext.count = solarCollectorData.count;
        } catch (e:Error) {
            Alert.show("Error writing solarCollectorData: " + e.message);
        }


        var houseData:HouseData = dataContext.houseData;

        try {
            flatDataContext.houseType = houseData.houseType;
            flatDataContext.buildingAgeId = houseData.buildingAge.getId();
            flatDataContext.doorTypeId = houseData.doorType.getId();
            flatDataContext.personNumber = houseData.personNumber;
            flatDataContext.foundationsEnabled = houseData.foundationsEnabled;
            flatDataContext.tIn = houseData.tIn;
            flatDataContext.foundationsUValue = houseData.foundationsUValue;
            flatDataContext.houseStandardTypeId = houseData.standardType.getId();
        } catch (e:Error) {
            Alert.show("Error writing generalHouseData: " + e.message);
        }


        var warmWaterData:WarmWaterData = houseData.warmWaterData;

        try {
            flatDataContext.warmWaterDistributionId = warmWaterData.warmWaterDistribution.getId();
            flatDataContext.warmWaterStorageId = warmWaterData.warmWaterStorage.getId();
            //flatDataContext.warmWaterHeatingSourceTypeID = warmWaterData.heatingSourceType.getId();
            flatDataContext.distributorEfficiency = warmWaterData.distributorEfficiency;
            flatDataContext.storeEfficiency = warmWaterData.storeEfficiency;
            flatDataContext.consumptionIntensity = warmWaterData.consumptionIntensity;
        } catch (e:Error) {
            Alert.show("Error writing warmWaterData: " + e.message);
        }


        var ventilationData:VentilationData = houseData.ventilationData;

        try {
            flatDataContext.gwcSet = ventilationData.gwcSet;
            flatDataContext.ventilationMethod = ventilationData.ventilationMethodObject.type;
            flatDataContext.ventilationFreq = ventilationData.ventilationFreq;
            flatDataContext.recuperateEfficiency = ventilationData.ventilationMethodObject.efficiency;
            flatDataContext.co2Sensor = ventilationData.co2Sensor;
            flatDataContext.tightness = ventilationData.tightness;
        } catch (e:Error) {
            Alert.show("Error wring ventilationData: " + e.message);
        }


        var wallElement:InsulationElement = houseData.wallElement;

        try {
            flatDataContext.wallWidth = wallElement.width;
            flatDataContext.wallUValue = wallElement.uValue;
            //flatDataContext.wallInsulationQualityId = wallElement.insulationQuality.getId();
            flatDataContext.wallHeatTransfer = wallElement.materialHeatTransfer;
        } catch (e:Error) {
            Alert.show("Error writing wallElement: " + e.message);
        }


        var roofElement:InsulationElement = houseData.roofElement;

        try {
            flatDataContext.roofWidth = roofElement.width;
            flatDataContext.roofUValue = roofElement.uValue;
            //flatDataContext.roofInsulationQualityId = roofElement.insulationQuality.getId();
            flatDataContext.roofHeatTransfer = roofElement.materialHeatTransfer;
        } catch (e:Error) {
            Alert.show("Error writing roofElement: " + e.message);
        }


        var floorElement:InsulationElement = houseData.floorElement;

        try {
            flatDataContext.floorWidth = floorElement.width;
            flatDataContext.floorUValue = floorElement.uValue;
           // flatDataContext.floorInsulationQualityId = floorElement.insulationQuality.getId();
            flatDataContext.floorHeatTransfer = floorElement.materialHeatTransfer;
        } catch (e:Error) {
            Alert.show("Error writing floorElement: " + e.message);
        }


        var windowElement:WindowElement = houseData.windowElement;

        try {
            flatDataContext.windowsUValue = windowElement.uValue;
            flatDataContext.windowType = windowElement.windowType;
            flatDataContext.winGain = windowElement.winGain;
            flatDataContext.shutters = windowElement.shutters;
            flatDataContext.thermalBridgesId = windowElement.thermalBridgesType.getId();
        } catch (e:Error) {
            Alert.show("Error writing windowsElement: " + e.message);
        }


        var surfaceData:SurfaceData = houseData.surfaceData;

        try {
            flatDataContext.floorCount = surfaceData.floorCount;
            flatDataContext.floorHeight = surfaceData.floorHeight;
            flatDataContext.totalSurface = surfaceData.totalSurface;
            flatDataContext.floorArea = surfaceData.floorArea;
            flatDataContext.floorSurface = surfaceData.floorSurface;
            flatDataContext.floorSurfaceC = surfaceData.floorSurfaceC;
            flatDataContext.floorSurfaceR = surfaceData.floorSurfaceR;
            flatDataContext.roofSurface = surfaceData.roofSurface;
            flatDataContext.wallSurface = surfaceData.wallSurface;
            flatDataContext.windowsSurface = surfaceData.windowsSurface;
            flatDataContext.windowsSurfaceS = surfaceData.windowsSurfaceS;
            flatDataContext.windowsSurfaceWE = surfaceData.windowsSurfaceWE;
            flatDataContext.windowsSurfaceN = surfaceData.windowsSurfaceN;
        } catch (e:Error) {
            Alert.show("Error writing surfaceElement: " + e.message);
        }


        var environmentalData:EnvironmentalData = dataContext.environmentalData;
        var insolationData:InsolationData = environmentalData.insolationData;

        try {
            flatDataContext.southInsolation = insolationData.southInsolation.slice();
            flatDataContext.westEastInsolation = insolationData.westEastInsolation.slice();
            flatDataContext.northInsolation = insolationData.northInsolation.slice();
            flatDataContext.groundInsolation45 = insolationData.groundInsolation45.slice();
        } catch (e:Error) {
            Alert.show("Error writing insolationElement: " + e.message);
        }

        //other environmentalData
        try {
            flatDataContext.temperatures = environmentalData.temperatures.slice();
            flatDataContext.groundTemperatures = environmentalData.groundTemperatures.slice();
            flatDataContext.tAvg = environmentalData.tAvg;
            flatDataContext.tMin = environmentalData.tMin;
            flatDataContext.tMax = environmentalData.tMax;
            flatDataContext.tSigma = environmentalData.tSigma;
        } catch (e:Error) {
            Alert.show("Error writing environmentalData: " + e.message);
        }

        return flatDataContext;
    }

    public static function buildDataContext(flatDataContext:FlatDataContext):DataContext {
        var dataContext:DataContext = new DataContext();
        dataContext.lang = flatDataContext.lang;
        dataContext.selectedMonth = flatDataContext.selectedMonth;
        dataContext.includeWarmWater = flatDataContext.includeWarmWater;
        dataContext.selectedCountryRegion = flatDataContext.selectedCountryRegion;
        dataContext.selectedStation = flatDataContext.selectedStation;
        dataContext.countryCode = flatDataContext.countryCode;
        dataContext.currencyLocaleCode = flatDataContext.currencyLocaleCode;
        dataContext.localCurrency = flatDataContext.localCurrency;

        var conversionData:ConversionData = dataContext.conversionData;

        try {
            conversionData.selectedUnit = flatDataContext.selectedUnit;
            conversionData.unitName = flatDataContext.unitName;
            conversionData.shortUnitName = flatDataContext.shortUnitName;
            conversionData.pricePerKwh = flatDataContext.conversionPricePerKwh;
            conversionData.waterPricePerkWh = flatDataContext.conversionWaterPricePerkWh;
            conversionData.electricityPricePerKwh = flatDataContext.conversionElectricityPricePerkWh;
            conversionData.houseHeatingEfficiency = flatDataContext.houseHeatingEfficiency;
            conversionData.warmWaterHeatingEfficiency = flatDataContext.warmWaterHeatingEfficiency;
            conversionData.finalToPrimaryCoefficient = flatDataContext.conversionDataFinalToPrimaryCoefficient;
            conversionData.warmWaterFinalToPrimaryCoefficient = flatDataContext.conversionDataWarmWaterFinalToPrimaryCoefficient;
            conversionData.emissionCoefficient = flatDataContext.conversionDataEmissionCoefficient;
            conversionData.waterEmissionCoefficient = flatDataContext.conversionDataWaterEmissionCoefficient;
            conversionData.toPLNCurrencyExchangeRate = flatDataContext.toPLNCurrencyExchangeRate;
        } catch (e:Error) {
            Alert.show("Error building conversionData: " + e.message);
        }


        var heatingData:HeatingSourceData = new HeatingSourceData();

        try {
            heatingData.heatingType = HeatingSourceType.getHeatingSourceTypeById(flatDataContext.heatingTypeId);
            heatingData.heatingEfficiency = flatDataContext.heatingEfficiency;
            heatingData.pricePerkWh = flatDataContext.pricePerkWh;
            heatingData.naturalUnitPrice = flatDataContext.naturalUnitPrice;
            heatingData.waterHeatingType = HeatingSourceType.getHeatingSourceTypeById(flatDataContext.waterHeatingTypeId);
            heatingData.waterHeatingEfficiency = flatDataContext.waterHeatingEfficiency;
            heatingData.priceWaterPerkWh = flatDataContext.priceWaterPerkWh;
            heatingData.finalToPrimaryCoefficient = flatDataContext.finalToPrimaryCoefficient;
            heatingData.warmWaterFinalToPrimaryCoefficient = flatDataContext.warmWaterFinalToPrimaryCoefficient;
            heatingData.emissionCoefficient = flatDataContext.emissionCoefficient;
            heatingData.waterEmissionCoefficient = flatDataContext.waterEmissionCoefficient;
        } catch (e:Error) {
            Alert.show("Error building heatingData: " + e.message);
        }

        dataContext.heatingData = heatingData;


        var solarCollectorData:SolarCollectorData = new SolarCollectorData();

        try {
            solarCollectorData.collectorType = SolarCollectorType.getSolarCollectorTypeById(flatDataContext.collectorTypeId);
            solarCollectorData.surface = flatDataContext.surface;
            solarCollectorData.count = flatDataContext.count;
        } catch (e:Error) {
            Alert.show("Error building solarCollectorData: " + solarCollectorData);
        }

        dataContext.solarCollectorData = solarCollectorData;


        var houseData:HouseData = dataContext.houseData;

        try {
            houseData.houseType = flatDataContext.houseType;
            houseData.buildingAge = BuildingAge.getBuildingAgeById(flatDataContext.buildingAgeId);
            houseData.doorType = DoorType.getDoorTypeById(flatDataContext.doorTypeId);
            houseData.personNumber = flatDataContext.personNumber;
            houseData.foundationsEnabled = flatDataContext.foundationsEnabled;
            houseData.foundationsUValue = flatDataContext.foundationsUValue;
            houseData.tIn = flatDataContext.tIn;
            houseData.standardType = HouseStandardType.getHouseStandardTypeById(flatDataContext.houseStandardTypeId);
        } catch (e:Error) {
            Alert.show("Error building generalHouseData: " + e.message)
        }

        var warmWaterData:WarmWaterData = houseData.warmWaterData;

        try {
            warmWaterData.warmWaterDistribution = WarmWaterDistribution.getWarmWaterDistributionById(flatDataContext.warmWaterDistributionId);
            warmWaterData.warmWaterStorage = WarmWaterStorage.getWarmWaterStorageById(flatDataContext.warmWaterStorageId);
            //warmWaterData.heatingSourceType = flatDataContext.warmWaterHeatingSourceTypeID.getId();
            warmWaterData.distributorEfficiency = flatDataContext.distributorEfficiency;
            warmWaterData.storeEfficiency = flatDataContext.storeEfficiency;
            warmWaterData.consumptionIntensity = flatDataContext.consumptionIntensity;
        } catch (e:Error) {
            Alert.show("Error building warmWaterData: " + e.message);
        }


        var ventilationData:VentilationData = houseData.ventilationData;

        try {
            ventilationData.gwcSet = flatDataContext.gwcSet;
            ventilationData.ventilationMethodObject = VentilationMethod.getVentilationMethodForEfficiency(flatDataContext.recuperateEfficiency);
            ventilationData.ventilationFreq = flatDataContext.ventilationFreq;
            ventilationData.co2Sensor = flatDataContext.co2Sensor;
            ventilationData.tightness = flatDataContext.tightness;
        } catch (e:Error) {
            Alert.show("Error building ventilationData: " + ventilationData);
        }


        var wallElement:InsulationElement = new InsulationElement();

        try {
            wallElement.width = flatDataContext.wallWidth;
            wallElement.uValue = flatDataContext.wallUValue;
            wallElement.materialHeatTransfer = flatDataContext.wallHeatTransfer;
        } catch (e:Error) {
            Alert.show("Error building wallElement: " + e.message);
        }

        houseData.wallElement = wallElement;


        var roofElement:InsulationElement = new InsulationElement();

        try {
            roofElement.width = flatDataContext.roofWidth;
            roofElement.uValue = flatDataContext.roofUValue;
            roofElement.materialHeatTransfer = flatDataContext.roofHeatTransfer;
        } catch (e:Error) {
            Alert.show("Error building roofElement: " + e.message);
        }

        houseData.roofElement = roofElement;


        var floorElement:InsulationElement = new InsulationElement();

        try {
            floorElement.width = flatDataContext.floorWidth;
            floorElement.uValue = flatDataContext.floorUValue;
            floorElement.materialHeatTransfer = flatDataContext.floorHeatTransfer;
        } catch (e:Error) {
            Alert.show("Error building floorElement: " + e.message);
        }

        houseData.floorElement = floorElement;


        var windowElement:WindowElement = new WindowElement(flatDataContext.windowsUValue);

        try {
            windowElement.uValue = flatDataContext.windowsUValue;
            windowElement.windowType = flatDataContext.windowType;
            windowElement.winGain = flatDataContext.winGain;
            windowElement.shutters = flatDataContext.shutters;
            windowElement.thermalBridgesType = ThermalBridgesType.getThermalBridgesTypeById(flatDataContext.thermalBridgesId);
        } catch (e:Error) {
            Alert.show("Error building windowElement: " + e.message);
        }

        houseData.windowElement = windowElement;


        var surfaceData:SurfaceData = new SurfaceData(flatDataContext.floorCount,flatDataContext.floorHeight,flatDataContext.totalSurface);

        try {
            surfaceData.floorArea = flatDataContext.floorArea;
            surfaceData.floorSurface = flatDataContext.floorSurface;
            surfaceData.floorSurfaceC = flatDataContext.floorSurfaceC;
            surfaceData.floorSurfaceR = flatDataContext.floorSurfaceR;
            surfaceData.roofSurface = flatDataContext.roofSurface;
            surfaceData.wallSurface = flatDataContext.wallSurface;
            surfaceData.windowsSurface = flatDataContext.windowsSurface;
            surfaceData.windowsSurfaceS = flatDataContext.windowsSurfaceS;
            surfaceData.windowsSurfaceWE = flatDataContext.windowsSurfaceWE;
            surfaceData.windowsSurfaceN = flatDataContext.windowsSurfaceN;
        } catch (e:Error) {
            Alert.show("Error building surfaceData: " + e.message);
        }

        houseData.surfaceData = surfaceData;


        var environmentalData:EnvironmentalData = dataContext.environmentalData;
        var insolationData:InsolationData = new InsolationData();

        try {
            insolationData.southInsolation = flatDataContext.southInsolation.slice();
            insolationData.westEastInsolation = flatDataContext.westEastInsolation.slice();
            insolationData.northInsolation = flatDataContext.northInsolation.slice();
            insolationData.groundInsolation45 = flatDataContext.groundInsolation45.slice();
        } catch (e:Error) {
            Alert.show("Error building insolationData: " + e.message);
        }

        environmentalData.insolationData = insolationData;


        try {
            environmentalData.temperatures = flatDataContext.temperatures.slice();
            environmentalData.groundTemperatures = flatDataContext.groundTemperatures.slice();
            environmentalData.tAvg = flatDataContext.tAvg;
            environmentalData.tMin = flatDataContext.tMin;
            environmentalData.tMax = flatDataContext.tMax;
            environmentalData.tSigma = flatDataContext.tSigma;
        } catch (e:Error) {
            Alert.show("Error building environmentalData: " + e.message);
        }

        return dataContext;
    }
}
}
