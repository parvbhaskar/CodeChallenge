import Foundation

public enum HTTPStatusCode: Int {
    case ok = 200
    case internalServerError = 500
    case unknownStatus = 0

    init(statusCode: Int) {
        self = HTTPStatusCode(rawValue: statusCode) ?? .unknownStatus
    }
 
    public var statusDescription: String {
        switch self {
        case .ok:
            return CCConstants.GeneralStrings.ok
        case .internalServerError:
            return CCConstants.GeneralStrings.internalServerError
        default:
            return CCConstants.GeneralStrings.unknownStatusCode
        }
    }
}
