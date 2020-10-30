
import Foundation
import UIKit
 
extension UIDevice {

    // MARK: API helper methods
    public class func deviceID() -> String {

        if let deviceID = UserDefaults.standard.object(forKey: "deviceID") as? String {
            return deviceID
        } else {
            let deviceID = UIDevice.current.identifierForVendor?.uuidString ?? ""
            UserDefaults.standard.set(deviceID as AnyObject?, forKey: "deviceID")
            return deviceID
        }
    }
    
    public class func deviceInfo() -> [String: String] {
        
        var deviceInfo = [String: String]()
        deviceInfo["deviceId"] = deviceID()
        deviceInfo["deviceType"] = "1"
        return deviceInfo
    }
}
