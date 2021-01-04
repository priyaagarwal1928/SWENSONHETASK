//
//  CurrencyListViewModel.swift
//  CurrencyConverter
//
//  Created by Priya Agarwal on 04/01/2021.
//

import UIKit

class CurrencyListViewModel: NSObject {

    
    func callAPIToGetCurrencyListWithBaseCurrency(base_currency : String, completion:@escaping (_ success: (CurrencyModal)) -> Void) {

        APIManager.shared.request(with: APIEndPoints.getCurrenciesListWithBaseCurrency(base_currency: base_currency), isLoaderNeeded: true) { (response) in
            
            
            switch response{
                
            case .success(let responseValue):
                
                if let result  = responseValue as? CurrencyModal
                {
                    completion((result))
                }
                
                break;
                
            case .failure(let msg):
                
                CommonMethodsClass.showAlertViewOnWindow(titleStr: "", messageStr: msg ?? "", okBtnTitleStr:"OK")
                
            case .Warning(let msg):
                
                CommonMethodsClass.showAlertViewOnWindow(titleStr: "", messageStr: msg ?? "", okBtnTitleStr:"OK")
            }
            
        }
        
    }
}
