/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 31.05.13
 * Time: 22:47
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import mx.controls.Alert;

public class SurfaceData {

    private var _floorCount:Number = -1;
    private var _floorHeight:Number = -1;
    private var _totalSurface:Number = -1;

    private var _floorArea:Number = -1;
    private var _floorSurface:Number = -1;
    private var _floorSurfaceC:Number = -1;
    private var _floorSurfaceR:Number = -1;
    private var _roofSurface:Number = -1;
    private var _wallSurface:Number = -1;
    private var _windowsSurface:Number = -1;
    private var _windowsSurfaceS:Number = -1;
    private var _windowsSurfaceWE:Number = -1;
    private var _windowsSurfaceN:Number = -1;

    public function toString():String{
        var s:String =  "SurfaceData = [floorSurfaceC = " + _floorSurfaceC + ",floorSurfaceR=" + _floorSurfaceR;
        s += "\n,wallSurface = " + _wallSurface + ",roofSurface=" + _roofSurface + ",windowsSurface= ";
        s += _windowsSurface + ",windowsSurfaceS= " + _windowsSurfaceS + "\n";
        s += ",windowsSurfaceN=" + _windowsSurfaceN + ",windowsSurfaceWE= " +_windowsSurfaceWE ;


        return s;
    }


    public function SurfaceData(floorCount:Number, floorHeight:Number, totalSurface:Number) {
        _floorCount = floorCount;
        _floorHeight = floorHeight;
        _totalSurface = totalSurface;
    }

    public function get floorArea():Number {
        return _floorArea;
    }

    public function set floorArea(value:Number):void {
        _floorArea = value;
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

    public function get floorSurface():Number {
        return _floorSurface;
    }

    public function set floorSurface(value:Number):void {
        _floorSurface = value;
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
}
}
