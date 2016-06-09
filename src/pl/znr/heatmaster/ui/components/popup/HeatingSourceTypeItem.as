/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 14.04.14
 * Time: 20:25
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.components.popup {
import pl.znr.heatmaster.constants.combo.HeatingSourceType;

public class HeatingSourceTypeItem {

    private var _type:HeatingSourceType;
    private var _pricePerKwh:Number;


    public function HeatingSourceTypeItem(type:HeatingSourceType, pricePerKwh:Number = -1) {
        _type = type;
        if(pricePerKwh == -1){
           _pricePerKwh = type.pricePerkWh;
        }
        else {
         _pricePerKwh = pricePerKwh;
        }
    }

    public function get type():HeatingSourceType {
        return _type;
    }

    public function set type(value:HeatingSourceType):void {
        _type = value;
    }

    public function get pricePerKwh():Number {
        return _pricePerKwh;
    }

    public function set pricePerKwh(value:Number):void {
        _pricePerKwh = value;
    }
}
}
