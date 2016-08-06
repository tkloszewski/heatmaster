/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 21.08.13
 * Time: 23:06
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.cache {
import flash.net.SharedObject;
import flash.net.registerClassAlias;

import pl.znr.heatmaster.constants.StateConstants;
import pl.znr.heatmaster.core.*;
import pl.znr.heatmaster.core.state.CalculationStateController;

public class CachedDataContextManager {

    private static var UNIQUE_NAME:String = "pl.znr.heatmaster.cookie";

    private var cacheWritten:Boolean = false;

    private var calculationStateController:CalculationStateController;
    private var dataContextValidator:DataContextValidator = new DataContextValidator();

    private var flatDataContextRef:FlatDataContext = null;
    var flatDataContextNew:FlatDataContext = null;

    public function CachedDataContextManager(calculationStateController:CalculationStateController) {
        this.calculationStateController = calculationStateController;
        registerClassAliases();
    }

    public function clearCache():void {
        var so:SharedObject = SharedObject.getLocal(UNIQUE_NAME);
        so.clear();
    }

    public function readInitialCache():InitialDataContext {
        var so:SharedObject = SharedObject.getLocal(UNIQUE_NAME);

        if(so.data.hasOwnProperty("hmData")){
            var hmData:Object = so.data.hmData;
            flatDataContextRef = hmData as FlatDataContext;
        }
        if(so.data.hasOwnProperty("hmDataNew")){
            var hmDataNew:Object = so.data.hmDataNew;
            flatDataContextNew = hmDataNew as FlatDataContext;
        }

        if(flatDataContextRef == null){
            return null;
        }

        var initialContext:InitialDataContext = new InitialDataContext();
        initialContext.lang = flatDataContextRef.lang;
        return initialContext;
    }

    public function readCache():StateDataContext {
        var so:SharedObject = SharedObject.getLocal(UNIQUE_NAME);

        var refDataContext:DataContext = null;
        var newDataContext:DataContext = null;
        var state:int = StateConstants.INITIAL_STATE;

        if(flatDataContextRef != null){
            try {
                refDataContext = validateAndGetDataContext(flatDataContextRef);
            } catch (e:Error) {
                trace("Error building-validating ref flashDataContext: " + e.getStackTrace());
            }
        }
        if(flatDataContextNew != null){
            try {
                newDataContext = validateAndGetDataContext(flatDataContextNew);
            } catch (e:Error) {
                trace("Error building-validating new flashDataContext: " + e.getStackTrace());
            }
        }

        if(refDataContext == null && newDataContext == null){
           return null;
        }

        if(so.data.hasOwnProperty("state")){
            state = so.data.state;
        }

        var result:StateDataContext = new StateDataContext();
        result.referenceDataContext = refDataContext;
        result.newDataContext = newDataContext;
        result.state = state;

        return result;
    }

    public function writeCache(dataContext:DataContext):void {
        var so:SharedObject = SharedObject.getLocal(UNIQUE_NAME);
        var flatDataContext:FlatDataContext = FlatDataContextBuilder.buildFlatDataContext(dataContext);

        if(calculationStateController.isInReferenceOrInitialState()){
            so.data.hmData = flatDataContext;
        }
        else {
            so.data.hmDataNew = flatDataContext;
        }
        so.data.state = calculationStateController.getCurrentState();

        so.flush();
        cacheWritten = true;
        trace("Written to cache...")
    }

    public function writeToSelectedStateCache(dataContext:DataContext,state:int): void {
        var so:SharedObject = SharedObject.getLocal(UNIQUE_NAME);
        var flatDataContext:FlatDataContext = FlatDataContextBuilder.buildFlatDataContext(dataContext);
        if(StateConstants.isInitialOrReference(state)){
            so.data.hmData = flatDataContext;
        }
        else {
            so.data.hmDataNew = flatDataContext;
        }
        so.flush();
        cacheWritten = true;
    }

    public function writeState(state:int):void {
        var so:SharedObject = SharedObject.getLocal(UNIQUE_NAME);
        so.data.state = state;
    }

    public function isCacheWritten():Boolean {
        return cacheWritten;
    }

    private function validateAndGetDataContext(flatDataContext:FlatDataContext):DataContext {
        var cachedDataContext:DataContext = FlatDataContextBuilder.buildDataContext(flatDataContext);
        dataContextValidator.validate(cachedDataContext);
        return cachedDataContext;
    }

    private function registerClassAliases():void {
        registerClassAlias("pl.znr.heatmaster.core.cache.FlatDataContext",FlatDataContext);
    }

}
}
