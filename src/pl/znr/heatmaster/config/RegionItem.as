/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 07.05.14
 * Time: 21:02
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config {
public class RegionItem implements IEnvironmentalDataConfig{

    private var _code:String;
    private var _localeCode:String;
    private var _regionCode:String;
    private var _name:String;

    private var _temperatures:Array;
    private var _groundTemperatures:Array;
    private var _insolationS:Array;
    private var _insolationWE:Array;
    private var _insolationN:Array;
    private var _optimalInsolation:Array;

    private var _country:CountryItem;


    public function get code():String {
        return _code;
    }

    public function set code(value:String):void {
        _code = value;
    }

    public function get localeCode():String {
        return _localeCode;
    }

    public function set localeCode(value:String):void {
        _localeCode = value;
    }

    public function get regionCode():String {
        return _regionCode;
    }

    public function set regionCode(value:String):void {
        _regionCode = value;
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
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

    public function get insolationS():Array {
        return _insolationS;
    }

    public function set insolationS(value:Array):void {
        _insolationS = value;
    }

    public function get insolationWE():Array {
        return _insolationWE;
    }

    public function set insolationWE(value:Array):void {
        _insolationWE = value;
    }

    public function get insolationN():Array {
        return _insolationN;
    }

    public function set insolationN(value:Array):void {
        _insolationN = value;
    }

    public function get optimalInsolation():Array {
        return _optimalInsolation;
    }

    public function set optimalInsolation(value:Array):void {
        _optimalInsolation = value;
    }

    public function get country():CountryItem {
        return _country;
    }

    public function set country(value:CountryItem):void {
        _country = value;
    }


    public function get minCalcTemp():Number {
        return Number.NaN;
    }
}
}
