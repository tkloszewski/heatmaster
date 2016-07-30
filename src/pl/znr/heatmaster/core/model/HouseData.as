/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 17:57
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import pl.znr.heatmaster.constants.combo.BuildingAge;
import pl.znr.heatmaster.constants.combo.DoorType;
import pl.znr.heatmaster.constants.combo.ElectricityConsumption;
import pl.znr.heatmaster.constants.combo.FoundationsType;
import pl.znr.heatmaster.constants.combo.HouseStandardType;

public class HouseData {
    private var _houseType:int;
    private var _standardType:HouseStandardType;
    private var _buildingAge:BuildingAge;

    private var _surfaceData:SurfaceData;
    private var _wallElement:InsulationElement;
    private var _roofElement:InsulationElement;
    private var _floorElement:InsulationElement;
    private var _windowElement:WindowElement;
    private var _doorType:DoorType;
    private var _ventilationData:VentilationData = new VentilationData();
    private var _warmWaterData:WarmWaterData = new WarmWaterData();
    private var _electricityConsumption:int = ElectricityConsumption.AVERAGE;
    private var _personNumber:int = 2;

    private var _foundationType:FoundationsType;

    private var _tIn:Number;

    public function HouseData() {
    }


    public function get houseType():int {
        return _houseType;
    }

    public function set houseType(value:int):void {
        _houseType = value;
    }

    public function get windowElement():WindowElement {
        return _windowElement;
    }

    public function set windowElement(value:WindowElement):void {
        _windowElement = value;
    }

    public function get ventilationData():VentilationData {
        return _ventilationData;
    }

    public function set ventilationData(value:VentilationData):void {
        _ventilationData = value;
    }

    public function get surfaceData():SurfaceData {
        return _surfaceData;
    }

    public function set surfaceData(value:SurfaceData):void {
        _surfaceData = value;
    }

    public function get wallElement():InsulationElement {
        return _wallElement;
    }

    public function set wallElement(value:InsulationElement):void {
        _wallElement = value;
    }

    public function get roofElement():InsulationElement {
        return _roofElement;
    }

    public function set roofElement(value:InsulationElement):void {
        _roofElement = value;
    }

    public function get floorElement():InsulationElement {
        return _floorElement;
    }

    public function set floorElement(value:InsulationElement):void {
        _floorElement = value;
    }

    public function get warmWaterData():WarmWaterData {
        return _warmWaterData;
    }

    public function set warmWaterData(value:WarmWaterData):void {
        _warmWaterData = value;
    }

    public function get electricityConsumption():int {
        return _electricityConsumption;
    }

    public function set electricityConsumption(value:int):void {
        _electricityConsumption = value;
    }

    public function get personNumber():int {
        return _personNumber;
    }

    public function set personNumber(value:int):void {
        _personNumber = value;
    }

    public function get tIn():Number {
        return _tIn;
    }

    public function set tIn(value:Number):void {
        _tIn = value;
    }


    public function get doorType():DoorType {
        return _doorType;
    }

    public function set doorType(value:DoorType):void {
        _doorType = value;
    }

    public function get buildingAge():BuildingAge {
        return _buildingAge;
    }

    public function set buildingAge(value:BuildingAge):void {
        _buildingAge = value;
    }

    public function get foundationType():FoundationsType {
        return _foundationType;
    }

    public function set foundationType(value:FoundationsType):void {
        _foundationType = value;
    }

    public function get standardType():HouseStandardType {
        return _standardType;
    }

    public function set standardType(value:HouseStandardType):void {
        _standardType = value;
    }
}
}
