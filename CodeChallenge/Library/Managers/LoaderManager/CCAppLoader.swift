import Foundation
import UIKit

class CCAppLoader {
    static let DELAY_TIME = 0.2
 
    class func setConfig() {
        var config: SwiftLoader.Config = SwiftLoader.Config()
        let appTheamColor = CCConstants.Color.themeOrangeColor
        
        config.size = 100
        config.backgroundColor = UIColor.white
        config.spinnerColor = appTheamColor
        config.titleTextColor = UIColor.red
        config.spinnerLineWidth = 2.0
        config.foregroundColor = UIColor.black
        config.foregroundAlpha = 0.5

        SwiftLoader.setConfig(config)
    }

    class func showLoader() {
        SwiftLoader.hide()

        Utils.delay(seconds: DELAY_TIME) { () -> () in
            CCAppLoader.setConfig()
            SwiftLoader.show(animated: true)
        }
    }

    class func hideLoader() {
        if Thread.isMainThread {
            Utils.delay(seconds: DELAY_TIME) { () -> () in
                SwiftLoader.hide()
            }
        } else {
            Utils.mainQueue {
                Utils.delay(seconds: DELAY_TIME) { () -> () in
                    SwiftLoader.hide()
                }
            }
        }
    }
}
