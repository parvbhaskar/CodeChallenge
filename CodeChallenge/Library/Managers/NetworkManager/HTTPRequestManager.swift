import UIKit

public enum HTTPRequestErrorCode: Int {
    case httpConnectionError = 40 // Trouble connecting to Server.
}

enum HTTPRequestMethod: String {
    case GET
}
 
final class HTTPRequestManager {

    fileprivate var urlSession: URLSession

    // MARK: - Singleton Instance
    class var shared: HTTPRequestManager {
        struct Singleton {
            static let instance = HTTPRequestManager()
        }
        return Singleton.instance
    }

    fileprivate init() {
        // Craete Urlsession from default configuration.
        urlSession = URLSession(configuration: URLSessionConfiguration.default)
    }

    func performRequest(_ request: URLRequest, userInfo _: NSDictionary? = nil, completionHandler: @escaping(_ response: Response) -> Void) {
        guard isNetworkReachable() else {
            let res = Response(request, nil, NSError.errorForNoNetwork())
            completionHandler(res)
            return // do not proceed if user is not connected to internet
        }

        let mutableRequest: URLRequest  = request

        performSessionDataTaskWithRequest(mutableRequest, completionHandler: completionHandler)
    }

    fileprivate func performSessionDataTaskWithRequest(_ request: URLRequest, userInfo: NSDictionary? = nil, completionHandler: @escaping(_ response: Response) -> Void) {
        urlSession.dataTask(with: request, completionHandler: { data, response, error in

            var responseError: Error? = error
            // handle http response status
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode > 299 {
                    responseError = NSError.errorForHTTPStatus(httpResponse.statusCode)
                }
            }

            var apiResponse: Response
            if let _ = responseError {
                if let httpResponse = response as? HTTPURLResponse {
                    debugPrint("Getting error - \(httpResponse.statusCode)")
                }

                apiResponse = Response(request, response as? HTTPURLResponse, responseError!)
                self.logError(apiResponse.error!, request: request)
            } else {
                apiResponse = Response(request, response as? HTTPURLResponse, data!)
                self.logResponse(data!, forRequest: request)
            }

            Utils.mainQueue {
                completionHandler(apiResponse)
            }
        }).resume()
    }

    func performHTTPActionWithMethod(_ method: HTTPRequestMethod, urlString: String, params: [String: String]? = nil, completionHandler: @escaping(_ response: Response) -> Void) {
        guard let finalParams = params else { return }
        
        var components = URLComponents(string: urlString)
        components?.queryItems = finalParams.queryItems() as [URLQueryItem]?
        
        if let url = components?.url {
            var request = URLRequest(url: url)
            request.httpMethod = HTTPRequestMethod.GET.rawValue
            performRequest(request, completionHandler: completionHandler)
        } else {
            // do not proceed if the url is nil
            let res = Response(nil, nil, NSError.errorForInvalidURL())
            completionHandler(res)
        }
    }
    
    fileprivate func logError(_ error: Error, request: URLRequest) {
        #if STAGING
            print("URL: \(String(describing: request.url?.absoluteString)) Error: \(error.localizedDescription)")
        #endif
    }

    fileprivate func logResponse(_ data: Data, forRequest request: URLRequest) {
        #if STAGING
            print("Data Size: \(data.count) bytes")
            let output: NSString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)!
            print("URL: \(String(describing: request.url?.absoluteString)) Output: \(output)")
        #endif
    }
}

// MARK: Network reachable methods
extension HTTPRequestManager {
    fileprivate func isNetworkReachable() -> Bool {
        return Reachability.isConnectedToNetwork()
    }
}
