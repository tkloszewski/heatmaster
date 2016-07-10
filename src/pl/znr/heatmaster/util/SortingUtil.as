/**
 * Created by Dom on 2016-07-09.
 */
package pl.znr.heatmaster.util {
import mx.collections.ArrayCollection;

import spark.collections.Sort;

import spark.collections.SortField;

public class SortingUtil {
    public function SortingUtil() {
    }

    public static function sortCountryListByName(countryList:ArrayCollection,locale:String):ArrayCollection {
        var sort:Sort = new Sort();
        var sortField:SortField = new SortField("name",false);
        sortField.setStyle("locale",locale);
        sort.fields = [sortField];
        var countryArray:Array = countryList.toArray();
        sort.sort(countryArray);
        return new ArrayCollection(countryArray);
    }
}
}
