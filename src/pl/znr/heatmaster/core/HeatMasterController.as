/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 17.06.13
 * Time: 19:32
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
import mx.collections.ArrayList;
import mx.controls.Alert;

import pl.znr.heatmaster.config.CountryItem;

import pl.znr.heatmaster.constants.GlobalValues;
import pl.znr.heatmaster.constants.combo.ConversionUnits;
import pl.znr.heatmaster.core.converter.ConversionData;
import pl.znr.heatmaster.core.converter.ConverterService;
import pl.znr.heatmaster.core.converter.RatioCluster;
import pl.znr.heatmaster.core.converter.RatioClusterFactory;

import pl.znr.heatmaster.ui.IDataContextAware;
import pl.znr.heatmaster.ui.components.IResultDataAware;

//stateful
public class HeatMasterController {

    private var wattsEnergyCalculator:HeatMasterWattsCalculator = new HeatMasterWattsCalculator();
    private var reportDataCalculator:ReportDataCalculator = new ReportDataCalculator();
    private var converterService:ConverterService = new ConverterService();

    private var dataContextListeners:ArrayList = new ArrayList();
    private var resultDataListeners:ArrayList = new ArrayList();

    private var dataContext:DataContext;
    private var processResult:ProcessingResult;

    private var selectedMonth:int = GlobalValues.START_MONTH;

    private var started:Boolean = false;

    public function addDataContextListener(dataContextListener:IDataContextAware):void {
        dataContextListeners.addItem(dataContextListener);
    }

    public function addResultDataListener(resultDataListener:IResultDataAware):void {
        resultDataListeners.addItem(resultDataListener);
    }

    public function getDataContext():DataContext {
        return dataContext;
    }

    public function getProcessResult():ProcessingResult{
        return processResult;
    }

    public function startCalculationWithConfig(dataContext:DataContext):void {
        this.dataContext = dataContext;
        doStartCalculation();
    }

    public function initData(dataContext:DataContext):DataContext {
        for (var i:int = 0; i < dataContextListeners.length; i++) {
            var dataContextListener:IDataContextAware = dataContextListeners.getItemAt(i) as IDataContextAware;
            dataContext = dataContextListener.initData(dataContext);
        }
        return dataContext;
    }

    private function doStartCalculation():void{
        started = true;
        try {
            doCalculationAndPropagateResult();
        } catch (e:Error) {
            Alert.show("Error in calculation " + e.message);
        }
    }

    public function setViewState(dataContext:DataContext,processingResult:ProcessingResult){
        this.dataContext = dataContext;
        this.selectedMonth = dataContext.selectedMonth;
        this.processResult = processingResult;

        setUpView(dataContext);
        propagateResult();
    }

    public function calculateAndSetViewState(dataContext:DataContext):void{
        this.dataContext = dataContext;
        this.selectedMonth = dataContext.selectedMonth;
        this.started = true;

        setUpView(dataContext);
        doCalculationAndPropagateResult();
    }

    public function calculate():void{
        if(started){
            doCalculationAndPropagateResult();
        }
    }

    public function monthChanged(month:int):void{
        this.selectedMonth = month;
        if(started && processResult != null){
            propagateResult();
        }
    }

    public function conversionDataChanged(conversionRequired:Boolean):void {
        if(started && processResult != null){
            if(conversionRequired){
                this.processResult = convertResult(this.processResult,dataContext.conversionData);
                this.processResult = reportDataCalculator.calcReportValues(this.dataContext,this.processResult,dataContext.conversionData);
            }
            propagateResult();
        }
    }

    private function setUpView(dataContext:DataContext):void{
        try {
            for (var i:int = 0; i < dataContextListeners.length; i++) {
                var dataContextListener:IDataContextAware = dataContextListeners.getItemAt(i) as IDataContextAware;
                dataContextListener.setupView(dataContext);
            }
        } catch (e:Error) {
            trace(e.getStackTrace());
            Alert.show("Error in setupView of dataContext: ", e.message);
        }
    }

    private function doCalculation():void {
        try {
            this.processResult = new ProcessingResult();
            this.processResult.dataContext = this.dataContext;
            processResult.wattsEnergyResult = wattsEnergyCalculator.calcEnergyDataWithGaussianBlurring(dataContext);
            this.processResult = convertResult(this.processResult,dataContext.conversionData);

            var tOriginal:Number = dataContext.houseData.tIn;
            dataContext.houseData.tIn = 20;
            processResult.classAwareWattsEnergyResult = wattsEnergyCalculator.calcEnergyDataWithGaussianBlurring(dataContext);
            dataContext.houseData.tIn = tOriginal;

            try {
                this.processResult = reportDataCalculator.calcReportValues(this.dataContext, this.processResult, dataContext.conversionData);
            } catch (e:Error) {
                Alert.show("ReportDataCalculator error: " );
            }

        } catch (e:Error) {
            Alert.show("Calculation error", e.message);
        }
    }

    private function doCalculationAndPropagateResult():void {
        doCalculation();
        propagateResult();
    }

    private function convertResult(processResult:ProcessingResult,conversionData:ConversionData):ProcessingResult {
        try {
            var ratioCluster:RatioCluster = RatioClusterFactory.getMonthlyWattsRatioCluster(conversionData);
            this.processResult.conversionData = conversionData;
            return converterService.convert(processResult, conversionData, ratioCluster);
        } catch (e:Error) {
            Alert.show("Conversion error: " + e.message);
        }
        return processResult;
    }

    private function propagateResult():void {
        try {
            for(var i:int = 0; i < resultDataListeners.length;i++ ){
                var resultDataListener:IResultDataAware = resultDataListeners.getItemAt(i) as IResultDataAware;
                resultDataListener.resultCalculated(processResult,selectedMonth);
            }
        } catch (e:Error) {
            Alert.show("Propagate errro: " + e.getStackTrace() + " " + e.message);
        }
    }



}
}
