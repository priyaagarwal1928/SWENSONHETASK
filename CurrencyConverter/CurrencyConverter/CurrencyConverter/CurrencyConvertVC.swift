//
//  CurrencyConvertVC.swift
//  CurrencyConverter
//
//  Created by Priya Agarwal on 05/01/2021.
//

import UIKit

class CurrencyConvertVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtfldBaseCurrency: UITextField!
    @IBOutlet weak var txtfldSelCurrency: UITextField!
    @IBOutlet weak var lblBaseCurrency: UILabel!
    @IBOutlet weak var lblSelCurrency: UILabel!
    
    var selectedBaseCurrency = ""
    var selectedCurrency = ""
    var selectedCurrencyvalue = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        txtfldBaseCurrency.delegate = self
        
        lblSelCurrency.text = selectedCurrency
        lblBaseCurrency.text = selectedBaseCurrency
        txtfldSelCurrency.text = "\(selectedCurrencyvalue)"
        txtfldBaseCurrency.text = "1"
        
        self.txtfldBaseCurrency.addTarget(self, action: #selector(self.textChange(sender:)), for: .editingChanged)
        
    }
    
    //MARK:- SelectorMethod -

    @objc func textChange(sender : UITextField){
        
        if let val = txtfldBaseCurrency.text?.toDouble()
        {
            let totalCurrency = (val * self.selectedCurrencyvalue)
            self.txtfldSelCurrency.text = "\(totalCurrency.truncate(places: 6))"

        }
    }
    
    //MARK:- IBActionMethods -

    @IBAction func btnBack(_ sender: Any) {
        
        popVC()
    }

}

extension Double
{
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
