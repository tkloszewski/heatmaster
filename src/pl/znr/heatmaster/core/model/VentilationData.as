/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 11:07
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import pl.znr.heatmaster.config.dictionary.model.AirTightness;
import pl.znr.heatmaster.config.dictionary.model.VentilationMethod;

public class VentilationData {

    private var _gwcSet:Boolean;
    private var _ventilationFreq:int;
    private var _co2Sensor:Boolean;
    private var _airTightness:AirTightness;
    private var _ventilationMethodObject:VentilationMethod;

    public function VentilationData() {
    }

    public function toString():String {
        return "VentilationData";
    }

    public function get airTightness():AirTightness {
        return _airTightness;
    }

    public function set airTightness(value:AirTightness):void {
        _airTightness = value;
    }

    public function get ventilationFreq():int {
        return _ventilationFreq;
    }

    public function set ventilationFreq(value:int):void {
        _ventilationFreq = value;
    }

    public function get co2Sensor():Boolean {
        return _co2Sensor;
    }

    public function set co2Sensor(value:Boolean):void {
        _co2Sensor = value;
    }

    public function get gwcSet():Boolean {
        return _gwcSet;
    }

    public function set gwcSet(value:Boolean):void {
        _gwcSet = value;
    }


    public function get ventilationMethodObject():VentilationMethod {
        return _ventilationMethodObject;
    }

    public function set ventilationMethodObject(value:VentilationMethod):void {
        _ventilationMethodObject = value;
    }
}
}
