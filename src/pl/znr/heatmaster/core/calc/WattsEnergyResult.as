/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 11:09
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.calc {
public class WattsEnergyResult {

    private var _monthlyEnergyConsumption:Array = [];
    private var _heatingSourceMaxPower:Number;

    public function WattsEnergyResult(monthlyEnergyConsumption:Array) {
        _monthlyEnergyConsumption = monthlyEnergyConsumption;
    }

    public function get monthlyEnergyConsumption():Array {
        return _monthlyEnergyConsumption;
    }


    public function get heatingSourceMaxPower():Number {
        return _heatingSourceMaxPower;
    }

    public function set heatingSourceMaxPower(value:Number):void {
        _heatingSourceMaxPower = value;
    }
}
}
