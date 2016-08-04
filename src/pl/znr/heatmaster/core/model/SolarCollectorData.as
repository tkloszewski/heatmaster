/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 13.07.13
 * Time: 10:55
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import pl.znr.heatmaster.config.dictionary.model.SolarCollectorType;

public class SolarCollectorData {

    private var _collectorType:SolarCollectorType;
    private var _surface:Number = 0;
    private var _count:int;

    public static function createSolarCollectorData(collectorType:SolarCollectorType,surface:Number,count:int = 0):SolarCollectorData{
        var result:SolarCollectorData = new SolarCollectorData();
        result.collectorType = collectorType;
        result.surface = surface;
        result.count = count;
        return result;
    }

    public static function createSolarCollectorDataWithCountCalculated(collectorType:SolarCollectorType,surface:Number):SolarCollectorData{
        var result:SolarCollectorData = new SolarCollectorData();
        result.collectorType = collectorType;
        result.surface = surface;
        result.count = surface/collectorType.unitSurface;
        return result;
    }

    public function SolarCollectorData() {
    }

    public function get collectorType():SolarCollectorType {
        return _collectorType;
    }

    public function set collectorType(value:SolarCollectorType):void {
        _collectorType = value;
    }

    public function get surface():Number {
        return _surface;
    }

    public function set surface(value:Number):void {
        _surface = value;
    }

    public function get count():int {
        return _count;
    }

    public function set count(value:int):void {
        _count = value;
    }


}
}
