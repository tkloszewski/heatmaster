/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 25.05.13
 * Time: 19:30
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare.element {
import flash.utils.Dictionary;

import mx.controls.Alert;

import pl.znr.heatmaster.constants.combo.WindowsType;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.core.model.WindowElement;

public class WindowElementPreparer implements IElementPreparer{

    public function WindowElementPreparer() {

    }


    public function prepare(element:InsulationElement):InsulationElement {
        var windowElement:WindowElement = element as WindowElement;

        windowElement.uValue = windowElement.windowsType.uValue;
        windowElement.winGain = windowElement.windowsType.winGain;

        return windowElement;
    }
}
}
