/**
 * Created by Dom on 2016-07-06.
 */
package pl.znr.heatmaster.core {
import pl.znr.heatmaster.constants.StateConstants;

public class StateDataContext {

    private var _referenceDataContext:DataContext;
    private var _newDataContext:DataContext;
    private var _state:int;

    public function StateDataContext() {
    }

    public function getCurrentDataContext():DataContext {
        if(_newDataContext == null || StateConstants.isInitialOrReference(_state)){
            return _referenceDataContext;
        }
        return _newDataContext;
    }

    public function getPreviousDataContext():DataContext {
        if(_newDataContext != null && _referenceDataContext != null){
            if(StateConstants.isInitialOrReference(_state)){
               return _newDataContext;
            }
        }
        return _referenceDataContext;
    }

    public function get referenceDataContext():DataContext {
        return _referenceDataContext;
    }

    public function set referenceDataContext(value:DataContext):void {
        _referenceDataContext = value;
    }

    public function get newDataContext():DataContext {
        return _newDataContext;
    }

    public function set newDataContext(value:DataContext):void {
        _newDataContext = value;
    }

    public function get state():int {
        return _state;
    }

    public function set state(value:int):void {
        _state = value;
    }
}
}
