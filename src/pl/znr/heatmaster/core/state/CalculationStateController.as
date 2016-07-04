/**
 * Created by Dom on 2016-06-13.
 */
package pl.znr.heatmaster.core.state {
import mx.collections.ArrayCollection;
import mx.utils.ObjectUtil;

import pl.znr.heatmaster.core.CachedDataContextManager;
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.FlatDataContextBuilder;
import pl.znr.heatmaster.core.FlatDataContextBuilder;
import pl.znr.heatmaster.core.HeatMasterController;

import pl.znr.heatmaster.core.state.CalculationState;
import pl.znr.heatmaster.ui.HeatMasterChangeListener;

public class CalculationStateController {

    private static var INITIAL_STATE:int = 1;
    private static var NEW_SWITCHED:int = 2;
    private static var REFERENCE_SWITCHED:int = 3;

    private var state:int = INITIAL_STATE;

    private var heatMasterController:HeatMasterController;
    private var heatMasterChangeListener:HeatMasterChangeListener;
    private var cacheManager:CachedDataContextManager;

    private var calculationStateListeners:ArrayCollection = new ArrayCollection();

    private var referenceDataContext:DataContext;
    private var newStateDataContext:DataContext;

    public function CalculationStateController(heatMasterController:HeatMasterController,heatMasterChangeListener:HeatMasterChangeListener,cacheManager:CachedDataContextManager) {
        this.heatMasterController = heatMasterController;
        this.heatMasterChangeListener = heatMasterChangeListener;
        this.cacheManager = cacheManager;
    }

    public function freezeReferenceState():void {
        state = NEW_SWITCHED;
        referenceDataContext = heatMasterController.getDataContext();
        newStateDataContext = copyDataContext(referenceDataContext);
        heatMasterChangeListener.setCacheEnabled(false);
        heatMasterController.resetDataContext(newStateDataContext);
        propagateStateSwitched(true);
    }

    public function unFreezeState():void{
        var resetDataContext:DataContext = cacheManager.readCache();
        if(resetDataContext == null){
           resetDataContext = referenceDataContext;
        }
        propagateStateSwitched(false);
        heatMasterChangeListener.setCacheEnabled(true);
        heatMasterController.calculateAndSetViewState(resetDataContext);
    }

    public function switchToReferenceState():void {
        if(state == REFERENCE_SWITCHED){
           return;
        }
        state = REFERENCE_SWITCHED;
        propagateStateSwitched(false);
        heatMasterController.calculateAndSetViewState(referenceDataContext);
    }

    public function switchToNewState():void {
        if(state == NEW_SWITCHED){
           return;
        }
        state = NEW_SWITCHED;
        propagateStateSwitched(true);
        heatMasterController.calculateAndSetViewState(newStateDataContext);
    }

    public function addCalculationStateListener(listener:ICalculationStateListener):void {
        calculationStateListeners.addItem(listener);
    }

    public function isReferenceValueCalculated():Boolean{
       return state == INITIAL_STATE || state == REFERENCE_SWITCHED;
    }

    public function isNewValueCalculated():Boolean {
        return state == NEW_SWITCHED;
    }

    private function copyDataContext(dataContext:DataContext):DataContext {
        var copied:DataContext = FlatDataContextBuilder.buildDataContext(FlatDataContextBuilder.buildFlatDataContext(dataContext));
        return copied;
    }

    private function propagateStateSwitched(stateFrozen:Boolean):void {
        for(var i:int =0; i < calculationStateListeners.length; i++){
            var listener:ICalculationStateListener = calculationStateListeners.getItemAt(i) as ICalculationStateListener;
            listener.calculationStateSwitched(stateFrozen)
        }
    }

}
}
