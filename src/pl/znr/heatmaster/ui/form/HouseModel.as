/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 11.06.13
 * Time: 08:13
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.form {
import pl.znr.heatmaster.constants.combo.DoorType;

public class HouseModel {

    private var _houseType:Number = -1;
    private var _houseTemp:Number = -1;

    private var _floorCount:Number = -1;
    private var _floorHeight:Number = -1;
    private var _totalSurface:Number = -1;

    private var _floorArea:Number = -1;
    private var _roofSurface:Number = -1;
    private var _wallSurface:Number = -1;
    private var _windowsSurfaceS:Number = -1;
    private var _windowsSurfaceWE:Number = -1;
    private var _windowsSurfaceN:Number = -1;
    private var _doorType:DoorType;

    public function HouseModel(houseType:Number, floorCount:Number, floorHeight:Number, totalSurface:Number, floorSurface:Number, roofSurface:Number, wallSurface:Number, windowsSurfaceS:Number, windowsSurfaceWE:Number, windowsSurfaceN:Number,houseTemp:Number) {
        _houseType = houseType;
        _floorCount = floorCount;
        _floorHeight = floorHeight;
        _totalSurface = totalSurface;
        _floorArea = floorSurface;
        _roofSurface = roofSurface;
        _wallSurface = wallSurface;
        _windowsSurfaceS = windowsSurfaceS;
        _windowsSurfaceWE = windowsSurfaceWE;
        _windowsSurfaceN = windowsSurfaceN;
        _houseTemp = houseTemp;
    }

    public function get houseType():Number {
        return _houseType;
    }

    public function set houseType(value:Number):void {
        _houseType = value;
    }

    public function get doorType():DoorType {
        return _doorType;
    }

    public function set doorType(value:DoorType):void {
        _doorType = value;
    }

    public function get houseTemp():Number {
        return _houseTemp;
    }

    public function set houseTemp(value:Number):void {
        _houseTemp = value;
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
}
}
