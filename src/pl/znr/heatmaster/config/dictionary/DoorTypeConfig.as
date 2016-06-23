/**
 * Created by Dom on 2016-06-14.
 */
package pl.znr.heatmaster.config.dictionary {
public class DoorTypeConfig {

    private var _id:String;
    private var _uValue:Number;

    public function DoorTypeConfig(id:String, uValue:Number) {
        _id = id;
        _uValue = uValue;
    }

    public function get id():String {
        return _id;
    }

    public function set id(value:String):void {
        _id = value;
    }

    public function get uValue():Number {
        return _uValue;
    }

    public function set uValue(value:Number):void {
        _uValue = value;
    }
}
}
