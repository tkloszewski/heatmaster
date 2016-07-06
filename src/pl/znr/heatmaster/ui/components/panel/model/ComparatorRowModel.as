/**
 * Created by Dom on 2016-07-05.
 */
package pl.znr.heatmaster.ui.components.panel.model {
public class ComparatorRowModel {

    [Bindable]
    private var _refBalanceValueInWatts:String;
    [Bindable]
    private var _refBalanceValueInKwh:String;
    [Bindable]
    private var _savedBalancedValueInWatts:String;
    [Bindable]
    private var _savedBalancedValueInKwh;String;


    public function ComparatorRowModel(refBalanceValueInWatts:String, refBalanceValueInKwh:String, savedBalancedValueInWatts:String, savedBalancedValueInKwh) {
        _refBalanceValueInWatts = refBalanceValueInWatts;
        _refBalanceValueInKwh = refBalanceValueInKwh;
        _savedBalancedValueInWatts = savedBalancedValueInWatts;
        _savedBalancedValueInKwh = savedBalancedValueInKwh;
    }


    public function get refBalanceValueInWatts():String {
        return _refBalanceValueInWatts;
    }

    public function get refBalanceValueInKwh():String {
        return _refBalanceValueInKwh;
    }

    public function get savedBalancedValueInWatts():String {
        return _savedBalancedValueInWatts;
    }

    public function get savedBalancedValueInKwh():* {
        return _savedBalancedValueInKwh;
    }
}
}
