//
//  Anagrams.swift
//  Anagrams
//
//  Created by Priya Agarwal on 03/01/2021.
//

import Foundation

class Anagrams
{
    func checkForAnagram(firstStr: String, secondStr: String) -> Bool {
        
        if firstStr.count == secondStr.count
        {
            print(firstStr.sorted())
            
            print(secondStr.sorted())
            
            return firstStr.lowercased().sorted() == secondStr.lowercased().sorted()
        }
        else
        {
            return false
        }
        
       
        
    }
    
}
