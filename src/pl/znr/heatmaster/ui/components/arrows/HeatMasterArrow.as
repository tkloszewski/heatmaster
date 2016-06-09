/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 19.06.13
 * Time: 20:41
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.ui.components.arrows {
import mx.controls.Alert;
import mx.controls.Image;
import mx.formatters.NumberBaseRoundType;
import mx.formatters.NumberFormatter;

import pl.znr.heatmaster.constants.ArrowOrientation;
import pl.znr.heatmaster.constants.ArrowType;
import pl.znr.heatmaster.constants.combo.ConversionUnits;
import pl.znr.heatmaster.core.ConvertedResult;
import pl.znr.heatmaster.core.ProcessingResult;
import pl.znr.heatmaster.core.converter.ConversionData;
import pl.znr.heatmaster.core.converter.ConvertedValue;
import pl.znr.heatmaster.core.converter.ConverterHelper;
import pl.znr.heatmaster.core.converter.RatioCluster;
import pl.znr.heatmaster.core.converter.RatioClusterFactory;
import pl.znr.heatmaster.ui.components.HeatMasterResultComponent;

import spark.components.Label;

public class HeatMasterArrow extends HeatMasterResultComponent{

    protected const PERCENTAGE_LABEL_ID:String = "percentageLabel";
    protected const LABEL_VALUE_GAIN_COLOR:int = 0x669900;
    protected var percentageLabelIdx:int = 0;

    protected var displayPercentage:Boolean = false;

    public function HeatMasterArrow() {
    }

    private var monthReferenceValue:ConvertedValue = null;
    private var yearReferenceValue:ConvertedValue = null;

    private var originalX:Number;
    private var originalY:Number;
    private var originalHeight:Number;
    private var originalWidth:Number;
    protected var widthCoefficient:Number = 0;

    private var oldValue:Number = Number.NaN;
    private var arrowWidth:Number = Number.NaN;

    protected var unitName:String;
    protected var calculatedValue:Number;
    protected var calculatedUnit:int;


    override public function langChanged(lang:String):void {
        displayNewValue(this.calculatedValue,this.calculatedUnit,this.unitName);
    }

    protected function getMonthValue(resultData:ProcessingResult, month:int):Number {
        return Number.NaN;
    }

    protected function getYearValue(resultData:ProcessingResult, month:int):Number {
        return Number.NaN;
    }

    protected function getArrowType():ArrowType {
        return ArrowType.LOSS_ARROW;
    }

    protected function adjustPercentageLabel(percentageLabel:Label):void {

    }

    override public function resultCalculated(resultData:ProcessingResult, month:int):void {
        try {
            var monthlyData:ConvertedResult = resultData.monthlyConvertedData[month] as ConvertedResult;
            var value:Number = getMonthValue(resultData, month);
            var yearValue:Number = getYearValue(resultData, month);

            var conversionData:ConversionData = resultData.conversionData;
            var valueChosen:Number = chooseNewValue(value, yearValue, conversionData.selectedUnit);

            this.setLabelsState(valueChosen);

            var img:Image = setAndGetImageArrow(valueChosen);

            value = Math.abs(value);
            yearValue = Math.abs(yearValue);
            valueChosen = Math.abs(valueChosen);

            this.unitName = conversionData.shortUnitName;
            this.calculatedUnit = conversionData.selectedUnit;
            this.calculatedValue = valueChosen;

            try {
                this.scaleArrow(img, value, yearValue, conversionData);
            } catch (e:Error) {
                Alert.show("Scale arrow error: " + e.message);
            }
            this.displayNewValue(valueChosen, conversionData.selectedUnit, conversionData.shortUnitName);
            try {
                this.setPercentageValue(conversionData.selectedUnit, valueChosen, monthlyData, resultData.yearlyAggregatedConvertedData);
            } catch (e:Error) {
                Alert.show("setPercentage value error:  " + e.message);
            }
        } catch (e:Error) {
            Alert.show("Result calculated error" + e.message + " id " + this.id);
        }
    }

    protected function scaleArrow(image:Image,newMonthValue:Number,newYearValue:Number,conversionData:ConversionData):void {

        if(isNaN(originalHeight) || isNaN(originalWidth)){
            originalX = image.x;
            originalY = image.y;
            originalWidth = image.width;
            originalHeight = image.height;
        }

        var newValue:Number = chooseNewValue(newMonthValue,newYearValue,conversionData.selectedUnit);

        if(getArrowOrientation() == ArrowOrientation.HORIZONTAL){
            image.height = getArrowWidth(newValue,conversionData);
            image.y = (originalY + originalHeight/2) - image.height/2;
        }
        else {
            image.width =  getArrowWidth(newValue,conversionData);
            image.x = (originalX + originalWidth/2) - image.width/2;
        }
    }

    protected function getArrowWidth(value:Number,conversionData:ConversionData):Number{
        var refConversionData:ConversionData = ConversionData.buildConversionDataWithEmissionCoefficient(ConversionUnits.COST_PER_YEAR,0.18,0.201);


        if(!isNaN(oldValue) && oldValue == value){
            if(!isNaN(arrowWidth)){
                return arrowWidth;
            }
        }

        oldValue = value;

        var priceEfficiencyRatio:Number = (conversionData.pricePerKwh)/(refConversionData.pricePerKwh);
        var power:Number = 0.7;

        var ratioCluster:RatioCluster = null;
        if(conversionData.selectedUnit == ConversionUnits.COST_PER_MONTH || conversionData.selectedUnit == ConversionUnits.LOCAL_CURRENCY_COST_PER_MONTH){
            value = value * 3;
        }
        else if(conversionData.selectedUnit != ConversionUnits.COST_PER_YEAR && conversionData.selectedUnit != ConversionUnits.LOCAL_CURRENCY_COTS_PER_YEAR){
            var zlotyRatio:Number = 1.0;
            if(conversionData.selectedUnit == ConversionUnits.ENERGY_KWH_PER_YEAR){
                ratioCluster = RatioClusterFactory.getMonthlyKiloWattsHourRatioCluster(refConversionData);
                zlotyRatio = ratioCluster.toCostRatio;
            }
            else if(conversionData.selectedUnit == ConversionUnits.ENERGY_KWH_PER_MONTH){
                ratioCluster = RatioClusterFactory.getMonthlyKiloWattsHourRatioCluster(refConversionData);
                zlotyRatio = ratioCluster.toCostRatio * 3;
            }
            else if(conversionData.selectedUnit == ConversionUnits.ENERGY_WATTS){
                ratioCluster = RatioClusterFactory.getMonthlyWattsRatioCluster(refConversionData);
                zlotyRatio = ratioCluster.toCostRatio * 3;
            }
            else if(conversionData.selectedUnit == ConversionUnits.ENERGY_GJ_PER_YEAR){
                ratioCluster = RatioClusterFactory.getMonthlyGJRatioCluster(refConversionData);
                zlotyRatio = ratioCluster.toCostRatio;
            }
            else if(conversionData.selectedUnit == ConversionUnits.ENERGY_GJ_PER_MONTH){
                ratioCluster = RatioClusterFactory.getMonthlyGJRatioCluster(refConversionData);
                zlotyRatio = ratioCluster.toCostRatio * 3;
            }
            else if(conversionData.selectedUnit == ConversionUnits.EMISSIONS_PER_YEAR){
                ratioCluster = RatioClusterFactory.getEmissionRatioCluster(refConversionData);
                zlotyRatio = ratioCluster.toCostRatio * 3;
            }
            // Alert.show("toZloty ratio: " + ratioCluster.toZlotyRatio);
            value = value * zlotyRatio;
        }

        if(ConversionUnits.isCostUnit(conversionData.selectedUnit) && !isNaN(conversionData.toPLNCurrencyExchangeRate)){
            value = value * conversionData.toPLNCurrencyExchangeRate;
        }


        var calcValue:Number = Math.min(20000,value);
        calcValue = Math.max(0,calcValue);
        arrowWidth =  Math.round(0.1 * Math.pow(calcValue,0.7));

        if(value > 0){
           arrowWidth = Math.max(3,arrowWidth);
        }

        return arrowWidth;
    }

    private function setLabelsState(value:Number):void {
        var label:Label = getPercentageLabel();
        var valueLabel:Label = getValueLabel();
        var unitLabel:Label = getSeparateUnitNameLabel();
        //label.visible = Math.floor(value) > 0;
        var arrowType:ArrowType = getArrowType();
        var percentageLabelColor:String = getPercentageLabelColor();
        var labelColor:String = "#669900";
        if(arrowType.type == ArrowType.LOSS_TYPE && value >=0){
            labelColor = "#FF6600";
        }
        label.setStyle("color",percentageLabelColor);
        if(valueLabel != null){
            valueLabel.setStyle("color",labelColor);
        }
        if(unitLabel != null){
            unitLabel.setStyle("color",labelColor);
        }
    }

    protected function arrowInitialized():void {
        var label:Label = createPercentageLabel(setAndGetImageArrow(1));
        label.id = PERCENTAGE_LABEL_ID;
        percentageLabelIdx = this.numElements;
        this.addElementAt(label,percentageLabelIdx);
    }

    protected function getPercentageLabel():Label {
        var label:Label =  this.getElementAt(percentageLabelIdx) as Label;
        adjustExistingPercentageLabel(label);
        return label;
    }

    protected function setAndGetImageArrow(value:Number):Image {
        return null;
    }

    protected function adjustExistingPercentageLabel(label:Label):void {

    }

    private function createPercentageLabel(arrowImage:Image):Label {
        var label:Label = new Label();
        label.width = arrowImage.width;
        label.height = arrowImage.height * 0.9;
        label.x = arrowImage.x ;// + arrowImage.width/2 - label.width/2;
        label.y = arrowImage.y + 0.05 * arrowImage.height;// + arrowImage.height/2 - label.height/2;
        label.setStyle("verticalAlign","middle");
        label.setStyle("textAlign","center");
        label.setStyle("color",getPercentageLabelColor());
        label.setStyle("fontSize","11");
        label.setStyle("fontWeight","bold");

        adjustPercentageLabel(label);

        label.text = "";

        return label;

    }

    protected function getPercentageLabelColor():String {
        return "#0C090A";
    }


    protected function getWidthCoefficient():Number {
        return widthCoefficient;
    }

    protected function displayNewValue(value:Number,unit:int,unitNameCode:String):void{
        var unitLabel:Label = getSeparateUnitNameLabel();
        var formattedValue:String = formatValue(value,unit,unitName);
        var hideLabels:Boolean = (formattedValue == "0" || formattedValue == "0.0");

        getValueLabel().visible = !hideLabels;
        if(unitLabel != null){
           unitLabel.visible = !hideLabels;
        }

        setValueLabelOriginalYPosition();

        var unitName:String = resourceManager.getString('hm',unitNameCode);

        if (!hideLabels) {
            if (unitLabel != null) {
                if (ConversionUnits.ENERGY_WATTS == unit) {
                    unitLabel.visible = false;
                    getValueLabel().text = formattedValue + " " + unitName;
                    setValueLabelWithUnitsInlinePosition();
                }
                else {
                    unitLabel.visible = true;
                    unitLabel.text = unitName;
                    getValueLabel().text = formattedValue;
                }
            }
            else {
                getValueLabel().text = formattedValue + " " + unitName;
            }
        }

    }

    protected function setValueLabelOriginalYPosition():void{

    }

    protected function setValueLabelWithUnitsInlinePosition():void {

    }

    protected function setPercentageValue(conversionUnit:int,value:Number,monthlyData:ConvertedResult,yearlyData:ConvertedResult):void{
        if(ConversionUnits.isMonthUnit(conversionUnit) || conversionUnit == ConversionUnits.ENERGY_WATTS){
            this.displayPercentageValue(value,monthlyData.getEnLosses());
        }
        else if(ConversionUnits.isYearUnit(conversionUnit)){
            this.displayPercentageValue(value,yearlyData.getEnLosses());
        }
    }

    protected function displayPercentageValue(singleValue:Number,overallValue:Number):void {
        var percentage:Number = singleValue/overallValue * 100;
        var label:Label = getPercentageLabel();
        label.text = formatHMValue(percentage,1) + "%";
        label.visible = label.text != "0.0%";

    }

    protected function formatValue(value:Number,unit:int,unitName:String):String {
        var decimalNumbers:int = 0;
        if(ConversionUnits.isGJUnit(unit)){
            decimalNumbers = ConversionUnits.isMonthUnit(unit) ? 3 : 2;
        }
        return formatHMValue(value,decimalNumbers,true);
    }

    private function createFormat():NumberFormatter {
        var format:NumberFormatter = new NumberFormatter();
        format.precision = 0;
        format.rounding = NumberBaseRoundType.NEAREST;
        return format;
    }

    protected function getValueLabel():Label {
        return null;
    }

    protected function getMaxScaleRatio():Number {
        return 2;
    }

    protected function getArrowOrientation():int {
        return ArrowOrientation.HORIZONTAL;
    }

    private function getReferenceValue(conversionUnit:int):Number {
        if(ConversionUnits.isMonthUnit(conversionUnit)){
            if(conversionUnit == ConversionUnits.ENERGY_WATTS){
                return monthReferenceValue.wattsValue;
            }
            else if(conversionUnit == ConversionUnits.ENERGY_KWH_PER_MONTH){
                return monthReferenceValue.kWhValue;
            }
            else {
                return monthReferenceValue.zlotyValue;
            }
        }
        else {
            if(conversionUnit == ConversionUnits.ENERGY_KWH_PER_YEAR){
                return yearReferenceValue.kWhValue;
            }
            else {
                return yearReferenceValue.zlotyValue;
            }
        }
    }

    protected function chooseNewValue(monthValue:Number,yearValue:Number,conversionUnit:int):Number {
        if(ConversionUnits.isMonthUnit(conversionUnit)){
            return monthValue;
        }
        else if(ConversionUnits.isYearUnit(conversionUnit)){
            return yearValue;
        }
        else if(conversionUnit == ConversionUnits.ENERGY_WATTS){
            return monthValue;
        }
        return monthValue;
    }

    protected function getSeparateUnitNameLabel():Label {
        return null;
    }
}
}
