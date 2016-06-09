/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 28.07.13
 * Time: 18:10
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster {
import flash.events.ProgressEvent;

import mx.preloaders.SparkDownloadProgressBar;

public class CustomPreloader extends SparkDownloadProgressBar{

    [Embed(source="/pl/znr/heatmaster/assets/images/logo.png")]
    [Bindable]
    private var imgClass:Class;

    public function CustomPreloader() {
    }

    override public function get backgroundImage():Object{
        return super.backgroundImage;
    }

    override public function get backgroundSize():String{
        return "400";
    }

    override protected function showDisplayForInit(elapsedTime:int,
                                                   count:int):Boolean {
        return true;
    }


    override public function get backgroundColor():uint {
        return 0x000000;
    }


    override public function set backgroundImage(value:Object):void {
        super.backgroundImage = value;
       // super.backgroundImage.y = 10;
    }

    override protected function showDisplayForDownloading(
            elapsedTime:int, event:ProgressEvent):Boolean {
        return true;
    }



}
}
