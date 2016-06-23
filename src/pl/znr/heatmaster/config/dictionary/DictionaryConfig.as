/**
 * Created by Dom on 2016-06-14.
 */
package pl.znr.heatmaster.config.dictionary {
import pl.znr.heatmaster.config.*;

import flash.utils.Dictionary;

import pl.znr.heatmaster.config.dictionary.SolarCollectorTypeConfig;

import pl.znr.heatmaster.constants.combo.DoorType;

public class DictionaryConfig {

    private var _doorTypesConfig:Dictionary;
    private var _insulationMaterialTypesConfig:Dictionary;
    private var _solarCollectorTypeConfig:Dictionary;
    private var _thermalBridgesTypeConfig:Dictionary;

    public function DictionaryConfig() {
    }

    public function getDoorTypeById(id:String):DoorTypeConfig {
        return _doorTypesConfig[id] as DoorTypeConfig;
    }

    public function getInsulationMaterialTypeConfigById(id:String):InsulationMaterialTypeConfig {
        return _insulationMaterialTypesConfig[id] as InsulationMaterialTypeConfig;
    }

    public function getSolarCollectorTypeConfigById(id:String):SolarCollectorTypeConfig {
        return _solarCollectorTypeConfig[id] as SolarCollectorTypeConfig;
    }

    public function getThermalBridgesTypeById(id:String):ThermalBridgesTypeConfig {
        return _thermalBridgesTypeConfig[id] as ThermalBridgesTypeConfig;
    }

    public function get insulationMaterialTypesConfig():Dictionary {
        return _insulationMaterialTypesConfig;
    }

    public function set insulationMaterialTypesConfig(value:Dictionary):void {
        _insulationMaterialTypesConfig = value;
    }

    public function get doorTypesConfig():Dictionary {
        return _doorTypesConfig;
    }

    public function set doorTypesConfig(value:Dictionary):void {
        _doorTypesConfig = value;
    }


    public function get solarCollectorTypeConfig():Dictionary {
        return _solarCollectorTypeConfig;
    }

    public function set solarCollectorTypeConfig(value:Dictionary):void {
        _solarCollectorTypeConfig = value;
    }


    public function get thermalBridgesTypeConfig():Dictionary {
        return _thermalBridgesTypeConfig;
    }

    public function set thermalBridgesTypeConfig(value:Dictionary):void {
        _thermalBridgesTypeConfig = value;
    }
}
}
