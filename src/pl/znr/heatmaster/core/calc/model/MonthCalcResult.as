/**
 * Created by Dom on 2016-06-25.
 */
package pl.znr.heatmaster.core.calc.model {
public class MonthCalcResult {
    private var _monthEnergyData:MonthEnergyData;
    private var _weightedEnergyBalance:Number = 0;
    private var _weightedEnergyHeatBalanceV1:Number = 0;
    private var _weightedEnergyHeatBalanceV2:Number = 0;

    public function MonthCalcResult(monthEnergyData:MonthEnergyData, weightedEnergyBalance:Number, weightedEnergyHeatBalanceV1:Number, weightedEnergyHeatBalanceV2:Number) {
        _monthEnergyData = monthEnergyData;
        _weightedEnergyBalance = weightedEnergyBalance;
        _weightedEnergyHeatBalanceV1 = weightedEnergyHeatBalanceV1;
        _weightedEnergyHeatBalanceV2 = weightedEnergyHeatBalanceV2;
    }

    public function get monthEnergyData():MonthEnergyData {
        return _monthEnergyData;
    }

    public function set monthEnergyData(value:MonthEnergyData):void {
        _monthEnergyData = value;
    }

    public function get weightedEnergyBalance():Number {
        return _weightedEnergyBalance;
    }

    public function set weightedEnergyBalance(value:Number):void {
        _weightedEnergyBalance = value;
    }

    public function get weightedEnergyHeatBalanceV1():Number {
        return _weightedEnergyHeatBalanceV1;
    }

    public function set weightedEnergyHeatBalanceV1(value:Number):void {
        _weightedEnergyHeatBalanceV1 = value;
    }

    public function get weightedEnergyHeatBalanceV2():Number {
        return _weightedEnergyHeatBalanceV2;
    }

    public function set weightedEnergyHeatBalanceV2(value:Number):void {
        _weightedEnergyHeatBalanceV2 = value;
    }
}
}
