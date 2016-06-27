/**
 * Created by Dom on 2016-06-25.
 */
package pl.znr.heatmaster.core.calc.util {
import flash.utils.Dictionary;

import mx.collections.ArrayCollection;

public class GaussianDistributor {

    private var meanVal:Number;
    private var sigmaVal:Number;
    private var rangeVal:Number;

    private var ratios:Dictionary = new Dictionary();

    public function GaussianDistributor(meanVal:Number, sigmaVal:Number) {
        this.meanVal = meanVal;
        this.sigmaVal = sigmaVal;
        this.rangeVal = 3 * sigmaVal;

        this.createDistribution();
    }

    public function apply(resultProvider:ICalculatedResultProvider):void {
        for(var val:Number = meanVal - rangeVal;val <= meanVal + rangeVal;val++){
            resultProvider.applyRatio(val,ratios[val]);
        }
    }
    
    private function createDistribution():void{
        var sumProbability:Number = 0,chunkRatio:Number,val:Number;

        for(val = meanVal - rangeVal;val <= meanVal + rangeVal;val++){
            chunkRatio = 1/(sigmaVal * Math.sqrt(2*Math.PI)) * Math.exp(-(val - meanVal)*(val - meanVal)/(2*sigmaVal*sigmaVal));
            sumProbability += chunkRatio;
        }

        for(val = meanVal - rangeVal;val <= meanVal + rangeVal;val++){
            var ratio:Number = 1/(sigmaVal * Math.sqrt(2*Math.PI)) * Math.exp(-(val - meanVal)*(val - meanVal)/(2*sigmaVal*sigmaVal))/sumProbability;
            ratios[val] = ratio;
        }
    }
}
}
