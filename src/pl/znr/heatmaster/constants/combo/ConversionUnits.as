/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 16.06.13
 * Time: 15:02
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import flash.net.registerClassAlias;

import pl.znr.heatmaster.core.converter.RatioCluster;

public class ConversionUnits {

    public static const COST_PER_MONTH:int = 0;
    public static const COST_PER_YEAR:int = 1;
    public static const ENERGY_KWH_PER_MONTH:int = 2;
    public static const ENERGY_KWH_PER_YEAR:int = 3;
    public static const ENERGY_WATTS:int = 4;
    public static const ENERGY_GJ_PER_YEAR:int = 5;
    public static const ENERGY_GJ_PER_MONTH:int = 6;
    public static const EMISSIONS_PER_YEAR:int = 7;
    public static const LOCAL_CURRENCY_COST_PER_MONTH:int = 8;
    public static const LOCAL_CURRENCY_COTS_PER_YEAR:int = 9;

    public function ConversionUnits() {
    }

    public static function getRatio(unit:int,ratioCluster:RatioCluster):Number {
        if(unit == ENERGY_WATTS){
           return ratioCluster.toWattsRatio;
        }
        if(isGJUnit(unit)){
           return ratioCluster.toGJRatio;
        }
        if(isKiloWattsUnit(unit)){
           return ratioCluster.tokWhRatio;
        }
        if(isCostUnit(unit)){
           return ratioCluster.toCostRatio;
        }
        return 1;
    }

    public static function isMonthUnit(unit:int):Boolean {
        return unit == ENERGY_WATTS || unit == ENERGY_KWH_PER_MONTH || unit == COST_PER_MONTH
               || unit == ENERGY_GJ_PER_MONTH || unit == LOCAL_CURRENCY_COST_PER_MONTH;
    }

    public static function isYearUnit(unit:int):Boolean {
        return unit == ENERGY_KWH_PER_YEAR || unit == COST_PER_YEAR || unit == ENERGY_GJ_PER_YEAR || unit == EMISSIONS_PER_YEAR || unit == LOCAL_CURRENCY_COTS_PER_YEAR;
    }

    public static function isKiloWattsUnit(unit:int):Boolean {
        return unit == ENERGY_KWH_PER_YEAR || unit == ENERGY_KWH_PER_MONTH;
    }

    public static function isCostUnit(unit:int):Boolean {
        return unit == COST_PER_MONTH || unit == COST_PER_YEAR || unit == LOCAL_CURRENCY_COST_PER_MONTH || unit == LOCAL_CURRENCY_COTS_PER_YEAR;
    }

    public static function isEuroCostUnit(unit:int):Boolean {
        return  unit == COST_PER_MONTH || unit == COST_PER_YEAR;
    }

    public static function isLocalCurrencyCostUnit(unit:int):Boolean {
       return unit == LOCAL_CURRENCY_COST_PER_MONTH || unit == LOCAL_CURRENCY_COTS_PER_YEAR;
    }

    public static function isEnergyUnit(unit:int):Boolean {
        return unit == ENERGY_KWH_PER_YEAR || unit == ENERGY_KWH_PER_MONTH ||
               unit == ENERGY_GJ_PER_MONTH || unit == ENERGY_GJ_PER_YEAR;
    }

    public static function isGJUnit(unit:int):Boolean {
        return unit == ENERGY_GJ_PER_YEAR || unit == ENERGY_GJ_PER_MONTH;
    }

    public static function isEmisionUnit(unit:int):Boolean {
        return unit == EMISSIONS_PER_YEAR;
    }

    public static function isEfficiencyAwareUnit(unit:int):Boolean {
        return isCostUnit(unit) || isEmisionUnit(unit);
    }
}
}
