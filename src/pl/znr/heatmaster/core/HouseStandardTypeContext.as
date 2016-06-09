/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 15.05.15
 * Time: 17:30
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import pl.znr.heatmaster.core.model.HouseStandardTypeModel;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.ui.components.balloon.InsulationBaloon;

public class HouseStandardTypeContext {

    private var  _model:HouseStandardTypeModel;
    private var _roofInsulationElement:InsulationElement;
    private var _wallInsulationElement:InsulationElement;
    private var _floorInsulationElement:InsulationElement;


    public function HouseStandardTypeContext(model:HouseStandardTypeModel) {
        _model = model;
    }

    public function get model():HouseStandardTypeModel {
        return _model;
    }

    public function set model(value:HouseStandardTypeModel):void {
        _model = value;
    }

    public function get roofInsulationElement():InsulationElement {
        return _roofInsulationElement;
    }

    public function set roofInsulationElement(value:InsulationElement):void {
        _roofInsulationElement = value;
    }

    public function get wallInsulationElement():InsulationElement {
        return _wallInsulationElement;
    }

    public function set wallInsulationElement(value:InsulationElement):void {
        _wallInsulationElement = value;
    }

    public function get floorInsulationElement():InsulationElement {
        return _floorInsulationElement;
    }

    public function set floorInsulationElement(value:InsulationElement):void {
        _floorInsulationElement = value;
    }
}
}
