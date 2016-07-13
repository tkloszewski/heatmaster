/**
 * Created by Dom on 2016-07-13.
 */
package pl.znr.heatmaster.ui.plot {
import pl.znr.heatmaster.core.converter.ConvertedResult;

public class SplitColumnDataProvider {
    public function SplitColumnDataProvider() {
    }

    public function getColumnData(convertedResult:ConvertedResult,renderMode:RenderMode,yearlyMode:Boolean):SplitColumnData {
        var splitColumnData:SplitColumnData = new SplitColumnData();

        var enVent:Number = convertedResult.enVent;
        var enHeatingSourceLoss:Number = 0;
        var enHeatingSourceGain:Number = 0;
        var enProductGain:Number = convertedResult.enPersonGain + convertedResult.enElectricityGain;
        var enSolGain:Number = convertedResult.enSolGain;
        var enCollectorsGain:Number = convertedResult.enCollectorSolarGain;

        if(renderMode != null && ColumnMode.isAllComponentsMode(renderMode.columnMode)) {
            enVent = enVent + convertedResult.enRecuperator;
            enHeatingSourceLoss = Math.max(0,convertedResult.heatingSourceLoss + convertedResult.warmWaterHeatingSourceLoss);
            enHeatingSourceGain = -Math.min(0,convertedResult.heatingSourceLoss + convertedResult.warmWaterHeatingSourceLoss);
        }
        if(yearlyMode){
            enProductGain = convertedResult.enHeatingProductAggregated;
            enSolGain = convertedResult.enSolGainAggregated;
            enCollectorsGain = Math.min(enCollectorsGain,convertedResult.enWarmWater);
        }

        splitColumnData.enHeatingSourceLoss = enHeatingSourceLoss;
        splitColumnData.enWarmWater = convertedResult.enWarmWater;
        splitColumnData.enWalls = convertedResult.enWalls;
        splitColumnData.enRoof = convertedResult.enRoof;
        splitColumnData.enFloor = convertedResult.enFloor;
        splitColumnData.enWindows = convertedResult.enWindows;
        splitColumnData.enFoundations = convertedResult.enFoundations;
        splitColumnData.enVent = enVent;
        splitColumnData.enAir = convertedResult.enAir;
        splitColumnData.enTightness = convertedResult.enTightness;
        splitColumnData.enSolGain = enSolGain;
        splitColumnData.enProductGain = enProductGain;
        splitColumnData.enCollectorsGain = enCollectorsGain;
        splitColumnData.enHeatingSourceGain = enHeatingSourceGain;

        splitColumnData.insulationAndWarmWaterGroup = splitColumnData.enHeatingSourceLoss + splitColumnData.enWarmWater +
                splitColumnData.enWalls + splitColumnData.enRoof + splitColumnData.enFloor + splitColumnData.enWindows +
                splitColumnData.enFoundations;

        splitColumnData.ventilationGroup = splitColumnData.enVent + splitColumnData.enTightness + splitColumnData.enSolGain;
        splitColumnData.enGainsGroup = splitColumnData.enSolGain + splitColumnData.enProductGain + splitColumnData.enCollectorsGain +
                splitColumnData.enHeatingSourceGain;

        splitColumnData.enBalance = Math.max(0,splitColumnData.insulationAndWarmWaterGroup + splitColumnData.ventilationGroup - splitColumnData.enGainsGroup);

        return splitColumnData;
    }
}
}
