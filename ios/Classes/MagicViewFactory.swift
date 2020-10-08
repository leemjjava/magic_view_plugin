//
//  MagicViewFactory.swift
//  Runner
//
//  Created by lmj on 2020/10/07.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation

public class MagicViewFactory: NSObject, FlutterPlatformViewFactory{
    let messenger : FlutterBinaryMessenger
    
    init(messeger:FlutterBinaryMessenger) {
        self.messenger = messeger
    }
    
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return MagicPlatformView(messenger: messenger, fream: frame, viewId: viewId, args: args)
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
