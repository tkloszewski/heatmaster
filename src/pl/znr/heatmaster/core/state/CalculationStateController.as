/**
 * Created by Dom on 2016-06-13.
 */
package pl.znr.heatmaster.core.state {
import mx.collections.ArrayCollection;

import pl.znr.heatmaster.constants.StateConstants;
import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.HeatMasterController;
import pl.znr.heatmaster.core.ProcessingResult;
import pl.znr.heatmaster.core.StateDataContext;
import pl.znr.heatmaster.core.cache.CachedDataContextManager;
import pl.znr.heatmaster.core.cache.FlatDataContextBuilder;

public class CalculationStateController {

    private var state:int = StateConstants.INITIAL_STATE;

    private var heatMasterController:HeatMasterController;
    private var cacheManager:CachedDataContextManager;

    private var calculationStateListeners:ArrayCollection = new ArrayCollection();

    private var referenceDataContext:DataContext;
    private var newStateDataContext:DataContext;

    private var referenceProcessingResult:ProcessingResult;
    private var newProcessingResult:ProcessingResult;

    public function CalculationStateController(heatMasterController:HeatMasterController) {
        this.heatMasterController = heatMasterController;
    }

    public function initStateController(stateDataContext:StateDataContext):void {
        referenceDataContext = stateDataContext.referenceDataContext;
        newStateDataContext = stateDataContext.newDataContext;
        setStateAndPropagateStateSwitch(stateDataContext.state);
    }

    public function freezeReferenceState():void {
        referenceDataContext = heatMasterController.getDataContext();
        newStateDataContext = copyDataContext(referenceDataContext);
        heatMasterController.resetDataContext(newStateDataContext);
        if(!cacheManager.isCacheWritten()){
            cacheManager.writeCache(referenceDataContext);
        }
        state = StateConstants.NEW_SWITCHED;
        cacheManager.writeState(state);
        propagateStateSwitched(true);
    }

    public function switchToReferenceState():void {
        if(state == StateConstants.REFERENCE_SWITCHED){
            return;
        }
        state = StateConstants.REFERENCE_SWITCHED;
        cacheManager.writeState(state);
        propagateStateSwitched(false);
        heatMasterController.calculateAndSetViewState(referenceDataContext);
    }

    public function switchToNewState():void {
        if(state == StateConstants.NEW_SWITCHED){
            return;
        }
        state = StateConstants.NEW_SWITCHED;
        cacheManager.writeState(state);
        propagateStateSwitched(true);
        heatMasterController.calculateAndSetViewState(newStateDataContext);
    }

    public function addCalculationStateListener(listener:ICalculationStateListener):void {
        calculationStateListeners.addItem(listener);
    }

    public function isInReferenceOrInitialState():Boolean{
        return StateConstants.isInitialOrReference(state);
    }

    public function isInReferenceState():Boolean {
        return StateConstants.isInReferenceState(state);
    }

    public function getCurrentDataContext():DataContext {
        if(StateConstants.isInitialOrReference(state) || newStateDataContext == null){
           return referenceDataContext;
        }
        return newStateDataContext;
    }

    public function getPreviousDataContext():DataContext {
        if(newStateDataContext == null || state == StateConstants.INITIAL_STATE || state == StateConstants.NEW_SWITCHED){
           return referenceDataContext;
        }
        return newStateDataContext;
    }

    public function getCurrentState():int {
        return state;
    }

    public function getPreviousState():int {
        if(isInInitialState()){
           return StateConstants.INITIAL_STATE;
        }
        if(isInReferenceOrInitialState()){
            return StateConstants.NEW_SWITCHED;
        }
        return StateConstants.REFERENCE_SWITCHED;
    }

    public function isInInitialState():Boolean {
        return state == StateConstants.INITIAL_STATE;
    }

    public function isInNewState():Boolean {
        return state == StateConstants.NEW_SWITCHED;
    }

    public function setCacheManager(cacheManager:CachedDataContextManager): void {
        this.cacheManager = cacheManager;
    }

    private function setStateAndPropagateStateSwitch(state:int):void{
        this.state = state;
        if(this.state == StateConstants.NEW_SWITCHED){
            propagateStateSwitched(true);
        }
    }

    private function propagateStateSwitched(stateFrozen:Boolean):void {
        for(var i:int =0; i < calculationStateListeners.length; i++){
            var listener:ICalculationStateListener = calculationStateListeners.getItemAt(i) as ICalculationStateListener;
            listener.calculationStateSwitched(stateFrozen)
        }
    }

    private function copyDataContext(dataContext:DataContext):DataContext {
        return FlatDataContextBuilder.buildDataContext(FlatDataContextBuilder.buildFlatDataContext(dataContext));
    }


}
}
