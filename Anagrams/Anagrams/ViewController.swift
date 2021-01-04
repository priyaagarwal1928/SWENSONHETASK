//
//  ViewController.swift
//  Anagrams
//
//  Created by Priya Agarwal on 03/01/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtfldInput2: UITextField!
    @IBOutlet weak var txtfldInput1: UITextField!
    var objAnagram = Anagrams()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(objAnagram.checkForAnagram(firstStr: "ramdhas", secondStr: "amsdha"))

    }
    
    
    @IBAction func btnCheckResult(_ sender: Any) {
        
        if txtfldInput1.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            self.showAlertViewOnWindow(messageStr: "Enter first string" )
        }
        else if txtfldInput2.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            self.showAlertViewOnWindow(messageStr: "Enter second string" )

        }
        else if txtfldInput1.text?.trimmingCharacters(in: .whitespaces).count != txtfldInput2.text?.trimmingCharacters(in: .whitespaces).count
        {
            self.showAlertViewOnWindow(messageStr: "Both string should be equal characters")

        }
        else
        {
            if let string1 = txtfldInput1.text , let string2 = txtfldInput2.text
            {
                let isAnagram = objAnagram.checkForAnagram(firstStr:  string1 , secondStr:  string2 )
                
                isAnagram ? self.showAlertViewOnWindow(messageStr: "\(string1) and \(string2) are Anagrams") : self.showAlertViewOnWindow(messageStr: "\(string1) and \(string2) are not Anagrams")
            }
            
        }
        
        
    }
    
}

extension ViewController
{
    func showAlertViewOnWindow(messageStr: String)
    {
        
        let alert = UIAlertController(title: "", message: messageStr, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alert.view.tintColor = UIColor.black
        self.present(alert, animated: true, completion: nil)
      
    }
}
