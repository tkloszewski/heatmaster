/**
 * Created by Dom on 2016-07-06.
 */
package pl.znr.heatmaster.constants {
public class StateConstants {

    public static var INITIAL_STATE:int = 1;
    public static var NEW_SWITCHED:int = 2;
    public static var REFERENCE_SWITCHED:int = 3;

    public function StateConstants() {
    }

    public static function isInitialOrReference(state:int):Boolean{
        return state == INITIAL_STATE || state == REFERENCE_SWITCHED;
    }

    public static function isInReferenceState(state:int):Boolean {
        return state == REFERENCE_SWITCHED;
    }
}
}
