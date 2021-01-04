
import Foundation
import SwiftyJSON
import ObjectMapper

enum ResponseKeys : String {
    case data
    
}

extension APIEndPoints {
    
    func handle(data : Any) -> AnyObject? {
        
        // let parameters = JSON(data)
        
        switch self {
            
       
        case .getCurrenciesListWithBaseCurrency(_):
            let json = JSON(data)
            let apiResponse = Mapper<CurrencyModal>().map(JSONObject: json.object)
            return apiResponse as AnyObject?
            
        }
    }
}



