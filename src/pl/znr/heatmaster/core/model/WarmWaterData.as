/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 12.07.13
 * Time: 23:09
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import pl.znr.heatmaster.constants.combo.HeatingSourceType;
import pl.znr.heatmaster.constants.combo.WarmWaterDistribution;
import pl.znr.heatmaster.constants.combo.WarmWaterStorage;

public class WarmWaterData {

    private var _warmWaterDistribution:WarmWaterDistribution;
    private var _warmWaterStorage:WarmWaterStorage;

    private var _heatingSourceType:HeatingSourceType;
    private var _distributorEfficiency:Number;
    private var _storeEfficiency:Number;
    private var _consumptionIntensity:Number;

    public function WarmWaterData() {
    }

    public function get distributorEfficiency():Number {
        return _distributorEfficiency;
    }

    public function set distributorEfficiency(value:Number):void {
        _distributorEfficiency = value;
    }

    public function get storeEfficiency():Number {
        return _storeEfficiency;
    }

    public function set storeEfficiency(value:Number):void {
        _storeEfficiency = value;
    }


    public function get consumptionIntensity():Number {
        return _consumptionIntensity;
    }

    public function set consumptionIntensity(value:Number):void {
        _consumptionIntensity = value;
    }

    public function get heatingSourceType():HeatingSourceType {
        return _heatingSourceType;
    }

    public function set heatingSourceType(value:HeatingSourceType):void {
        _heatingSourceType = value;
    }


    public function get warmWaterDistribution():WarmWaterDistribution {
        return _warmWaterDistribution;
    }

    public function set warmWaterDistribution(value:WarmWaterDistribution):void {
        _warmWaterDistribution = value;
    }

    public function get warmWaterStorage():WarmWaterStorage {
        return _warmWaterStorage;
    }

    public function set warmWaterStorage(value:WarmWaterStorage):void {
        _warmWaterStorage = value;
    }
}
}
