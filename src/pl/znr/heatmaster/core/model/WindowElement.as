/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 19:46
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import pl.znr.heatmaster.constants.combo.InsulationElementType;
import pl.znr.heatmaster.constants.combo.ThermalBridgesType;
import pl.znr.heatmaster.constants.combo.WindowsType;

public class WindowElement extends InsulationElement{
    private var _windowType:int = -1;
    private var _winGain:Number = 0;
    private var _shutters:Boolean = false;

    private var _windowsType:WindowsType;
    private var _thermalBridgesType:ThermalBridgesType;


    override public function toString():String {
        return "WindowElement: = {" + super.toString() + " [windowType=" +_windowType + ",winGain=" + _winGain + "]}";
    }

    public function WindowElement(windowsTypes:WindowsType) {
        _windowsType = windowsTypes;
        _uValue = windowsTypes.uValue;
        _winGain = windowsTypes.winGain;
    }

    override public function getElementType():int {
        return InsulationElementType.WINDOW;
    }

    public function get windowType():int {
        return _windowType;
    }

    public function set windowType(value:int):void {
        _windowType = value;
    }


    public function get winGain():Number {
        return _winGain;
    }

    public function set winGain(value:Number):void {
        _winGain = value;
    }


    public function get shutters():Boolean {
        return _shutters;
    }

    public function set shutters(value:Boolean):void {
        _shutters = value;
    }

    public function get thermalBridgesType():ThermalBridgesType {
        return _thermalBridgesType;
    }

    public function set thermalBridgesType(value:ThermalBridgesType):void {
        _thermalBridgesType = value;
    }

    public function get windowsType():WindowsType {
        return _windowsType;
    }

    public function set windowsType(value:WindowsType):void {
        _windowsType = value;
    }
}
}
