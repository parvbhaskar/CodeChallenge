import Foundation

class DataManager {

    let httpClient: HTTPRequestManager
    let isOnline: Bool = true
 
    // MARK: - Singleton Instance
    class var shared: DataManager {
        struct Singleton {
            static let instance = DataManager()
        }
        return Singleton.instance
    }

    private init() {
        httpClient = HTTPRequestManager.shared
    }
}

