/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 14.05.15
 * Time: 20:30
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import pl.znr.heatmaster.constants.combo.AirTightness;
import pl.znr.heatmaster.constants.combo.DoorType;
import pl.znr.heatmaster.constants.combo.FoundationsType;
import pl.znr.heatmaster.constants.combo.HeatingSourceType;
import pl.znr.heatmaster.constants.combo.InsulationMaterialType;
import pl.znr.heatmaster.constants.combo.SolarCollectorType;
import pl.znr.heatmaster.constants.combo.ThermalBridgesType;
import pl.znr.heatmaster.constants.combo.VentilationMethod;
import pl.znr.heatmaster.constants.combo.WarmWaterDistribution;
import pl.znr.heatmaster.constants.combo.WarmWaterStorage;
import pl.znr.heatmaster.constants.combo.WindowsType;
import pl.znr.heatmaster.core.model.SolarCollectorData;

public class HouseStandardTypeModel {

    private var _roofInsulationMaterialType:InsulationMaterialType;
    private var _roofUValue:Number;

    private var _wallInsulationMaterialType:InsulationMaterialType;
    private var _wallUValue:Number;
    private var _doorType:DoorType;

    private var _floorInsulationMaterialType:InsulationMaterialType;
    private var _floorUValue:Number;
    private var _foundationsType:int;

    private var _ventilationMethod:VentilationMethod;
    private var _airTightness:Number;

    private var _thermalBridges:ThermalBridgesType;
    private var _windowsType:int;
    private var _shuttersEnabled:Boolean;

    private var _heatingSourceType:HeatingSourceType;
    private var _multiFamilyHeatingSourceType:HeatingSourceType;
    private var _warmWaterHeatingSourceType:HeatingSourceType;
    private var _multiFamilyWarmWaterHeatingSourceType:HeatingSourceType;
    private var _solarCollectorData:SolarCollectorData;
    private var _warmWaterDistribution:WarmWaterDistribution;
    private var _warmWaterStorage:WarmWaterStorage;

    private var _southWindowSurfaceFactor:Number;
    private var _northWindowSurface:Number;

    private var _carbonDioxideSensor:Boolean;

    public function HouseStandardTypeModel(roofInsulationMaterialType:InsulationMaterialType, wallInsulationMaterialType:InsulationMaterialType, floorInsulationMaterialType:InsulationMaterialType, ventilationMethod:VentilationMethod, foundationsType:int, thermalBridges:ThermalBridgesType, doorType:DoorType, windowsType:int,
                                           heatingSourceType:HeatingSourceType,multiFamilyHeatingSourceType:HeatingSourceType,
                                           warmWaterHeatingSourceType:HeatingSourceType,multiFamilyWarmWaterHeatingSourceType:HeatingSourceType,
                                           solarCollectorData:SolarCollectorData, warmWaterDistribution:WarmWaterDistribution,
                                           warmWaterStorage:WarmWaterStorage, roofUValue:Number, wallUValue:Number, floorUValue:Number,
                                           airTightness:Number, southWindowSurfaceFactor:Number, northWindowSurfaceFactor:Number, shuttersEnabled:Boolean,carbonDioxideSensor:Boolean) {


        _roofInsulationMaterialType = roofInsulationMaterialType;
        _wallInsulationMaterialType = wallInsulationMaterialType;
        _floorInsulationMaterialType = floorInsulationMaterialType;
        _ventilationMethod = ventilationMethod;
        _foundationsType = foundationsType;
        _thermalBridges = thermalBridges;
        _doorType = doorType;
        _windowsType = windowsType;
        _heatingSourceType = heatingSourceType;
        _multiFamilyHeatingSourceType = multiFamilyHeatingSourceType;
        _warmWaterHeatingSourceType = warmWaterHeatingSourceType;
        _multiFamilyWarmWaterHeatingSourceType = multiFamilyWarmWaterHeatingSourceType;
        _solarCollectorData = solarCollectorData;
        _warmWaterDistribution = warmWaterDistribution;
        _warmWaterStorage = warmWaterStorage;
        _roofUValue = roofUValue;
        _wallUValue = wallUValue;
        _floorUValue = floorUValue;
        _airTightness = airTightness;
        _southWindowSurfaceFactor = southWindowSurfaceFactor;
        _northWindowSurface = northWindowSurfaceFactor;
        _shuttersEnabled = shuttersEnabled;
        _carbonDioxideSensor = carbonDioxideSensor;
    }

    public function get roofInsulationMaterialType():InsulationMaterialType {
        return _roofInsulationMaterialType;
    }

    public function get wallInsulationMaterialType():InsulationMaterialType {
        return _wallInsulationMaterialType;
    }

    public function get floorInsulationMaterialType():InsulationMaterialType {
        return _floorInsulationMaterialType;
    }

    public function get ventilationMethod():VentilationMethod {
        return _ventilationMethod;
    }

    public function get foundationsType():int {
        return _foundationsType;
    }

    public function get thermalBridges():ThermalBridgesType {
        return _thermalBridges;
    }

    public function get airTightness():Number {
        return _airTightness;
    }

    public function get doorType():DoorType {
        return _doorType;
    }

    public function get windowsType():int {
        return _windowsType;
    }

    public function get southWindowSurfaceFactor():Number {
        return _southWindowSurfaceFactor;
    }

    public function get northWindowSurface():Number {
        return _northWindowSurface;
    }

    public function get heatingSourceType():HeatingSourceType {
        return _heatingSourceType;
    }


    public function get solarCollectorData():SolarCollectorData {
        return _solarCollectorData;
    }

    public function get roofUValue():Number {
        return _roofUValue;
    }

    public function get wallUValue():Number {
        return _wallUValue;
    }

    public function get floorUValue():Number {
        return _floorUValue;
    }

    public function get warmWaterDistribution():WarmWaterDistribution {
        return _warmWaterDistribution;
    }

    public function get warmWaterStorage():WarmWaterStorage {
        return _warmWaterStorage;
    }

    public function get shuttersEnabled():Boolean {
        return _shuttersEnabled;
    }

    public function get carbonDioxideSensor():Boolean {
        return _carbonDioxideSensor;
    }


    public function get multiFamilyHeatingSourceType():HeatingSourceType {
        return _multiFamilyHeatingSourceType;
    }


    public function get warmWaterHeatingSourceType():HeatingSourceType {
        return _warmWaterHeatingSourceType;
    }


    public function get multiFamilyWarmWaterHeatingSourceType():HeatingSourceType {
        return _multiFamilyWarmWaterHeatingSourceType;
    }

}
}
