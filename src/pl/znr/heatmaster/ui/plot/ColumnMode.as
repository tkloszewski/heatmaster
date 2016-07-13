/**
 * Created by Dom on 2016-07-12.
 */
package pl.znr.heatmaster.ui.plot {
public class  ColumnMode {
    public static const SPLIT_ALL_COMPONENTS:int = 1;
    public static const SPLIT_USER_ENERGY_COMPONENTS:int = 2;
    public static const AGGREGATED_ALL_COMPONENTS:int = 3;
    public static const AGGREGATED_USER_ENERGY_COMPONENTS:int = 4;
    public static const AGGREGATED_ALL_COMPONENTS_EFFICIENCY_BALANCED = 5;

    function ColumnMode() {
    }

    public static function isAllComponentsMode(mode:int):Boolean {
        return mode == SPLIT_ALL_COMPONENTS || mode == AGGREGATED_ALL_COMPONENTS;
    }

    public static function isSplitMode(mode:int):Boolean {
        return mode == SPLIT_ALL_COMPONENTS || mode == SPLIT_USER_ENERGY_COMPONENTS;
    }

    public static function isAggregatedMode(mode:int):Boolean {
        return mode == AGGREGATED_ALL_COMPONENTS || mode == AGGREGATED_USER_ENERGY_COMPONENTS || mode == AGGREGATED_ALL_COMPONENTS_EFFICIENCY_BALANCED;
    }

}
}
