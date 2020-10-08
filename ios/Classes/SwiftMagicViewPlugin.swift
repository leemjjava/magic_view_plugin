import Flutter
import UIKit

public class SwiftMagicViewPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let viewFactory = MagicViewFactory(messeger: registrar.messenger())
    registrar.register(viewFactory, withId: "MagicPlatformView")
  }
}
