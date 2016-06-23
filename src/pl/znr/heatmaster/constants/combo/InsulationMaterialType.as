/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 04.08.14
 * Time: 20:09
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
import mx.collections.ArrayList;

import pl.znr.heatmaster.config.dictionary.DictionaryConfig;
import pl.znr.heatmaster.config.dictionary.InsulationMaterialTypeConfig;

import pl.znr.heatmaster.constants.combo.InsulationElementType;

public class InsulationMaterialType extends BaseComboObject {
    private static var _values:ArrayList = new ArrayList();

    private var _heatTransferCoefficient:Number;

    private var _labelCode:String;

    public static var STANDARD:InsulationMaterialType = new InsulationMaterialType("hm.insulation.material_type.average",0.040,'hm.dropdown.insulation.average');
    public static var GOOD:InsulationMaterialType = new InsulationMaterialType("hm.insulation.material_type.good",0.036,'hm.dropdown.insulation.good');
    public static var VERY_GOOD:InsulationMaterialType = new InsulationMaterialType("hm.insulation.material_type.very_good",0.032,'hm.dropdown.insulation.very_good');

    function InsulationMaterialType(id:String,heatTransfer:Number,labelCode:String){
        super (id);
        _heatTransferCoefficient = heatTransfer;
        _labelCode = labelCode;
        _values.addItem(this);
    }

    override public function dictionaryInitialized(config:DictionaryConfig):void {
        var insulationMaterialTypeCfg:InsulationMaterialTypeConfig = config.getInsulationMaterialTypeConfigById(getId());
        this.heatTransferCoefficient = insulationMaterialTypeCfg.heatTransfer;
    }

    public static function getMaterialInsulationTypeForHouseStandard(standardType:HouseStandardType):InsulationMaterialType {
        if(standardType == HouseStandardType.OLD_NON_INSULATED || standardType == HouseStandardType.OLD_INSULATED
                || standardType == HouseStandardType.NEW_NORM_WT_2014){
            return InsulationMaterialType.STANDARD;
        }
        else if(standardType == HouseStandardType.ENERGY_SAVING_NF40){
            return InsulationMaterialType.GOOD;
        }
        else if(standardType == HouseStandardType.PASSIVE_NF15 || standardType == HouseStandardType.ADD){
            return InsulationMaterialType.VERY_GOOD;
        }

        return InsulationMaterialType.STANDARD;
    }


    public static function getMaterialInsulationTypeForHeatTransferValue(value:Number):InsulationMaterialType {
        if(isNaN(value)){
           return InsulationMaterialType.STANDARD;
        }
        for (var i:int = 0; i < values.length; i++) {
            var insulationQuality:InsulationMaterialType = values.getItemAt(i) as InsulationMaterialType;
            if (insulationQuality.heatTransferCoefficient == value) {
                return insulationQuality;
            }
        }
        return InsulationMaterialType.STANDARD;
    }

    public static function get values():ArrayList {
        return _values;
    }

    public static function set values(value:ArrayList):void {
        _values = value;
    }

    public function get heatTransferCoefficient():Number {
        return _heatTransferCoefficient;
    }

    public function set heatTransferCoefficient(value:Number):void {
        _heatTransferCoefficient = value;
    }
}
}
