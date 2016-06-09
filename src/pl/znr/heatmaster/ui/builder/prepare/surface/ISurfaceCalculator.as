/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 31.05.13
 * Time: 23:05
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.surface {
import pl.znr.heatmaster.core.model.SurfaceData;

public interface ISurfaceCalculator {

    function calcSurface(inputSurface:SurfaceData,type:int):SurfaceData;

    function supportsHouseType(type:int):Boolean;


}
}
