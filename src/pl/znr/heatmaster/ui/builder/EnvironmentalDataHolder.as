/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 18.06.13
 * Time: 21:46
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder {
import flash.utils.Dictionary;

import mx.collections.ArrayCollection;
import mx.controls.Alert;

import pl.znr.heatmaster.core.model.EnvironmentalData;
import pl.znr.heatmaster.core.model.InsolationData;

public class EnvironmentalDataHolder {

    /*
     T[1]:=-9;T[2]:=-6;T[3]:=-3;T[4]:=2;T[5]:=8;T[6]:=12;T[7]:=15;T[8]:=13;T[9]:=8;T[10]:=1;T[11]:=-5;T[12]:=-8;
     Ins[1]:=0.14; Ins[2]:=0.78; Ins[3]:=2.27; Ins[4]:=4.23; Ins[5]:=5.57; Ins[6]:=6.07; Ins[7]:=5.31; Ins[8]:=3.87; Ins[9]:=2.50; Ins[10]:=1.16; Ins[11]:=0.28; Ins[12]:=0.04;


     */

    private static var environmentalDataMap:Dictionary = null;

    private static var rawData:ArrayCollection = new ArrayCollection([
        {country:"pl",
            temperatures:[-2,-1,3,7,13,17,18,17,13,9,3,-1],
            insolationS:[31,51,77,80,88,82,88,90,75,62,35,23],
            insolationWE:[17,31,55,69,89,90,89,80,53,34,16,10],
            insolationN:[13,23,39,46,63,68,68,52,35,21,11,8],
            groundInsolation45:[28,48,81,107,136,132,133,126,94,65,30,19],
            groundTemperatures:[1,1,0,3,8,14,16,17,14,10,6,4]
        },
        {country:"en",temperatures:[-9,-6,-3,2,8,12,15,13,8,1,-5,-8],
            insolationS:[31,51,77,80,88,82,88,90,75,62,35,23],
            insolationWE:[17,31,55,69,89,90,89,80,53,34,16,10],
            insolationN:[13,23,39,46,63,68,68,52,35,21,11,8],
            groundInsolation45:[28,48,81,107,136,132,133,126,94,65,30,19],
            groundTemperatures:[1,1,0,3,8,14,16,17,14,10,6,4]
        }

    ]);


    public function EnvironmentalDataHolder() {
    }

    public static function getEnvironmentalData(country:String):EnvironmentalData {
        try {
            var myEnvironmentalDataMap:Dictionary = getEnvironmentalDataMap();
            trace("prepared environmental data...");
            var environmentalData:EnvironmentalData = myEnvironmentalDataMap[country];
            if (environmentalData == null) {
                environmentalData = environmentalData['pl'];
            }
            return environmentalData;
        } catch (e:Error) {
            Alert.show("Environmental data init error: " + e.getStackTrace());
        }
        return new EnvironmentalData();
    }

    private static function getEnvironmentalDataMap():Dictionary {
        if(environmentalDataMap == null){
            environmentalDataMap = createEnvironmentalDataMap()
        }
        return environmentalDataMap;
    }

    private static function createEnvironmentalDataMap():Dictionary {
        var result:Dictionary = new Dictionary();

        for(var i:int = 0;i < rawData.length;i++){
            var item:Object = rawData.getItemAt(i);
            var environmentalData:EnvironmentalData = new EnvironmentalData();
            environmentalData.temperatures = item.temperatures;
            environmentalData.insolationData = createInsolationData(item);
            environmentalData.groundTemperatures = item.groundTemperatures;
            result[item.country] = environmentalData;
        }

        return result;
    }

    private static function createInsolationData(item:Object):InsolationData {
        var insolationData:InsolationData = new InsolationData();
        insolationData.southInsolation = item.insolationS;
        insolationData.westEastInsolation = item.insolationWE;
        insolationData.northInsolation = item.insolationN;
        insolationData.groundInsolation45 = item.groundInsolation45;
        return insolationData;
    }
}
}
