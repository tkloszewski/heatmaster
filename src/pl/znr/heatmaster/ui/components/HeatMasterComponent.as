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
import mx.collections.IList;
import mx.controls.Alert;
import mx.controls.ComboBase;
import mx.formatters.NumberBaseRoundType;
import mx.formatters.NumberFormatter;
import mx.utils.StringUtil;

import org.osmf.utils.OSMFStrings;

import pl.znr.heatmaster.config.BusinessConfiguration;

import pl.znr.heatmaster.config.BusinessConfigurationReaderListener;

import pl.znr.heatmaster.constants.StateConstants;
import pl.znr.heatmaster.constants.combo.BaseComboObject;

import pl.znr.heatmaster.core.DataContext;
import pl.znr.heatmaster.core.IHeatMasterListenerAware;
import pl.znr.heatmaster.core.LangChangeListener;
import pl.znr.heatmaster.core.StateDataContext;

import pl.znr.heatmaster.core.HeatMasterChangeListener;
import pl.znr.heatmaster.core.IDataContextAware;
import pl.znr.heatmaster.core.state.CalculationStateController;
import pl.znr.heatmaster.locale.LangHelper;
import pl.znr.heatmaster.ui.components.popup.HeatingSourceTypeItem;
import pl.znr.heatmaster.util.HeatMasterFormatter;

import spark.components.Group;

public class HeatMasterComponent extends Group implements IHeatMasterListenerAware,IDataContextAware,LangChangeListener,BusinessConfigurationReaderListener{

    protected var calculationStateController:CalculationStateController;
    protected var heatMasterListener:HeatMasterChangeListener;

    public function HeatMasterComponent() {
    }

    public function configurationRead(businessConfiguration:BusinessConfiguration):void {
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

    public function setupReferenceView(stateDataContext:StateDataContext):void {
        var currentDataContext:DataContext = stateDataContext.getCurrentDataContext();
        setupView(currentDataContext);
    }

    public function setHeatMasterListener(heatMasterListener:HeatMasterChangeListener):void {
        this.heatMasterListener = heatMasterListener;
    }

    public function setCalculationStateController(calculationStateController:CalculationStateController):void {
         this.calculationStateController = calculationStateController;
    }

    protected function formatHMValue(value:Number,precision:int = 0,useThousandSeparator:Boolean = false):String{
        return HeatMasterFormatter.formatHMValue(value,precision,useThousandSeparator);
    }

    protected function toComboObjectList(comboItems:ArrayCollection):ArrayCollection {
        var result:ArrayCollection = new ArrayCollection();
        for(var i:int = 0;i < comboItems.length;i++){
            var comboObject:BaseComboObject = comboItems.getItemAt(i) as BaseComboObject;
            var item:Object = {
                name:comboObject.name,
                data:comboObject
            };
            result.addItem(item);
        }
        return result;
    }

    protected function translateComboItems(comboItems:ArrayCollection,lang:String):ArrayCollection {
        for(var i:int = 0;i < comboItems.length;i++){
            var item:Object = comboItems.getItemAt(i);
            if(item.data is BaseComboObject) {
                var comboObject:BaseComboObject = item.data as BaseComboObject;
                item = translateComboItem(item,comboObject,lang);
            }
            else if(item.data is HeatingSourceTypeItem){
                var heatingSourceItem:HeatingSourceTypeItem = item.data as HeatingSourceTypeItem;
                item = translateComboItem(item,heatingSourceItem.type,lang);
            }
        }
        return comboItems;
    }

    protected function translateComboItem(item:Object,comboObject:BaseComboObject,lang:String):Object {
        if (comboObject.labelKey != null) {
            item.name = resourceManager.getString('hm', comboObject.labelKey);
        }
        else {
            item.name = LangHelper.isPolishLang(lang) ? comboObject.plName : comboObject.enName;
        }
        return item;
    }

    protected function translateComboItemsAndRefresh(comboItems:ArrayCollection,lang:String):ArrayCollection {
        comboItems = translateComboItems(comboItems,lang);
        comboItems.refresh();
        return comboItems;
    }

    protected function getComboItemIndex(dataObject:Object,dataItemList:ArrayList):int {
        for (var i:int = 0; i < dataItemList.length; i++) {
            var item:Object = dataItemList.getItemAt(i);
            if (item.data == dataObject) {
                return i;
            }
        }
        return -1;
    }

    protected function getComboItemIndexForCollection(dataObject:Object,dataItemList:ArrayCollection):int {
        for (var i:int = 0; i < dataItemList.length; i++) {
            var item:Object = dataItemList.getItemAt(i);
            if (item.data == dataObject) {
                return i;
            }
        }
        return -1;
    }

    protected function getComboItemIndexForCollectionById(id:String,dataItemList:IList):int {
        for (var i:int = 0; i < dataItemList.length; i++) {
            var item:Object = dataItemList.getItemAt(i);
            var data:BaseComboObject = item.data as BaseComboObject;
            if (data.id == id) {
                return i;
            }
        }
        return -1;
    }

}
}
