/**
 * Created by Dom on 2016-06-30.
 */
package pl.znr.heatmaster.core.state {
public interface ICalculationStateListener {

    function calculationStateSwitched(stateFrozen:Boolean):void;

}
}
