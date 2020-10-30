import UIKit

// MARK: - UIView Extension
extension UIView {
 
    // - MARK: - Loading Progress View
    func showLoader() {
        Utils.mainQueue {
            self.isUserInteractionEnabled = false
            CCAppLoader.showLoader()
        }
    }

    func hideLoader() {
         Utils.mainQueue {
            self.isUserInteractionEnabled = true
            CCAppLoader.hideLoader()
        }
    }
}

