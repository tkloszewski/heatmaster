   /**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 18:14
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.config.dictionary.model {
import mx.collections.ArrayList;
import mx.controls.Alert;

import pl.znr.heatmaster.config.dictionary.model.BaseComboObject;

public class InsulationQuality extends BaseComboObject{

    private static var values:ArrayList = new ArrayList();

    public static var NO_INSULATION:InsulationQuality = new InsulationQuality("2",0,1,0);
    public static var VERY_WEAK:InsulationQuality = new InsulationQuality("3",1,3,2);
    public static var WEAK:InsulationQuality = new InsulationQuality("4",3,6,4);
    public static var AVERAGE:InsulationQuality = new InsulationQuality("5",6,12,8);
    public static var GOOD:InsulationQuality = new InsulationQuality("6",12,20,15);
    public static var VERY_GOOD:InsulationQuality = new InsulationQuality("7",20,35,25);
    public static var EXCELLENT:InsulationQuality = new InsulationQuality("8",35,Number.MAX_VALUE,40);


    private var _fromWidth:Number;

    private var _toWidth:Number;

    private var _defaultWidth:Number;

    function InsulationQuality(id:String,fromWidth:Number, toWidth:Number,defaultWidth:Number) {
        super(id);
        _fromWidth = fromWidth;
        _toWidth = toWidth;
        _defaultWidth = defaultWidth;

        values.addItem(this);
    }

    public static function getInsulationQualityForId(id:String):InsulationQuality {
            try {
                for (var i:int = 0; i < values.length; i++) {
                    var insulationQuality:InsulationQuality = values.getItemAt(i) as InsulationQuality;
                    if (insulationQuality.getId() == id) {
                        return insulationQuality;
                    }
                }
            } catch (e:Error) {
                Alert.show("Error in getInsulationQualityForUValue");
            }
            return null;
        }

    public static function getInsulationQualityForWidth(width:Number):InsulationQuality {
        try {
            for (var i:int = 0; i < values.length; i++) {
                var insulationQuality:InsulationQuality = values.getItemAt(i) as InsulationQuality;
                if (insulationQuality.containsWidthValue(width)) {
                    return insulationQuality;
                }
            }
        } catch (e:Error) {
            Alert.show("Error in getInsulationQualityForUValue");
        }
        return NO_INSULATION;
    }

    private function containsWidthValue(widthValue:Number):Boolean{
        return widthValue < _toWidth && widthValue >= _fromWidth;
    }

    public function get fromWidth():Number {
        return _fromWidth;
    }

    public function get toWidth():Number {
        return _toWidth;
    }


    public function get defaultWidth():Number {
        return _defaultWidth;
    }
}
}
