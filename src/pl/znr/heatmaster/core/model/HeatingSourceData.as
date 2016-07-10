/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.06.13
 * Time: 12:11
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
import pl.znr.heatmaster.constants.combo.HeatingSourceType;

public class HeatingSourceData {

    private var _heatingType:HeatingSourceType;
    private var _heatingEfficiency:Number;
    private var _pricePerkWh:Number;
    private var _naturalUnitPrice:Number;
    private var _calorificValue:Number;

    private var _waterHeatingType:HeatingSourceType;
    private var _waterHeatingEfficiency:Number;
    private var _priceWaterPerkWh:Number;

    private var _finalToPrimaryCoefficient:Number;
    private var _warmWaterFinalToPrimaryCoefficient:Number;

    private var _emissionCoefficient:Number;
    private var _waterEmissionCoefficient:Number;

    public function HeatingSourceData() {
    }


    public function get pricePerkWh():Number {
        return _pricePerkWh;
    }

    public function set pricePerkWh(value:Number):void {
        _pricePerkWh = value;
    }

    public function get calorificValue():Number {
        return _calorificValue;
    }

    public function set calorificValue(value:Number):void {
        _calorificValue = value;
    }

    public function get heatingType():HeatingSourceType {
        return _heatingType;
    }

    public function set heatingType(value:HeatingSourceType):void {
        _heatingType = value;
    }

    public function get heatingEfficiency():Number {
        return _heatingEfficiency;
    }

    public function set heatingEfficiency(value:Number):void {
        _heatingEfficiency = value;
    }

    public function get priceWaterPerkWh():Number {
        return _priceWaterPerkWh;
    }

    public function set priceWaterPerkWh(value:Number):void {
        _priceWaterPerkWh = value;
    }

    public function get waterHeatingType():HeatingSourceType {
        return _waterHeatingType;
    }

    public function set waterHeatingType(value:HeatingSourceType):void {
        _waterHeatingType = value;
    }

    public function get waterHeatingEfficiency():Number {
        return _waterHeatingEfficiency;
    }

    public function set waterHeatingEfficiency(value:Number):void {
        _waterHeatingEfficiency = value;
    }


    public function get finalToPrimaryCoefficient():Number {
        return _finalToPrimaryCoefficient;
    }

    public function set finalToPrimaryCoefficient(value:Number):void {
        _finalToPrimaryCoefficient = value;
    }

    public function get warmWaterFinalToPrimaryCoefficient():Number {
        return _warmWaterFinalToPrimaryCoefficient;
    }

    public function set warmWaterFinalToPrimaryCoefficient(value:Number):void {
        _warmWaterFinalToPrimaryCoefficient = value;
    }

    public function get emissionCoefficient():Number {
        return _emissionCoefficient;
    }

    public function set emissionCoefficient(value:Number):void {
        _emissionCoefficient = value;
    }

    public function get waterEmissionCoefficient():Number {
        return _waterEmissionCoefficient;
    }

    public function set waterEmissionCoefficient(value:Number):void {
        _waterEmissionCoefficient = value;
    }


    public function get naturalUnitPrice():Number {
        return _naturalUnitPrice;
    }

    public function set naturalUnitPrice(value:Number):void {
        _naturalUnitPrice = value;
    }
}
}
