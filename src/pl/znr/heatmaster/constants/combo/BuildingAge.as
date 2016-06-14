/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 24.06.13
 * Time: 20:20
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import mx.collections.ArrayList;

public class BuildingAge extends BaseComboObject{

    private static var items:ArrayList = new ArrayList();

    public static var UP_TO_1984:BuildingAge =        new BuildingAge("1",1.4,0.9,0.5,2.6);
    public static var BETWEEN_1984_1993:BuildingAge = new BuildingAge("2",0.75,0.5,0.5,2.6);
    public static var BETWEEN_1993_2004:BuildingAge = new BuildingAge("3",0.65,0.3,0.5,2);
    public static var BETWEEN_2004_2010:BuildingAge = new BuildingAge("4",0.45,0.3,0.5,1.6);
    public static var BETWEEN_2010_2013:BuildingAge = new BuildingAge("5",0.35,0.25,0.5,1.4);

    //private var _id:String;

    private var _uWalls:Number;
    private var _uRoof:Number;
    private var _uFloor:Number;
    private var _uWindows:Number;

    public static function getBuildingAgeById(id:String):BuildingAge {
        for(var i:int = 0;i < items.length;i++){
            var buildingAge:BuildingAge = items.getItemAt(i) as BuildingAge;
            if(buildingAge.getId() == id){
               return buildingAge;
            }
        }
        return null;
    }

    public function BuildingAge(_id:String,uWalls:Number, uRoof:Number, uFloor:Number, uWindows:Number) {
        super(_id);
        _uWalls = uWalls;
        _uRoof = uRoof;
        _uFloor = uFloor;
        _uWindows = uWindows;

        items.addItem(this);
    }

    public function get uWalls():Number {
        return _uWalls;
    }

    public function get uFloor():Number {
        return _uFloor;
    }

    public function get uRoof():Number {
        return _uRoof;
    }

    public function get uWindows():Number {
        return _uWindows;
    }

}
}
