//
//  SOXShapedTapView.swift
//  SOXShapedTapView
//
//  Created by Spagnolo, Daniele on 30/11/2014.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit

extension UIView {
    func alphaFromPoint(_ point: CGPoint) -> CGFloat {
        var pixel: [UInt8] = [0, 0, 0, 0]
        let colorSpace = CGColorSpaceCreateDeviceRGB();
        let alphaInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: &pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: alphaInfo.rawValue)
        
        context?.translateBy(x: -point.x, y: -point.y);
        
        self.layer.render(in: context!)
        
        let floatAlpha = CGFloat(pixel[3])
        return floatAlpha
    }
}
