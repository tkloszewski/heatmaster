/**
 * Created with IntelliJ IDEA.
 * User: Dom
 * Date: 27.01.14
 * Time: 20:50
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.core {
public interface LangChangeListener {
   function langChanged(lang:String):void;

   function initialLangChanged(lang:String):void;
}
}
