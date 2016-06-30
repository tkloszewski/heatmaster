/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 21.08.13
 * Time: 23:06
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import flash.net.SharedObject;
import flash.net.registerClassAlias;

import mx.controls.Alert;

import pl.znr.heatmaster.constants.combo.BuildingAge;
import pl.znr.heatmaster.constants.combo.DoorType;

import pl.znr.heatmaster.constants.combo.HeatingSourceType;
import pl.znr.heatmaster.constants.combo.SolarCollectorType;
import pl.znr.heatmaster.constants.combo.WarmWaterDistribution;
import pl.znr.heatmaster.constants.combo.WarmWaterStorage;
import pl.znr.heatmaster.core.FlatDataContext;

import pl.znr.heatmaster.core.converter.ConversionData;
import pl.znr.heatmaster.core.model.EnvironmentalData;
import pl.znr.heatmaster.core.model.HeatingSourceData;
import pl.znr.heatmaster.core.model.HouseData;
import pl.znr.heatmaster.core.model.InsolationData;
import pl.znr.heatmaster.core.model.InsulationElement;
import pl.znr.heatmaster.core.model.SolarCollectorData;
import pl.znr.heatmaster.core.model.SurfaceData;
import pl.znr.heatmaster.core.model.VentilationData;
import pl.znr.heatmaster.core.model.WarmWaterData;
import pl.znr.heatmaster.core.model.WindowElement;

public class CachedDataContextManager {

    private static var UNIQUE_NAME:String = "pl.znr.heatmaster.cookie"

    private var dataContextValidator:DataContextValidator = new DataContextValidator();

    public function CachedDataContextManager() {
       registerClassAliases();
    }

    public function clearCache():void {
        var so:SharedObject = SharedObject.getLocal(UNIQUE_NAME);
        so.clear();
    }

    public function readCache():DataContext {
        var result:DataContext = null;

        var so:SharedObject = SharedObject.getLocal(UNIQUE_NAME);
        if(so.data.hasOwnProperty("hmData")){
            var hmData:Object = so.data.hmData;
            if(hmData is DataContext){
                return hmData as DataContext;
            }
            else if(hmData is Array){
                var array:Array = hmData as Array;
            }
            else if(hmData is FlatDataContext){
                var flatDataContext:FlatDataContext = hmData as FlatDataContext;
                var cachedDataContext:DataContext = null;
                try {
                    cachedDataContext = FlatDataContextBuilder.buildDataContext(flatDataContext);
                    dataContextValidator.validate(cachedDataContext);
                } catch (e:Error) {
                    cachedDataContext = null;
                    //Alert.show("Error building-validating flashDataContext: " + e.message);
                    trace("Error building-validating flashDataContext: " + e.message);
                }
                result = cachedDataContext;
            }
        }
        if (result == null) {
            trace("No hmData in sharedObject");
        }
        return result;
    }

    public function writeCache(dataContext:DataContext):void {
        var so:SharedObject = SharedObject.getLocal(UNIQUE_NAME);
        var flatDataContext:FlatDataContext = new FlatDataContext();

        try {
            flatDataContext = FlatDataContextBuilder.buildFlatDataContext(dataContext);
        } catch (e:Error) {
            Alert.show("Error building flatDataContext: " + e.message);
        }
        //flatDataContext.groundTemperatures = dataContext.environmentalData.groundTemperatures.slice();
        so.data.hmData = flatDataContext;
        var result:String = so.flush();
        trace("Written to cache...")
    }

    private function registerClassAliases():void {
        registerClassAlias("pl.znr.heatmaster.core.FlatDataContext",FlatDataContext);
    }

}
}
