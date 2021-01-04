

import Foundation
import SwiftyJSON
import EZSwiftExtensions

class APIManager : NSObject{
    
    typealias Completion = (Response) -> ()
    static let shared = APIManager()
    private lazy var httpClient : HTTPClient = HTTPClient()
    
    func request(with api : Router, isLoaderNeeded : Bool , completion : @escaping Completion )  {
        
        CommonMethodsClass.shared.loader()
        
        if api.method == .get{
            
            httpClient.getRequest(withApi: api, success: {(data) in
                
                if isLoaderNeeded
                {
                    CommonMethodsClass.shared.removeLoader()

                }
                
                
                guard let response = data else {
                    completion(Response.failure(.none))
                    return
                }
                let json = JSON(response)
                
                print(json)
                
                let codeValue = json[Keys.code.rawValue].stringValue

                if codeValue != ""
                {
                    completion(Response.failure(json[Keys.message.rawValue].stringValue))

                }
                else
                {
                    let object : AnyObject?
                    object = api.handle(data: response)
                    completion(Response.success(object))
                }
                
                

                
                }, failure: { (message) in
                    
                    if isLoaderNeeded
                    {
                        CommonMethodsClass.shared.removeLoader()

                        
                    }
            })
            
        }
    }
    
}
