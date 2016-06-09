/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 02.06.13
 * Time: 22:49
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import pl.znr.heatmaster.core.converter.ConversionData;

public class ProcessingResult {

    private var _dataContext:DataContext;

    private var _conversionData:ConversionData;

    private var _monthlyConvertedData:Array = [];
    private var _yearlyAggregatedConvertedData:ConvertedResult;
    private var _wattsEnergyResult:WattsEnergyResult;
    private var _classAwareWattsEnergyResult:WattsEnergyResult;

    private var _userEnergyConsumption:Number;
    private var _finalEnergyConsumption:Number;
    private var _primaryEnergyConsumption:Number;
    private var _unitSurfaceUserEnergyConsumption:Number;
    private var _unitSurfaceFinalEnergyConsumption:Number;
    private var _unitSurfacePrimaryEnergyConsumption:Number;

    private var _unitSurfaceFinalEnergyClassConsumption:Number;
    private var _unitSurfacePrimaryEnergyClassConsumption:Number;

    private var _yearlyCost:Number;

    public function get conversionData():ConversionData {
        return _conversionData;
    }

    public function set conversionData(value:ConversionData):void {
        _conversionData = value;
    }

    public function get monthlyConvertedData():Array {
        return _monthlyConvertedData;
    }

    public function set monthlyConvertedData(value:Array):void {
        _monthlyConvertedData = value;
    }

    public function get yearlyAggregatedConvertedData():ConvertedResult {
        return _yearlyAggregatedConvertedData;
    }

    public function set yearlyAggregatedConvertedData(value:ConvertedResult):void {
        _yearlyAggregatedConvertedData = value;
    }


    public function get wattsEnergyResult():WattsEnergyResult {
        return _wattsEnergyResult;
    }

    public function set wattsEnergyResult(value:WattsEnergyResult):void {
        _wattsEnergyResult = value;
    }


    public function get finalEnergyConsumption():Number {
        return _finalEnergyConsumption;
    }

    public function set finalEnergyConsumption(value:Number):void {
        _finalEnergyConsumption = value;
    }

    public function get primaryEnergyConsumption():Number {
        return _primaryEnergyConsumption;
    }

    public function set primaryEnergyConsumption(value:Number):void {
        _primaryEnergyConsumption = value;
    }

    public function get yearlyCost():Number {
        return _yearlyCost;
    }

    public function set yearlyCost(value:Number):void {
        _yearlyCost = value;
    }

    public function get unitSurfaceFinalEnergyConsumption():Number {
        return _unitSurfaceFinalEnergyConsumption;
    }

    public function set unitSurfaceFinalEnergyConsumption(value:Number):void {
        _unitSurfaceFinalEnergyConsumption = value;
    }

    public function get unitSurfacePrimaryEnergyConsumption():Number {
        return _unitSurfacePrimaryEnergyConsumption;
    }

    public function set unitSurfacePrimaryEnergyConsumption(value:Number):void {
        _unitSurfacePrimaryEnergyConsumption = value;
    }


    public function get userEnergyConsumption():Number {
        return _userEnergyConsumption;
    }

    public function set userEnergyConsumption(value:Number):void {
        _userEnergyConsumption = value;
    }

    public function get unitSurfaceUserEnergyConsumption():Number {
        return _unitSurfaceUserEnergyConsumption;
    }

    public function set unitSurfaceUserEnergyConsumption(value:Number):void {
        _unitSurfaceUserEnergyConsumption = value;
    }

    public function get unitSurfaceFinalEnergyClassConsumption():Number {
        return _unitSurfaceFinalEnergyClassConsumption;
    }

    public function set unitSurfaceFinalEnergyClassConsumption(value:Number):void {
        _unitSurfaceFinalEnergyClassConsumption = value;
    }

    public function get unitSurfacePrimaryEnergyClassConsumption():Number {
        return _unitSurfacePrimaryEnergyClassConsumption;
    }

    public function set unitSurfacePrimaryEnergyClassConsumption(value:Number):void {
        _unitSurfacePrimaryEnergyClassConsumption = value;
    }


    public function get dataContext():DataContext {
        return _dataContext;
    }

    public function set dataContext(value:DataContext):void {
        _dataContext = value;
    }

    public function get classAwareWattsEnergyResult():WattsEnergyResult {
        return _classAwareWattsEnergyResult;
    }

    public function set classAwareWattsEnergyResult(value:WattsEnergyResult):void {
        _classAwareWattsEnergyResult = value;
    }
}
}
