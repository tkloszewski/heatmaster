/**
 * Created by Dom on 2016-06-13.
 */
package pl.znr.heatmaster.core.state {
import mx.collections.ArrayCollection;
import mx.utils.ObjectUtil;

import pl.znr.heatmaster.core.CachedDataContextManager;
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.HeatMasterController;

import pl.znr.heatmaster.core.state.CalculationState;
import pl.znr.heatmaster.ui.HeatMasterChangeListener;

public class CalculationStateController {

    private var heatMasterController:HeatMasterController;
    private var heatMasterChangeListener:HeatMasterChangeListener;
    private var cacheManager:CachedDataContextManager;

    private var calculationStateListeners:ArrayCollection = new ArrayCollection();

    private var baseLineDataContext:DataContext;
    private var newStateDataContext:DataContext;

    public function CalculationStateController(heatMasterController:HeatMasterController,heatMasterChangeListener:HeatMasterChangeListener,cacheManager:CachedDataContextManager) {
        this.heatMasterController = heatMasterController;
        this.heatMasterChangeListener = heatMasterChangeListener;
        this.cacheManager = cacheManager;
    }

    public function freezeBaseLineState():void {
        baseLineDataContext = heatMasterController.getDataContext();
        newStateDataContext = ObjectUtil.copy(baseLineDataContext) as DataContext;
        heatMasterChangeListener.setCacheEnabled(false);
        heatMasterController.resetDataContext(newStateDataContext);
        propagateStateSwitched(true);
    }

    public function unFreezeState():void{
        var resetDataContext:DataContext = cacheManager.readCache();
        if(resetDataContext == null){
           resetDataContext = baseLineDataContext;
        }
        propagateStateSwitched(false);
        heatMasterChangeListener.setCacheEnabled(true);
        heatMasterController.calculateAndSetViewState(resetDataContext);
    }

    public function switchToBaseLineState():void {
        propagateStateSwitched(false);
        heatMasterController.calculateAndSetViewState(baseLineDataContext);
    }

    public function switchToNewState():void {
        propagateStateSwitched(true);
        heatMasterController.calculateAndSetViewState(newStateDataContext);
    }

    public function addCalculationStateListener(listener:ICalculationStateListener):void {
        calculationStateListeners.addItem(listener);
    }

    private function propagateStateSwitched(stateFrozen:Boolean):void {
        for(var i:int =0; i < calculationStateListeners.length; i++){
            var listener:ICalculationStateListener = calculationStateListeners.getItemAt(i) as ICalculationStateListener;
            listener.calculationStateSwitched(stateFrozen)
        }
    }

}
}
