import Flutter
import UIKit

public class SwiftHelloPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "hello", binaryMessenger: registrar.messenger())
    let instance = SwiftHelloPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if("getPlatformVersion" == call.method){
        print( "偷懒居然不写方法判断。iOS直接返回了。搞懵逼" )
     result("iOS " + UIDevice.current.systemVersion)
    }
//    result("iOS " + UIDevice.current.systemVersion)
  }
}
