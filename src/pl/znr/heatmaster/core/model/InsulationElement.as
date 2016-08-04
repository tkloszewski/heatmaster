/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 18:10
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import pl.znr.heatmaster.config.dictionary.model.InsulationQuality;

public class InsulationElement {
    public function InsulationElement() {
    }

    protected var _width:Number = -1;
    protected var _uValue:Number = -1;
    protected var _insulationQuality:InsulationQuality = null;
    private var _materialHeatTransfer:Number;

    public function toString():String {
        var s:String = "[uValue: " + _uValue + ",width: " + _width + ", isolationType: " + _insulationQuality + "]";

        return s;
    }

    public function getMaxWidth():Number {
        return 40.0;
    }

    public function get width():Number {
        return _width;
    }

    public function set width(value:Number):void {
        _width = value;
    }

    public function get uValue():Number {
        return _uValue;
    }

    public function set uValue(value:Number):void {
        _uValue = value;
    }

    public function get insulationQuality():InsulationQuality {
        return _insulationQuality;
    }

    public function set insulationQuality(value:InsulationQuality):void {
        _insulationQuality = value;
    }

    public function getElementType():int {
        return -1;
    }


    public function get materialHeatTransfer():Number {
        return _materialHeatTransfer;
    }

    public function set materialHeatTransfer(value:Number):void {
        _materialHeatTransfer = value;
    }
}
}
