/**
 * Created by Dom on 2016-06-15.
 */
package pl.znr.heatmaster.config {
public class InsulationMaterialTypeConfig {

    private var _id:String;
    private var _heatTransfer:Number;

    public function InsulationMaterialTypeConfig(id:String, heatTransfer:Number) {
        _id = id;
        _heatTransfer = heatTransfer;
    }

    public function get id():String {
        return _id;
    }

    public function set id(value:String):void {
        _id = value;
    }

    public function get heatTransfer():Number {
        return _heatTransfer;
    }

    public function set heatTransfer(value:Number):void {
        _heatTransfer = value;
    }
}
}
