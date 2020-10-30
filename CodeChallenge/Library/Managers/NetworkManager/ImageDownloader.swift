import UIKit

class ImageDownloader {
     
    class func downloadImageFor(url: URL, _ completion: @escaping(_ data: Data?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            completion(data, error)
        }).resume()
    }
}
