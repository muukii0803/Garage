// Garage.swift
//
// Copyright (c) 2014 eureka
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import UIKit

// iPhone4 iPhone4S iPhone5 iPhone5S
let kScreenWidth_Small: CGFloat = 320.0
// iPhone6
let kScreenWidth_Midium: CGFloat = 375.0
// iPhone6+
let kScreenWidth_Large: CGFloat = 414.0

public class Garage: NSObject{

}

/**
*  Screen Size
*/
public extension Garage {

    /**
    ScreenScale
    
    :returns: CGFloat
    */
    class func ScreenScale() -> CGFloat {
        return UIScreen.mainScreen().scale
    }
    /**
    ScreenWidth

    :returns: CGFloat
    */
    class func ScreenWidth() -> CGFloat {
        return UIScreen.mainScreen().bounds.width
    }
    
    /**
    NumberOfPixels width
    
    :returns: Number of pixels (width)
    */
    class func ScreenWidthPixel() -> Int {
        return Int(self.ScreenWidth() * self.ScreenScale())
    }

    /**
    iPhone4 iPhone4S iPhone5 iPhone5S

    :returns: Bool
    */
    class func ScreenWidthSmall() -> Bool{
        if ScreenWidth() <= kScreenWidth_Small && ScreenWidth() < kScreenWidth_Midium {
            return true
        } else {
            return false
        }
    }

    /**
    iPhone6

    :returns: Bool
    */
    class func ScreenWidthMidium() -> Bool{
        if ScreenWidth() <= kScreenWidth_Midium && ScreenWidth() > kScreenWidth_Small {
            return true
        } else {
            return false
        }
    }

    /**
    iPhone6+

    :returns: Bool
    */
    class func ScreenWidthLarge() -> Bool{
        if ScreenWidth() <= kScreenWidth_Large && ScreenWidth() > kScreenWidth_Midium {
            return true
        } else {
            return false
        }
    }
}

/**
*  Calculate
*/
public extension Garage {
    /**
    Get FittingSize For CollectionView
    
    :param: maxWidth           CollectionView Width
    :param: numberOfItemsInRow Items count of Row
    :param: margin             Margin between items
    :param: index              IndexPath.item by collectionView
    
    :returns: Suitable width
    */
    class func CalculateFittingGridSize(#maxWidth: CGFloat, numberOfItemsInRow: Int, margin: CGFloat, index: Int) -> CGSize {
        let totalMargin: CGFloat = margin * CGFloat(numberOfItemsInRow - 1)
        let actualWidth: CGFloat = maxWidth - totalMargin
        let width: CGFloat = CGFloat(floorf(Float(actualWidth) / Float(numberOfItemsInRow)))
        let extraWidth: CGFloat = actualWidth - (width * CGFloat(numberOfItemsInRow))
        
        if index % numberOfItemsInRow == 0 || index % numberOfItemsInRow == (numberOfItemsInRow - 1) {
            return CGSizeMake(width + extraWidth/2.0,width)
        } else {
            return CGSizeMake(width,width)
        }
    }
}

/**
*  Date
*/
public extension Garage {

    
}

/**
*  System
*/
public extension Garage {
    func osVersionString() -> String {
        return UIDevice.currentDevice().systemVersion
    }
}

/**
*  UIColor
*/
extension UIColor {
    class func hexStr (var hexStr : NSString, var alpha : CGFloat) -> UIColor {
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.whiteColor();
        }
    }
}