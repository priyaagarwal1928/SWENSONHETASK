


import Foundation

class GlobalSettings {
    static let shared = GlobalSettings()

    // Rates Exchange API key [YOUR_API_KEY]
    // Get your own api key from https://ratesexchange.eu
    let ratesExchangeApiKey = "0f1241d0-c9f9-4754-9b38-3a46fbdc9abc"
}

internal struct APIConstants {
    
    private static let s = GlobalSettings.shared
    
    static let apiBaseUrl = "https://api.ratesexchange.eu/client/"
    
    static let apiKeyParam = "?apiKey=\(s.ratesExchangeApiKey)"
    
    static let getCurrenciesListWithBaseCurrency = "latestdetails\(apiKeyParam)&base_currency="

    
}

enum Response {
    case success(AnyObject?)
     case Warning(String?)
    case failure(String?)

}


typealias OptionalDictionary = [String : Any]?

struct Parameters {
    
    static let getCurrenciesListWithBaseCurrency : [Keys] = [.base_currency]

}

