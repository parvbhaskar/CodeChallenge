import UIKit

class Response {
 
    private struct SerializationKeys {
        static let status = "status"
        static let responseCode = "statusCode"
        static let message = "message"
    }

    var request: URLRequest?
    var response: HTTPURLResponse?
    var data: Data?
    var error: Error?
    var resultJSON: Dictionary<String, Any>?

    // MARK: - Initialization Methods
    init(_ request: URLRequest, _ response: HTTPURLResponse?, _ data: Data) {
        self.request = request
        self.response = response

        if Utils.isObjectInitialized(data as AnyObject?) {
            self.data = data

            do {
                resultJSON = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary
                if !success() {
                    self.error = error(responseCode(), message())
                }
            } catch let error as NSError {
                print("\(CCConstants.GeneralStrings.jsonParsingError) \(error)")
                self.error = error
            }
        }
    }

    init(_ request: URLRequest?, _ response: HTTPURLResponse?, _ error: Error) {
        self.request = request
        self.response = response
        self.error = error
    }

    // MARK: - Getters Methods
    func success() -> Bool {
        if let resultJSON = resultJSON, let status = resultJSON[SerializationKeys.status] {
            return (status as AnyObject).boolValue
        }

        return false
    }

    func outputText() -> String? {

        guard let data = data else {
            return nil
        }

        return String(data: data as Data, encoding: String.Encoding.utf8)
    }

    func responseCode() -> Int {

        if let resultJSON = resultJSON, let code = resultJSON[SerializationKeys.responseCode] as? Int {
            return code
        }

        return -1 // Unknown response code.
    }

    func message() -> String {
        var successMessage: String = ""

        if let resultJSON = resultJSON, let message = resultJSON[SerializationKeys.message] as? String {
            successMessage = message
        } else if let errorString: String = self.error?.localizedDescription {
            successMessage = errorString
        }

        return successMessage
    }

    fileprivate func error(_ code: Int, _ message: String) -> Error {
        let errorDictionary = [NSLocalizedFailureReasonErrorKey: NSLocalizedString(CCConstants.GeneralStrings.error, comment: CCConstants.GeneralStrings.error), NSLocalizedDescriptionKey: message]
        return NSError(domain: CCConstants.GeneralStrings.domain, code: code, userInfo: errorDictionary)
    }
}
