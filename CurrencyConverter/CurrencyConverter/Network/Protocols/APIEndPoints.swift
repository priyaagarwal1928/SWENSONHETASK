import UIKit
import Alamofire
import EZSwiftExtensions

protocol Router {
    
    var route : String { get }
    var baseURL : String { get }
    var parameters : OptionalDictionary { get }
    var method : Alamofire.HTTPMethod { get }
    func handle(data : Any) -> AnyObject?
    
}

extension Sequence where Iterator.Element == Keys {
    
    func map(values: [Any?]) -> OptionalDictionary {
        
        var params = [String : Any]()
        
        for (index,element) in zip(self,values) {
            if element != nil{
                params[index.rawValue] = element
            }
        }
        return params
        
    }
}

enum APIEndPoints {
    
    case getCurrenciesListWithBaseCurrency(base_currency:String)
        
}


extension APIEndPoints : Router{
    
    var route : String  {
        
        switch self {

      
        case .getCurrenciesListWithBaseCurrency(let base_currency) : return "\(APIConstants.getCurrenciesListWithBaseCurrency)\(base_currency)"
            
            
        
        }
    }
    
    var parameters: OptionalDictionary{
        return format()
    }
    
    
    func format() -> OptionalDictionary {
        
        switch self {
            


        default:
            return  nil
        
        }
    }
    
    var method : Alamofire.HTTPMethod {
        
        switch self {
            

        default: return .get
            
        }
    }
    
    var baseURL: String{
        return APIConstants.apiBaseUrl
    }
   
    
   
}
