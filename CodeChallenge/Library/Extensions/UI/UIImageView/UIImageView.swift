import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
 
class ImageLoader: UIImageView {

    //MARK: Variables
    var imageURL: URL?
    let activityIndicator = UIActivityIndicatorView()
    
    //MARK: UI Methods
    func addCornerRadius() {
        makeCornerRadius(radius: 10)
    }

    func makeRoundImage() {
        makeCornerRadius(radius: self.frame.width / 2)
    }
        
    func makeCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    //MARK: Add Activity Indicator
    func addActivityIndicator()  {
        // setup activityIndicator...
        activityIndicator.color = .darkGray

        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    //MARK: Download Image
    func loadImageWithUrl(_ url: URL) {
        addActivityIndicator()

        imageURL = url
        image = nil
        
        // retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imageFromCache
            stopActivityIndicator()
            
            return
        }

        // DownloadImage
        ImageDownloader.downloadImageFor(url: url) { (data, error) in
            if error != nil {
                Utils.mainQueue {
                    self.stopActivityIndicator()
                }

                return
            }
            
            Utils.mainQueue {
                if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {
                    if self.imageURL == url {
                        self.image = imageToCache
                    }

                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
