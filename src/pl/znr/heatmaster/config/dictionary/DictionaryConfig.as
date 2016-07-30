/**
 * Created by Dom on 2016-06-14.
 */
package pl.znr.heatmaster.config.dictionary {
import pl.znr.heatmaster.config.*;

import flash.utils.Dictionary;

import pl.znr.heatmaster.config.dictionary.SolarCollectorTypeConfig;

import pl.znr.heatmaster.constants.combo.DoorType;

public class DictionaryConfig {

    private var _doorTypeConfig:DoorTypeConfig;
    private var _insulationMaterialTypeConfig:InsulationMaterialTypeConfig;
    private var _solarCollectorsTypeConfig:SolarCollectorTypeConfig;
    private var _thermalBridgesTypeConfig:ThermalBridgesTypeConfig;
    private var _heatingSourceTypeConfiguration:HeatingSourceTypeConfig;
    private var _waterStorageDistributionConfiguration:WaterStorageDistributionConfig;
    private var _waterConsumptionConfiguration:WarmWaterConsumptionConfig;
    private var _ventilationTypeConfiguration:VentilationTypeConfig;

    public function DictionaryConfig() {
    }

    public function get doorTypeConfig():DoorTypeConfig {
        return _doorTypeConfig;
    }

    public function set doorTypeConfig(value:DoorTypeConfig):void {
        _doorTypeConfig = value;
    }

    public function get solarCollectorsTypeConfig():SolarCollectorTypeConfig {
        return _solarCollectorsTypeConfig;
    }

    public function set solarCollectorsTypeConfig(value:SolarCollectorTypeConfig):void {
        _solarCollectorsTypeConfig = value;
    }

    public function get thermalBridgesTypeConfig():ThermalBridgesTypeConfig {
        return _thermalBridgesTypeConfig;
    }

    public function set thermalBridgesTypeConfig(value:ThermalBridgesTypeConfig):void {
        _thermalBridgesTypeConfig = value;
    }

    public function get insulationMaterialTypeConfig():InsulationMaterialTypeConfig {
        return _insulationMaterialTypeConfig;
    }

    public function set insulationMaterialTypeConfig(value:InsulationMaterialTypeConfig):void {
        _insulationMaterialTypeConfig = value;
    }

    public function get heatingSourceTypeConfiguration():HeatingSourceTypeConfig {
        return _heatingSourceTypeConfiguration;
    }

    public function set heatingSourceTypeConfiguration(value:HeatingSourceTypeConfig):void {
        _heatingSourceTypeConfiguration = value;
    }

    public function get waterStorageDistributionConfiguration():WaterStorageDistributionConfig {
        return _waterStorageDistributionConfiguration;
    }

    public function set waterStorageDistributionConfiguration(value:WaterStorageDistributionConfig):void {
        _waterStorageDistributionConfiguration = value;
    }


    public function get waterConsumptionConfiguration():WarmWaterConsumptionConfig {
        return _waterConsumptionConfiguration;
    }

    public function set waterConsumptionConfiguration(value:WarmWaterConsumptionConfig):void {
        _waterConsumptionConfiguration = value;
    }


    public function get ventilationTypeConfiguration():VentilationTypeConfig {
        return _ventilationTypeConfiguration;
    }

    public function set ventilationTypeConfiguration(value:VentilationTypeConfig):void {
        _ventilationTypeConfiguration = value;
    }
}
}
