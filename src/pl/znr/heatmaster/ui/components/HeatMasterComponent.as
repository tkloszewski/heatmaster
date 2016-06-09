/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 16.06.13
 * Time: 16:05
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.components {

import mx.collections.ArrayCollection;
import mx.collections.ArrayList;
import mx.controls.Alert;
import mx.formatters.NumberBaseRoundType;
import mx.formatters.NumberFormatter;
import mx.utils.StringUtil;

import org.osmf.utils.OSMFStrings;

import pl.znr.heatmaster.core.DataContext;

import pl.znr.heatmaster.ui.HeatMasterChangeListener;
import pl.znr.heatmaster.ui.IDataContextAware;

import spark.components.Group;

public class HeatMasterComponent extends Group implements IHeatMasterListenerAware,IDataContextAware,LangChangeListener{

    protected var heatMasterListener:HeatMasterChangeListener;

    public function HeatMasterComponent() {
    }

    protected function componentCreated():void {

    }

    public function langChanged(lang:String):void {
    }

    public function initialLangChanged(lang:String):void {
    }

    public function initData(dataContext:DataContext):DataContext {
        return dataContext;
    }

    public function setupView(dataContext:DataContext):void {
    }

    public function setHeatMasterListener(heatMasterListener:HeatMasterChangeListener):void {
        // Alert.show(id  + " has injected hm listener");
        this.heatMasterListener = heatMasterListener;
    }

    protected function formatHMValue(value:Number,precision:int = 0,useThousandSeparator:Boolean = false):String{
        var formatter:NumberFormatter = createNearestPrecisionFormatter(precision);
        formatter.useThousandsSeparator = false;
        if (useThousandSeparator) {
            if (value >= 10000) {
                formatter.useThousandsSeparator = true;
                formatter.thousandsSeparatorTo = " ";
                formatter.thousandsSeparatorFrom = " ";
            }
        }
        return formatter.format(value);
    }

    protected function createNearestPrecisionFormatter(precision:int = 0):NumberFormatter {
        var format:NumberFormatter = new NumberFormatter();
        format.precision = precision;
        format.rounding = NumberBaseRoundType.NEAREST;
        return format;
    }

    protected function getComboItemIndex(dataObject:Object,dataItemList:ArrayList):int {
        for (var i:int = 0; i < dataItemList.length; i++) {
            var item:Object = dataItemList.getItemAt(i);
            if (item.data == dataObject) {
                return i;
            }
        }
        //Alert.show("Not found idx...");
        return -1;
    }

    protected function getComboItemIndexForCollection(dataObject:Object,dataItemList:ArrayCollection):int {
        for (var i:int = 0; i < dataItemList.length; i++) {
            var item:Object = dataItemList.getItemAt(i);
            if (item.data == dataObject) {
                return i;
            }
        }
        //Alert.show("Not found idx...");
        return -1;
    }

}
}
