/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 18.07.13
 * Time: 00:35
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.util {
import mx.collections.ArrayList;

import pl.znr.heatmaster.constants.EnergyClass;

public class EnergyClassHelper {

    private static  var energyClasses:ArrayList = new ArrayList();
    private static var instance:EnergyClassHelper = new EnergyClassHelper();

    function EnergyClassHelper() {
        energyClasses.addItem(new EnergyClass(250,Number.MAX_VALUE,"F", "hm.label.energy_class.very_poor","#7F0000"));
        energyClasses.addItem(new EnergyClass(150,250,"E", "hm.label.energy_class.poor","#E80000"));
        energyClasses.addItem(new EnergyClass(100,150,"D", "hm.label.energy_class.average","#F4007A"));
        energyClasses.addItem(new EnergyClass(80,100,"C", "hm.label.energy_class.saving.average","#FFFF00"));
        energyClasses.addItem(new EnergyClass(45,80,"B", "hm.label.energy_class.saving","#99BB31"));
        energyClasses.addItem(new EnergyClass(25,45,"A", "hm.label.energy_class.saving.very_good","#5BC117"));
        energyClasses.addItem(new EnergyClass(15,25,"A+","hm.label.energy_class.low","#008000"));
        energyClasses.addItem(new EnergyClass(0,15,"",  "hm.label.energy_class.passive","green",true));
    }

    public static function getEnergyClass(value:Number):EnergyClass {
        trace("Getting nergy class for value: " + value);
        for(var i:int = 0;i < energyClasses.length;i++){
            var energyClass:EnergyClass = energyClasses.getItemAt(i) as EnergyClass;
            if(energyClass.contains(value)){
                return energyClass;
            }
        }
        return null;
    }

}
}
