/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 13.07.13
 * Time: 13:55
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import mx.collections.ArrayList;

public class WarmWaterDistribution extends BaseComboObject{

    private static var items:ArrayList = new ArrayList();

    private var _efficiency:Number;

    public static var WELL_ISOLATED_PIPES:WarmWaterDistribution = new WarmWaterDistribution("1",0.95);
    public static var PLASTIC_PIPES:WarmWaterDistribution = new WarmWaterDistribution("2",0.85);
    public static var POOR_ISOLATED_PIPES:WarmWaterDistribution = new WarmWaterDistribution("3",0.60);
    public static var WELL_ISOLATED_AUTOMATIC_PIPES:WarmWaterDistribution = new WarmWaterDistribution("4",0.70);
    public static var NOT_ISOLATED_PIPES:WarmWaterDistribution = new WarmWaterDistribution("5",0.50);

    public static function getWarmWaterDistributionById(id:String):WarmWaterDistribution {
        for(var i:int = 0;i < items.length;i++){
            var warmWaterDistribution:WarmWaterDistribution = items.getItemAt(i) as WarmWaterDistribution;
            if(warmWaterDistribution.getId() == id){
                return warmWaterDistribution;
            }
        }
        return null;
    }


    public function WarmWaterDistribution(id:String,efficiency:Number) {
        super(id);
        _efficiency = efficiency;

        items.addItem(this);
    }

    public function get efficiency():Number {
        return _efficiency;
    }

}
}
