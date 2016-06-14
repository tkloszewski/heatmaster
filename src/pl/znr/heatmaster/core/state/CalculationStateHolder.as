/**
 * Created by Dom on 2016-06-13.
 */
package pl.znr.heatmaster.core.state {
import mx.utils.ObjectUtil;

import pl.znr.heatmaster.core.state.CalculationState;

public class CalculationStateHolder {

    private var baseLineState:CalculationState;
    private var newState:CalculationState;

    public function CalculationStateHolder() {
    }

    public function setBaseLineState(state:CalculationState){
        this.baseLineState = ObjectUtil.copy(state) as CalculationState;
    }

    public function getBaselineState():CalculationState{
       return this.baseLineState;
    }

    public function setNewState(state:CalculationState){
        this.newState = state;
    }

    public function getNewState():CalculationState{
        return this.newState;
    }
}
}
