import UIKit
 
// MARK: - UIColor Extension
extension UIColor {
    class func colorWithRedValue(_ redValue: CGFloat, greenValue: CGFloat, blueValue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: redValue / 255.0, green: greenValue / 255.0, blue: blueValue / 255.0, alpha: alpha)
    }
}
