/**
 * Created with IntelliJ IDEA.
 * User: Tomek
 * Date: 18.06.13
 * Time: 19:58
 * To change this template use File | Settings | File Templates.
 */
package pl.znr.heatmaster.util {
import mx.collections.ArrayCollection;
import mx.collections.ArrayList;

import pl.znr.heatmaster.constants.combo.HouseType;

public class HouseTypeHelper {
    public function HouseTypeHelper() {
    }

    private static var blockTypes:ArrayCollection = new ArrayCollection([HouseType.BLOCK_CENTER,HouseType.BLOCK_EDGE_RIGHT,HouseType.BLOCK_EDGE_LEFT,
        HouseType.BLOCK_CENTER_UPPER,HouseType.BLOCK_CENTER_LOWER,
        HouseType.BLOCK_UPPER_RIGHT,HouseType.BLOCK_UPPER_LEFT,
        HouseType.BLOCK_LOWER_LEFT,HouseType.BLOCK_LOWER_RIGHT,

        HouseType.BLOCK_DOUBLE_CENTER,HouseType.BLOCK_DOUBLE_EDGE_RIGHT,HouseType.BLOCK_DOUBLE_EDGE_LEFT,
        HouseType.BLOCK_DOUBLE_CENTER_UPPER,HouseType.BLOCK_DOUBLE_CENTER_LOWER,
        HouseType.BLOCK_DOUBLE_UPPER_RIGHT,HouseType.BLOCK_DOUBLE_UPPER_LEFT,
        HouseType.BLOCK_DOUBLE_LOWER_LEFT,HouseType.BLOCK_DOUBLE_LOWER_RIGHT]);

    private static var multiFamilyTypes:ArrayCollection = new ArrayCollection(
            [HouseType.MULTI_FAMILY_CENTER,HouseType.MULTI_FAMILY_FIRST_FLOOR,
                HouseType.MULTI_FAMILY_UPPER]);

    private static var terraceTypes:ArrayCollection = new ArrayCollection(
            [HouseType.TERRACED_CENTER,HouseType.TERRACED_LEFT,HouseType.TERRACED_RIGHT]
    );

    private static var detachedTypes:ArrayCollection = new ArrayCollection(
            [HouseType.DETACHED]
    );


    public static function isBlockType(type:int):Boolean {
        return type == HouseType.BLOCK_CENTER || type == HouseType.BLOCK_CENTER_UPPER ||
                type == HouseType.BLOCK_CENTER_LOWER || type == HouseType.BLOCK_EDGE_RIGHT ||
                type == HouseType.BLOCK_EDGE_LEFT || type == HouseType.BLOCK_LOWER_RIGHT ||
                type == HouseType.BLOCK_LOWER_LEFT || type == HouseType.BLOCK_UPPER_RIGHT ||
                type == HouseType.BLOCK_UPPER_LEFT || type == HouseType.BLOCK_UPPER_RIGHT ||

                type == HouseType.BLOCK_DOUBLE_CENTER || type == HouseType.BLOCK_DOUBLE_CENTER_UPPER ||
                type == HouseType.BLOCK_DOUBLE_CENTER_LOWER || type == HouseType.BLOCK_DOUBLE_EDGE_RIGHT ||
                type == HouseType.BLOCK_DOUBLE_EDGE_LEFT || type == HouseType.BLOCK_DOUBLE_LOWER_RIGHT ||
                type == HouseType.BLOCK_DOUBLE_LOWER_LEFT || type == HouseType.BLOCK_DOUBLE_UPPER_RIGHT ||
                type == HouseType.BLOCK_DOUBLE_UPPER_LEFT || type == HouseType.BLOCK_DOUBLE_UPPER_RIGHT;
    }

    public static function isThinBlock(type:int):Boolean {
        return type == HouseType.BLOCK_CENTER || type == HouseType.BLOCK_CENTER_UPPER ||
                type == HouseType.BLOCK_CENTER_LOWER || type == HouseType.BLOCK_EDGE_RIGHT ||
                type == HouseType.BLOCK_EDGE_LEFT || type == HouseType.BLOCK_LOWER_RIGHT ||
                type == HouseType.BLOCK_LOWER_LEFT || type == HouseType.BLOCK_UPPER_RIGHT ||
                type == HouseType.BLOCK_UPPER_LEFT || type == HouseType.BLOCK_UPPER_RIGHT;
    }

    public static function isDoubleBlock(type:int):Boolean {
        return type == HouseType.BLOCK_DOUBLE_CENTER || type == HouseType.BLOCK_DOUBLE_CENTER_UPPER ||
                type == HouseType.BLOCK_DOUBLE_CENTER_LOWER || type == HouseType.BLOCK_DOUBLE_EDGE_RIGHT ||
                type == HouseType.BLOCK_DOUBLE_EDGE_LEFT || type == HouseType.BLOCK_DOUBLE_LOWER_RIGHT ||
                type == HouseType.BLOCK_DOUBLE_LOWER_LEFT || type == HouseType.BLOCK_DOUBLE_UPPER_RIGHT ||
                type == HouseType.BLOCK_DOUBLE_UPPER_LEFT || type == HouseType.BLOCK_DOUBLE_UPPER_RIGHT;
    }

    public static function isGroundType(type:int):Boolean {
        return  type == HouseType.BLOCK_CENTER_LOWER || type == HouseType.BLOCK_LOWER_LEFT ||
                type == HouseType.BLOCK_LOWER_RIGHT || type == HouseType.BLOCK_DOUBLE_CENTER_LOWER ||
                type == HouseType.BLOCK_DOUBLE_LOWER_RIGHT || type == HouseType.BLOCK_DOUBLE_LOWER_RIGHT ||
                type == HouseType.TERRACED_CENTER || type == HouseType.TERRACED_LEFT || type == HouseType.TERRACED_RIGHT ||
                type == HouseType.MULTI_FAMILY_FIRST_FLOOR || type == HouseType.DETACHED;
    }

    public static function isSkyType(type:int):Boolean {
        return  type == HouseType.BLOCK_CENTER_UPPER || type == HouseType.BLOCK_UPPER_LEFT ||
                type == HouseType.BLOCK_UPPER_LEFT || type == HouseType.BLOCK_DOUBLE_CENTER_UPPER ||
                type == HouseType.BLOCK_UPPER_RIGHT || type == HouseType.BLOCK_DOUBLE_UPPER_RIGHT ||
                type == HouseType.TERRACED_CENTER || type == HouseType.TERRACED_LEFT || type == HouseType.TERRACED_RIGHT ||
                type == HouseType.MULTI_FAMILY_UPPER || type == HouseType.DETACHED;
    }

    public static function hasOnlyWEWindows(type:int):Boolean {
        return type == HouseType.BLOCK_CENTER ||
                type == HouseType.BLOCK_CENTER_LOWER || type == HouseType.BLOCK_CENTER_UPPER;
    }

    public static function isCenterThinBlock(type:int):Boolean {
        return type == HouseType.BLOCK_CENTER ||
                type == HouseType.BLOCK_CENTER_LOWER || type == HouseType.BLOCK_CENTER_UPPER;
    }

    public static function hasOnlyOneOuterWall(type:int):Boolean {
        return type == HouseType.BLOCK_DOUBLE_CENTER || type == HouseType.BLOCK_DOUBLE_CENTER_LOWER ||
                type == HouseType.BLOCK_DOUBLE_CENTER_UPPER;
    }

    public static function hasTwoOuterWalls(type:int):Boolean {
        return (type == HouseType.BLOCK_CENTER || type == HouseType.BLOCK_CENTER_LOWER ||
                type == HouseType.BLOCK_CENTER_UPPER) ||
                (isDoubleBlock(type) && !hasOnlyOneOuterWall(type));
    }

    public static function hasThreeOuterWalls(type:int):Boolean {
        return isThinBlock(type) && !isCenterThinBlock(type);
    }


    public static function isBlockWithOuterRightWall(type:int):Boolean {
        return type == HouseType.BLOCK_EDGE_RIGHT || type == HouseType.BLOCK_UPPER_RIGHT ||
                type == HouseType.BLOCK_LOWER_RIGHT;
    }

    public static function isDoubleBlockWithOuterRightWall(type:int):Boolean {
        return type == HouseType.BLOCK_DOUBLE_EDGE_RIGHT || type == HouseType.BLOCK_DOUBLE_UPPER_RIGHT ||
                type == HouseType.BLOCK_DOUBLE_LOWER_RIGHT;
    }

    public static function hasNeighboursUp(type:int):Boolean {
        return type == HouseType.BLOCK_CENTER_LOWER || type == HouseType.BLOCK_LOWER_LEFT ||
                type == HouseType.BLOCK_LOWER_RIGHT || type == HouseType.BLOCK_DOUBLE_CENTER_LOWER ||
                type == HouseType.BLOCK_DOUBLE_LOWER_RIGHT || type == HouseType.BLOCK_DOUBLE_LOWER_RIGHT ||
                type == HouseType.BLOCK_CENTER || type == HouseType.BLOCK_DOUBLE_CENTER ||
                type == HouseType.BLOCK_EDGE_LEFT || type == HouseType.BLOCK_EDGE_RIGHT ||
                type == HouseType.BLOCK_DOUBLE_EDGE_LEFT || type == HouseType.BLOCK_DOUBLE_EDGE_RIGHT ||
                type == HouseType.MULTI_FAMILY_FIRST_FLOOR || type == HouseType.MULTI_FAMILY_CENTER;
    }

    public static function hasNeighboursDown(type:int):Boolean {
        return  type == HouseType.BLOCK_CENTER_UPPER || type == HouseType.BLOCK_UPPER_LEFT ||
                type == HouseType.BLOCK_UPPER_LEFT || type == HouseType.BLOCK_DOUBLE_CENTER_UPPER ||
                type == HouseType.BLOCK_UPPER_RIGHT || type == HouseType.BLOCK_DOUBLE_UPPER_RIGHT ||
                type == HouseType.BLOCK_CENTER || type == HouseType.BLOCK_DOUBLE_CENTER ||
                type == HouseType.BLOCK_EDGE_LEFT || type == HouseType.BLOCK_EDGE_RIGHT ||
                type == HouseType.BLOCK_DOUBLE_EDGE_LEFT || type == HouseType.BLOCK_DOUBLE_EDGE_RIGHT ||
                type == HouseType.MULTI_FAMILY_UPPER || type == HouseType.MULTI_FAMILY_CENTER;
    }

    public static function hasFlatRoof(type:int):Boolean {
        return isSkyType(type) && isBlockType(type);
    }

    public static function hasRegularRoof(type:int):Boolean {
        return isSkyType(type) && !isBlockType(type);
    }

    public static function isMultiFamilyType(type:int):Boolean {
        return multiFamilyTypes.contains(type);
    }

    public static function isTerraceType(type:int):Boolean {
        return terraceTypes.contains(type);
    }

    public static function isDetachedType(type:int):Boolean {
        return detachedTypes.contains(type);
    }

}
}