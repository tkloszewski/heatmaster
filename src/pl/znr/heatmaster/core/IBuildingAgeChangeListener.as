/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 24.06.13
 * Time: 20:44
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import pl.znr.heatmaster.config.dictionary.model.BuildingAge;

public interface IBuildingAgeChangeListener {

    function buildingAgeChanged(buildingAge:BuildingAge,calculationRequired:Boolean = true):void;
}
}
