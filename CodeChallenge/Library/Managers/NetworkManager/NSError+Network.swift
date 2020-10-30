//
//  Error+Network.swift
//
//  Created by Arvind Singh on 07/07/17.
//  Copyright © 2017 Appster. All rights reserved.
import Foundation

// MARK: Error handling methods
extension NSError {
    
    class func errorForInvalidURL() -> NSError {
        let errorDictionary = [NSLocalizedFailureReasonErrorKey: NSLocalizedString(CCConstants.GeneralStrings.urlInvalid, comment: CCConstants.GeneralStrings.urlInvalid), NSLocalizedDescriptionKey: NSLocalizedString(CCConstants.GeneralStrings.urlNotContainNil, comment: CCConstants.GeneralStrings.urlNotContainNil)]
        return NSError(domain: NSURLErrorDomain, code: -1, userInfo: errorDictionary)
    }

    class func errorForNoNetwork() -> NSError {
        let errorDictionary = [NSLocalizedFailureReasonErrorKey: NSLocalizedString(CCConstants.GeneralStrings.networkUnavailable, comment: CCConstants.GeneralStrings.networkUnavailable), NSLocalizedDescriptionKey: NSLocalizedString(CCConstants.GeneralStrings.networkUnavailable, comment: CCConstants.GeneralStrings.networkUnavailable)]
        return NSError(domain: NSURLErrorDomain, code: HTTPRequestErrorCode.httpConnectionError.rawValue, userInfo: errorDictionary)
    }

    class func errorForHTTPStatus(_ code: Int) -> NSError {
        let text = NSLocalizedString(HTTPStatusCode(statusCode: code).statusDescription, comment: CCConstants.GeneralStrings.emptyString)
        let errorDictionary = [NSLocalizedFailureReasonErrorKey: NSLocalizedString(CCConstants.GeneralStrings.error, comment: CCConstants.GeneralStrings.error), NSLocalizedDescriptionKey: text]
        return NSError(domain: CCConstants.GeneralStrings.http, code: code, userInfo: errorDictionary)
    }
}
