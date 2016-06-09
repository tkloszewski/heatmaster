/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.07.13
 * Time: 21:27
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import flash.filters.BitmapFilterType;

public class FoundationsType {

    public static const TRADITIONAL:int = 1;
    public static const SLAB:int = 2;
    public static const TRADITIONAL_INSULATED:int = 3;

    public function FoundationsType() {
    }

    public static function getUValueForTraditionalType(type:int):Number{
      if(type == TRADITIONAL){
         return 0.75;
      }
      if(type == TRADITIONAL_INSULATED){
          return 0.5;
      }
      return 0.0;
   }

    public static function getTypeForUValue(uValue:Number):int{
        if(uValue == 0.75){
           return TRADITIONAL;
        }
        if(uValue == 0.5){
           return TRADITIONAL_INSULATED;
        }
        return SLAB;
    }

    public static function isFoundationsEnabledForType(fType:int){
        return fType == TRADITIONAL || fType == TRADITIONAL_INSULATED;
    }
}
}
