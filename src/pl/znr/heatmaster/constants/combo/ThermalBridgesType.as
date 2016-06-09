/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 14.05.15
 * Time: 20:46
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import mx.collections.ArrayList;

public class ThermalBridgesType extends BaseComboObject{

    private static var items:ArrayList = new ArrayList();

    public static var MAX:ThermalBridgesType = new ThermalBridgesType("1",0.45);
    public static var AVG:ThermalBridgesType = new ThermalBridgesType("2",0.2);
    public static var MIN:ThermalBridgesType = new ThermalBridgesType("3",0.08);

    private var _uValue:Number;

    public static function getThermalBridgesTypeById(_id:String):ThermalBridgesType {
        for(var i:int = 0;i < items.length;i++){
            var thermalBridgesType:ThermalBridgesType = items.getItemAt(i) as ThermalBridgesType;
            if(thermalBridgesType.getId() == _id){
                return thermalBridgesType;
            }
        }
        return null;
    }

    public function ThermalBridgesType(id:String,uValue:Number) {
        super(id);
        this._uValue = uValue;
        items.addItem(this)
    }

    public function get uValue():Number {
        return _uValue;
    }
}
}
