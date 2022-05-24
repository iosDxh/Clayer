//
//  DoubleEx.swift
//  BlueBear
//
//  Created by laichunhui on 2019/11/16.
//  Copyright © 2019 blueblue. All rights reserved.
//

import Foundation

extension Double {
    public func toReserveString() -> String {
        var text = String(format: "%.2f", self)
//        if text.hasSuffix(".00") {
//            text.sy_removeSubString(in: NSRange(location: text.count-3, length: 3))
//        }
        return text
    }
}
