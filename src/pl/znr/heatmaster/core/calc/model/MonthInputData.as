/**
 * Created by Dom on 2016-06-25.
 */
package pl.znr.heatmaster.core.calc.model {
public class MonthInputData {

    private var _tOut:Number;
    private var _tGround:Number;

    private var _groundInsolation45:Number;
    private var _southInsolation:Number;
    private var _westEastInsolation:Number;
    private var _northInsolation:Number;


    public function MonthInputData(tOut:Number, tGround:Number, groundInsolation45:Number, southInsolation:Number, westEastInsolation:Number, northInsolation:Number) {
        _tOut = tOut;
        _tGround = tGround;
        _groundInsolation45 = groundInsolation45;
        _southInsolation = southInsolation;
        _westEastInsolation = westEastInsolation;
        _northInsolation = northInsolation;
    }

    public function get tOut():Number {
        return _tOut;
    }

    public function set tOut(value:Number):void {
        _tOut = value;
    }

    public function get tGround():Number {
        return _tGround;
    }

    public function set tGround(value:Number):void {
        _tGround = value;
    }

    public function get groundInsolation45():Number {
        return _groundInsolation45;
    }

    public function set groundInsolation45(value:Number):void {
        _groundInsolation45 = value;
    }


    public function get southInsolation():Number {
        return _southInsolation;
    }

    public function set southInsolation(value:Number):void {
        _southInsolation = value;
    }

    public function get westEastInsolation():Number {
        return _westEastInsolation;
    }

    public function set westEastInsolation(value:Number):void {
        _westEastInsolation = value;
    }

    public function get northInsolation():Number {
        return _northInsolation;
    }

    public function set northInsolation(value:Number):void {
        _northInsolation = value;
    }
}
}
