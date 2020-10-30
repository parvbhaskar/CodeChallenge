import UIKit

extension DataManager {
 
    // MARK: Fetch Songs
    func getSongs(_ completion: @escaping(_ success: Bool, _ error: Error?, _ message: String, _ songsData:[[String:Any]]?) -> Void) {
        let param = ["term": "Michael+jackson"]

        httpClient.performHTTPActionWithMethod(.GET, urlString: CCConstants.APIServices.getSongs, params: param) { (response) -> Void in
            if let results = response.resultJSON?["results"] as? [[String:Any]] {
                completion(true, response.error, response.message(), results)
            } else {
                completion(false, response.error, response.message(), nil)
            }
        }
    }
}
