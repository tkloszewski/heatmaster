/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 03.06.13
 * Time: 07:33
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare {
import mx.controls.Alert;

import pl.znr.heatmaster.core.model.EnvironmentalData;

public class EnvironmentalDataPreparer {
    public function EnvironmentalDataPreparer() {
    }

    public function prepare(environmentalData:EnvironmentalData):EnvironmentalData{
        var i:int;


        var maxTemp:Number = Number.MIN_VALUE;
        for (i = 0; i < environmentalData.temperatures.length; i++) {
            if (environmentalData.temperatures[i] > maxTemp) {
                maxTemp = environmentalData.temperatures[i];
            }
        }
        environmentalData.tMax = maxTemp;


        var minTemp:Number = Number.MAX_VALUE;
        for (i = 0; i < environmentalData.temperatures.length; i++) {
            if (environmentalData.temperatures[i] < minTemp) {
                minTemp = environmentalData.temperatures[i];
            }
        }
        environmentalData.tMin = minTemp;


        var avgTemp:Number = 0;
        for (i = 0; i < environmentalData.temperatures.length; i++) {
            avgTemp += environmentalData.temperatures[i];
        }
        avgTemp = avgTemp / environmentalData.temperatures.length;
        environmentalData.tAvg = avgTemp;


        environmentalData.tSigma = (environmentalData.tMax - environmentalData.tMin) / 7;

        if(environmentalData.tSigma - Math.floor(environmentalData.tSigma) < 0.5){
           environmentalData.tSigma = Math.floor(environmentalData.tSigma);
        }
        else {
            environmentalData.tSigma = Math.ceil(environmentalData.tSigma)
        }

        return environmentalData;
    }




}
}
