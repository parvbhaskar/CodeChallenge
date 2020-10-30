import Foundation
import UIKit

struct CCConstants {
    
    struct GeneralStrings {
        static let emptyString = ""
        static let ok = "OK"
        static let spacedString = " "
        
        static let domain = "com.httprequest"
        static let error = "Error"
        static let http = "HTTP"
        static let internalServerError = "Internal server error"
        static let jsonParsingError = "A JSON parsing error occurred, here are the details:\n"
        static let unknownStatusCode = "Unknown status code"
        static let urlInvalid = "URL Invalid"
        static let urlNotContainNil = "URL must not be nil"
        static let networkUnavailable = "Network unavailable"
    }
    
    // MARK: APIServices
    struct APIServices {
        static let getSongs = CCConstants.APIServices.apiURL("search")
        
        static func apiURL(_ methodName: String) -> String {
            let BASE_URL = AppConfiguration.shared.applicationEndPoint()
            return BASE_URL + "/" + methodName
        }
    }
    
    // MARK: Colors
    struct Color {
        static let themeGrayColor: UIColor = UIColor.colorWithRedValue(191, greenValue: 188, blueValue: 187, alpha: 1.0)
        static let themeOrangeColor: UIColor = UIColor.colorWithRedValue(253, greenValue: 120, blueValue: 81, alpha: 1.0)

        //Refresh control indicator color
        static let themeRefreshControlOrangeColor: UIColor = UIColor.colorWithRedValue(253, greenValue: 120, blueValue: 81, alpha: 0.5)
    }
    
    // MARK: CellIdentifiers
    struct CellIdentifiers {
        static let songsCell = "CCSongTableViewCell"
    }
    
    // MARK: StoryboardId's
    struct StoryboardId {
        static let songDetail = "kCCSongDetailViewStoryboardId"
    }
}
