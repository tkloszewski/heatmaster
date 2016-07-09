/**
 * Created by Dom on 2016-06-23.
 */
package pl.znr.heatmaster.config {
public interface IEnvironmentalDataConfig {

    function get minCalcTemp():Number;

    function get temperatures():Array;

    function set temperatures(value:Array):void;

    function get groundTemperatures():Array

    function set groundTemperatures(value:Array):void

    function get insolationS():Array;

    function set insolationS(value:Array):void;

    function get insolationWE():Array;

    function set insolationWE(value:Array):void;

    function get insolationN():Array;

    function set insolationN(value:Array):void;

    function get optimalInsolation():Array;

    function set optimalInsolation(value:Array):void;

}
}
