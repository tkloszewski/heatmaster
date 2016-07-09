/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 03.06.13
 * Time: 07:33
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.builder.prepare {
import mx.controls.Alert;

import pl.znr.heatmaster.config.IEnvironmentalDataConfig;

import pl.znr.heatmaster.core.calc.util.TemperatureCalculator;

import pl.znr.heatmaster.core.model.EnvironmentalData;

public class EnvironmentalDataPreparer {
    public function EnvironmentalDataPreparer() {
    }

    public static function applyTemperatureStats(environmentalData:EnvironmentalData):EnvironmentalData{
        environmentalData.tMax = TemperatureCalculator.calcMaxTemperature(environmentalData.temperatures);
        environmentalData.tMin = TemperatureCalculator.calcMinTemperature(environmentalData.temperatures);
        environmentalData.tAvg = TemperatureCalculator.calcAvgTemperature(environmentalData.temperatures);
        environmentalData.tSigma = TemperatureCalculator.calcSigma(environmentalData.temperatures,environmentalData.tMin,environmentalData.tMax);
        return environmentalData;
    }

    public static function prepareFromConfig(envData:EnvironmentalData,envDataConfig:IEnvironmentalDataConfig):EnvironmentalData {
        envData.minCalcTemp = envDataConfig.minCalcTemp;
        envData.temperatures = envDataConfig.temperatures;
        envData.groundTemperatures = envDataConfig.groundTemperatures;
        envData.insolationData.groundInsolation45 = envDataConfig.optimalInsolation;
        envData.insolationData.southInsolation = envDataConfig.insolationS;
        envData.insolationData.northInsolation = envDataConfig.insolationN;
        envData.insolationData.westEastInsolation = envDataConfig.insolationWE;

        envData = applyTemperatureStats(envData);
        return envData;
    }




}
}
