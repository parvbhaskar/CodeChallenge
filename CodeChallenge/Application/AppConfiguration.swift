import UIKit

enum Environment: String {
    case development
    case production
     
    static func currentEnvironment() -> Environment {
        #if PRODUCTION
        return Environment.production
        #else
        return Environment.development
        #endif
    }
}

final class AppConfiguration {
    /**
     * Application Configuration
     */
    struct Configuration {
        var environment: Environment
        var apiEndPoint: String

        // Please change the key values for development
        fileprivate static func debugConfiguration() -> Configuration {
            return Configuration(environment: .development,
                apiEndPoint: "https://itunes.apple.com")
        }

        // Please change the key values for production
        fileprivate static func productionConfiguration() -> Configuration {
            return Configuration(environment: .production,
                apiEndPoint: "https://itunes.apple.com")
        }
    }

    // MARK: - Singleton Instance
    class var shared: AppConfiguration {
        struct Singleton {
            static let instance = AppConfiguration()
        }
        return Singleton.instance
    }

    public private(set) var activeConfiguration: Configuration!

    private init() {
        activeConfiguration = configurationForEnvironment(Environment.currentEnvironment())
    }

    private func configurationForEnvironment(_ environment: Environment) -> Configuration {
        switch environment {
        case .development:
            return Configuration.debugConfiguration()
        case .production:
            return Configuration.productionConfiguration()
        }
    }
}

extension AppConfiguration {

    // MARK: - Public Methods
    func applicationEndPoint() -> String {
        return self.activeConfiguration.apiEndPoint
    }
}
