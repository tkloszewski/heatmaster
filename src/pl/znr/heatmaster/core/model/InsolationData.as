/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 13.07.13
 * Time: 10:06
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core.model {
public class InsolationData {
    public function InsolationData() {
    }

    private var _southInsolation:Array;
    private var _westEastInsolation:Array;
    private var _northInsolation:Array;

    private var _groundInsolation45:Array;

    public function get groundInsolation45():Array {
        return _groundInsolation45;
    }

    public function set groundInsolation45(value:Array):void {
        _groundInsolation45 = value;
    }

    public function get southInsolation():Array {
        return _southInsolation;
    }

    public function set southInsolation(value:Array):void {
        _southInsolation = value;
    }

    public function get westEastInsolation():Array {
        return _westEastInsolation;
    }

    public function set westEastInsolation(value:Array):void {
        _westEastInsolation = value;
    }

    public function get northInsolation():Array {
        return _northInsolation;
    }

    public function set northInsolation(value:Array):void {
        _northInsolation = value;
    }
}
}
