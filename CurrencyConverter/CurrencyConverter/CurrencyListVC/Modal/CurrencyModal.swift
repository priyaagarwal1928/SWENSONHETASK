//
//  CurrencyModal.swift
//  CurrencyConverter
//
//  Created by Priya Agarwal on 04/01/2021.
//

import Foundation
import ObjectMapper

class CurrencyModal : Mappable
{
    var base: String?
    var rates = [CurrencyDetailsModal]()
    var flag: String?
    var currencyList : [String:String]?

    convenience required init?(map: Map)
    {
        self.init()
    }
    
   
    func mapping(map: Map)
    {
        base <- map["base"]
        rates <- map["rates"]
        currencyList <- map["rates"]

    }
}

class CurrencyDetailsModal : Mappable
{
    var symbol: String?
    var value: Double?
    var flag: String?

    convenience required init?(map: Map)
    {
        self.init()
    }
    
   
    func mapping(map: Map)
    {
        symbol <- map["symbol"]
        value <- map["value"]
    }
}

