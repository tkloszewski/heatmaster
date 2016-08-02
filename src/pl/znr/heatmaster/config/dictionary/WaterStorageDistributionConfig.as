/**
 * Created by Dom on 2016-07-30.
 */
package pl.znr.heatmaster.config.dictionary {
import mx.collections.ArrayCollection;

public class WaterStorageDistributionConfig {

    private var _waterDistributionTypes:ArrayCollection;
    private var _waterStorageTypes:ArrayCollection;

    private var _distributionSelectedIndex:int;
    private var _storageSelectedIndex:int;

    public function WaterStorageDistributionConfig() {
    }

    public function get waterDistributionTypes():ArrayCollection {
        return _waterDistributionTypes;
    }

    public function set waterDistributionTypes(value:ArrayCollection):void {
        _waterDistributionTypes = value;
    }

    public function get waterStorageTypes():ArrayCollection {
        return _waterStorageTypes;
    }

    public function set waterStorageTypes(value:ArrayCollection):void {
        _waterStorageTypes = value;
    }

    public function get distributionSelectedIndex():int {
        return _distributionSelectedIndex;
    }

    public function set distributionSelectedIndex(value:int):void {
        _distributionSelectedIndex = value;
    }

    public function get storageSelectedIndex():int {
        return _storageSelectedIndex;
    }

    public function set storageSelectedIndex(value:int):void {
        _storageSelectedIndex = value;
    }
}
}
