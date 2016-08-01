/**
 * Created by Dom on 2016-08-01.
 */
package pl.znr.heatmaster.ui.components.button {
import pl.znr.heatmaster.ui.components.skins.ImageButtonSkin;

import spark.components.Button;

[Style(name="upImage", inherit="no", type="Class")]
[Style(name="downImage", inherit="no", type="Class")]
[Style(name="overImage", inherit="no", type="Class")]
[Style(name="disabledImage", inherit="no", type="Class")]
public class ImageSkinnableButton extends Button{
    public function ImageSkinnableButton()
    {
        super();
        setStyle("skinClass", ImageButtonSkin);
    }
}
}
