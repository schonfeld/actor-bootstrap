//
//  MessageView.swift
//  SexyWaffles
//
//  Created by Michael Schonfeld on 8/30/16.
//  Copyright © 2016 Steve Kite. All rights reserved.
//

import Foundation
import ActorSDK
import UIKit
import YYImage

open class SimpleBubbleTextCell : AABubbleTextCell {
}

open class SimpleCellLayout : TextCellLayout {
}

open class MessageView : AABubbleLayouter {
    open func isSuitable(_ message: ACMessage) -> Bool {
        return message.content is ACTextContent
    }
    
    open func buildLayout(_ peer: ACPeer, message: ACMessage) -> AACellLayout {
        return SimpleCellLayout(message: message, peer: peer, layouter: self)
    }
    
    open func cellClass() -> AnyClass {
        return SimpleBubbleTextCell.self
    }
}
