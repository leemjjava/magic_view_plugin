//
//  MagicPlatformView.swift
//  Runner
//
//  Created by lmj on 2020/10/07.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation

public class MagicPlatformView: NSObject, FlutterPlatformView{
    let viewId: Int64
    let magicView: UILabel
    let messenger: FlutterBinaryMessenger
    let channel: FlutterMethodChannel
    
    init(messenger: FlutterBinaryMessenger, fream: CGRect, viewId: Int64, args: Any?) {
        self.messenger = messenger
        self.viewId = viewId;
        self.magicView = UILabel();
        self.magicView.text = "native View"
        self.channel = FlutterMethodChannel(name: "MagicView/\(viewId)",binaryMessenger: messenger)
        
        super.init()
        self.channel.setMethodCallHandler(handle(call:result:))
    }
    
    
    func handle(call:FlutterMethodCall, result:FlutterResult){
        switch call.method {
        case "receiveFromFlutter":
            guard let args = call.arguments as? [String: Any], let text = args["text"] as? String else {
                result(FlutterError(code: "-1", message: "Error", details: "Error Details"))
                return
            }
            self.magicView.text = text
            result("receiveFromFlutter success")
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    
    
    public func view() -> UIView {
        return magicView;
    }
    
}
