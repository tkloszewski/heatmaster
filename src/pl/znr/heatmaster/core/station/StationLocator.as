/**
 * Created by Dom on 2016-06-21.
 */
package pl.znr.heatmaster.core.station {
import mx.collections.ArrayCollection;

import pl.znr.heatmaster.config.StationItem;

import spark.collections.Sort;

public class StationLocator {

    private var stationList:ArrayCollection;
    private var sort:Sort;

    public function StationLocator(stationList:ArrayCollection) {
        this.stationList = stationList;
        sort = new Sort();
        sort.compareFunction = compareDistance;
    }

    public function findNearestStations(position:Position,limit:int = 0): ArrayCollection {
        var result:ArrayCollection = new ArrayCollection();

        var nearestStations:ArrayCollection = doFindNearestStations(position);
        var maxElements:int = limit > 0 ? Math.min(nearestStations.length,limit) : nearestStations.length;
        for(var i:int = 0; i < maxElements;i++){
            result.addItem(nearestStations.getItemAt(i));
        }

        return result;
    }

    public function findNearestStation(position:Position):StationDistance {
        var stationDistances:Array = calcDistances(position).toArray();
        var minDistanceStation:StationDistance = stationDistances[0];
        for(var i:int = 1; i < stationDistances.length; i++){
            var stationDistance:StationDistance = stationDistances[i] as StationDistance;
            if(minDistanceStation.distance > stationDistance.distance){
               minDistanceStation = stationDistance;
            }
        }
        return minDistanceStation;
    }


    private function doFindNearestStations(position:Position):ArrayCollection {
        var result:ArrayCollection = new ArrayCollection();
        var stationDistances:Array = calcDistances(position).toArray();

        sort.sort(stationDistances);

        for(var i:int = 0; i < stationDistances.length; i++){
            var stationDistance:StationDistance = stationDistances[i] as StationDistance;
            result.addItem(stationDistance);
        }
        return result;
    }

    private function calcDistances(position:Position):ArrayCollection {
        var result:ArrayCollection = new ArrayCollection();
        for(var i:int =0; i< stationList.length; i++ ){
            var stationItem:StationItem = stationList.getItemAt(i) as StationItem;
            var stationDistance:StationDistance = new StationDistance(position,stationItem);
            result.addItem(stationDistance);
        }
        return result;
    }

    private function compareDistance(a:Object,b:Object,fields:Array = null):int {
        var stationDistance1:StationDistance = a as StationDistance;
        var stationDistance2:StationDistance = b as StationDistance;

        if(stationDistance1.distance == stationDistance2.distance){
           return 0;
        }
        if(stationDistance1.distance < stationDistance2.distance){
            return -1;
        }
        return 1;
    }



}
}
