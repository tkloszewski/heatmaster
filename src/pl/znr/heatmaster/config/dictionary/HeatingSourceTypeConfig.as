/**
 * Created by Dom on 2016-07-29.
 */
package pl.znr.heatmaster.config.dictionary {
import flash.utils.Dictionary;

import mx.collections.ArrayCollection;

public class HeatingSourceTypeConfig {

    private var _heatingSourceTypes:Dictionary;

    private var _detachedHeatingSourceTypes:ArrayCollection;
    private var _multiFamilyHeatingSourceTypes:ArrayCollection;

    private var _warmWaterDetachedHeatingSourceTypes:ArrayCollection;
    private var _warmWaterMultiFamilyHeatingSourceTypes:ArrayCollection;

    private var _detachedHeatingSelectedIndex:int;
    private var _warmWaterDetachedSelectedIndex:int;
    private var _multiFamilySelectedIndex:int;
    private var _warmWaterMultiFamilySelectedIndex:int;

    public function HeatingSourceTypeConfig() {
    }

    public function get detachedHeatingSelectedIndex():int {
        return _detachedHeatingSelectedIndex;
    }

    public function set detachedHeatingSelectedIndex(value:int):void {
        _detachedHeatingSelectedIndex = value;
    }

    public function get warmWaterDetachedSelectedIndex():int {
        return _warmWaterDetachedSelectedIndex;
    }

    public function set warmWaterDetachedSelectedIndex(value:int):void {
        _warmWaterDetachedSelectedIndex = value;
    }

    public function get multiFamilySelectedIndex():int {
        return _multiFamilySelectedIndex;
    }

    public function set multiFamilySelectedIndex(value:int):void {
        _multiFamilySelectedIndex = value;
    }

    public function get warmWaterMultiFamilySelectedIndex():int {
        return _warmWaterMultiFamilySelectedIndex;
    }

    public function set warmWaterMultiFamilySelectedIndex(value:int):void {
        _warmWaterMultiFamilySelectedIndex = value;
    }

    public function get heatingSourceTypes():Dictionary {
        return _heatingSourceTypes;
    }

    public function set heatingSourceTypes(value:Dictionary):void {
        _heatingSourceTypes = value;
    }

    public function get detachedHeatingSourceTypes():ArrayCollection {
        return _detachedHeatingSourceTypes;
    }

    public function set detachedHeatingSourceTypes(value:ArrayCollection):void {
        _detachedHeatingSourceTypes = value;
    }

    public function get multiFamilyHeatingSourceTypes():ArrayCollection {
        return _multiFamilyHeatingSourceTypes;
    }

    public function set multiFamilyHeatingSourceTypes(value:ArrayCollection):void {
        _multiFamilyHeatingSourceTypes = value;
    }

    public function get warmWaterDetachedHeatingSourceTypes():ArrayCollection {
        return _warmWaterDetachedHeatingSourceTypes;
    }

    public function set warmWaterDetachedHeatingSourceTypes(value:ArrayCollection):void {
        _warmWaterDetachedHeatingSourceTypes = value;
    }

    public function get warmWaterMultiFamilyHeatingSourceTypes():ArrayCollection {
        return _warmWaterMultiFamilyHeatingSourceTypes;
    }

    public function set warmWaterMultiFamilyHeatingSourceTypes(value:ArrayCollection):void {
        _warmWaterMultiFamilyHeatingSourceTypes = value;
    }
}
}
