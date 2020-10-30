import UIKit

extension Double {
     
    func convertMilliSectondsToMinutesSeconds() -> String {
        let date = Date(timeIntervalSinceNow: Double(self) / 1000)
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss"
        
        return formatter.string(from: date)
    }
}
