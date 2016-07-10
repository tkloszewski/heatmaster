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
    private var _naturalUnitPrice:Number;
    private var  _heatingValueMJ:Number;

    public function HeatingSourceTypeItem(type:HeatingSourceType, pricePerKwh:Number = -1) {
        _type = type;
        if(pricePerKwh == -1){
           _pricePerKwh = type.pricePerkWh;
        }
        else {
         _pricePerKwh = pricePerKwh;
        }
        _naturalUnitPrice = type.naturalUnitPrice;
        _heatingValueMJ = type.heatingValueMJ;
    }

    public function resetOriginalPrice(ratio:Number):void{
        _pricePerKwh = type.pricePerkWh * ratio;
        _naturalUnitPrice = type.naturalUnitPrice * ratio;
    }

    public function get naturalUnitPrice():Number {
        return _naturalUnitPrice;
    }

    public function set naturalUnitPrice(value:Number):void {
        _naturalUnitPrice = value;
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

    public function get heatingValueMJ():Number {
        return _heatingValueMJ;
    }

    public function set heatingValueMJ(value:Number):void {
        _heatingValueMJ = value;
    }
}
}
