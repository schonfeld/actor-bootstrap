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

public class SimpleBubbleTextCell : AABubbleTextCell {
}

public class SimpleCellLayout : TextCellLayout {
}

public class MessageView : AABubbleLayouter {
    public func isSuitable(message: ACMessage) -> Bool {
        return message.content is ACTextContent
    }
    
    public func buildLayout(peer: ACPeer, message: ACMessage) -> AACellLayout {
        return SimpleCellLayout(message: message, peer: peer, layouter: self)
    }
    
    public func cellClass() -> AnyClass {
        return SimpleBubbleTextCell.self
    }
}
