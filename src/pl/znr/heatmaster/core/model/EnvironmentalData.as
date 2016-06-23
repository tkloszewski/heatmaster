/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 16:47
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
public class EnvironmentalData {
    public function EnvironmentalData() {
    }

    private var _insolationData:InsolationData = new InsolationData();
    private var _temperatures:Array;
    private var _groundTemperatures:Array;
    private var _tAvg:Number = -1;
    private var _tMin:Number = -1;
    private var _tMax:Number = -1;
    private var _tSigma:Number = -1;


    public function get insolationData():InsolationData {
        return _insolationData;
    }

    public function set insolationData(value:InsolationData):void {
        _insolationData = value;
    }

    public function get temperatures():Array {
        return _temperatures;
    }

    public function set temperatures(value:Array):void {
        _temperatures = value;
    }

    public function get groundTemperatures():Array {
        return _groundTemperatures;
    }

    public function set groundTemperatures(value:Array):void {
        _groundTemperatures = value;
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
}
}
