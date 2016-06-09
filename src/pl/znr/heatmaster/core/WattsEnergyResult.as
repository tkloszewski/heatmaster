/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 11:09
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
public class WattsEnergyResult {

    private var _monthlyEnergyConsumption:Array = [];
    private var _monthlyEnergyBalance:Array = [];
    private var _monthlyEnergyHeatBalanceV1:Array = [];
    private var _monthlyEnergyHeatBalanceV2:Array = [];

    public function WattsEnergyResult(monthlyEnergyConsumption:Array, monthlyEnergyBalance:Array, monthlyEnergyHeatBalanceV1:Array, monthlyEnergyHeatBalanceV2:Array) {
        _monthlyEnergyConsumption = monthlyEnergyConsumption;
        _monthlyEnergyBalance = monthlyEnergyBalance;
        _monthlyEnergyHeatBalanceV1 = monthlyEnergyHeatBalanceV1;
        _monthlyEnergyHeatBalanceV2 = monthlyEnergyHeatBalanceV2;
    }

    public function get monthlyEnergyConsumption():Array {
        return _monthlyEnergyConsumption;
    }

    public function set monthlyEnergyConsumption(value:Array):void {
        _monthlyEnergyConsumption = value;
    }

    public function get monthlyEnergyBalance():Array {
        return _monthlyEnergyBalance;
    }

    public function set monthlyEnergyBalance(value:Array):void {
        _monthlyEnergyBalance = value;
    }

    public function get monthlyEnergyHeatBalanceV1():Array {
        return _monthlyEnergyHeatBalanceV1;
    }

    public function set monthlyEnergyHeatBalanceV1(value:Array):void {
        _monthlyEnergyHeatBalanceV1 = value;
    }

    public function get monthlyEnergyHeatBalanceV2():Array {
        return _monthlyEnergyHeatBalanceV2;
    }

    public function set monthlyEnergyHeatBalanceV2(value:Array):void {
        _monthlyEnergyHeatBalanceV2 = value;
    }

}
}
