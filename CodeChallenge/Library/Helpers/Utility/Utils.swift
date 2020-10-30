import UIKit

class Utils {
 
    //MARK: Thead Queues
    class func mainQueue(_ block: @escaping () -> ()) {
        DispatchQueue.main.async { () -> Void in
            block()
        }
    }

    class func delay(seconds: Double, completion: @escaping () -> ()) {
        let popTime = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * seconds)) / Double(NSEC_PER_SEC)

        DispatchQueue.main.asyncAfter(deadline: popTime) {
            completion()
        }
    }

    class func isObjectInitialized(_ value: AnyObject?) -> Bool {
        guard let _ = value else {
            return false
        }
        return true
    }

}
