/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 22.08.13
 * Time: 18:11
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.constants.combo {
public class BaseComboObject {

    private var _id:String;

    public function BaseComboObject(id:String) {
        _id = id;
    }

    public function getId():String {
        return _id;
    }
}
}
