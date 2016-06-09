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
    private var uValueMap:Dictionary = new Dictionary();

    public function WindowElementPreparer() {
        uValueMap[WindowsType.ONE_PANE] = 5.2;
        uValueMap[WindowsType.TWO_PANE_OLD] = 2.6;
        uValueMap[WindowsType.TWO_PANE_NEW] = 1.4;
        uValueMap[WindowsType.THREE_PANE] = 0.9;
        uValueMap[WindowsType.THREE_PANE_SPECIAL] = 0.7;
    }


    public function prepare(element:InsulationElement):InsulationElement {
        var windowElement:WindowElement = element as WindowElement;
        if(windowElement.uValue == -1){
            windowElement.uValue = uValueMap[windowElement.windowType];
        }

        if(windowElement.windowType == WindowsType.ONE_PANE){
            windowElement.winGain = 0.85;
        }
        if(windowElement.windowType == WindowsType.TWO_PANE_OLD){
            windowElement.winGain = 0.75;
        }
        if(windowElement.windowType == WindowsType.TWO_PANE_NEW){
            windowElement.winGain = 0.6;
        }
        if(windowElement.windowType == WindowsType.THREE_PANE){
            windowElement.winGain = 0.55;
        }
        if(windowElement.windowType == WindowsType.THREE_PANE_SPECIAL){
            windowElement.winGain = 0.62;
        }

        return windowElement;
    }
}
}
