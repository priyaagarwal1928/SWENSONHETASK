//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Priya Agarwal on 03/01/2021.
//

import UIKit
import ObjectMapper

class CurrencyListVC: UIViewController {

    @IBOutlet weak var lblBaseCurrency: UILabel!
    @IBOutlet weak var imgBaseCurrency: UIImageView!
    @IBOutlet weak var tblVw: UITableView!

    var currencyModal : CurrencyModal?
    var arrCurrencyBaseModal = [CurrencyDetailsModal]()
    var selectedBaseCurrency = "USD"

    lazy var viewModel: CurrencyListViewModel = {
        let obj = CurrencyListViewModel()
        return obj
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.getDataFromServer()
        
        
    }
    
    //MARK:- IBActionMethods -

    @IBAction func btnChangeBaseCurrency(_ sender: Any) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "BaseCurrencyListVC") as? BaseCurrencyListVC{
            
            vc.arrCurrencyBaseModal = self.arrCurrencyBaseModal
            vc.returnBaseCurrencySelectionCompletion = { modal in
                
                self.selectedBaseCurrency = modal.symbol ?? ""
                self.getDataFromServer()
                
            }
        
            pushVC(vc)
            
        }
        
    }
    
    //MARK:- getDataFromServer -

    func getDataFromServer() {
        
        viewModel.callAPIToGetCurrencyListWithBaseCurrency(base_currency: selectedBaseCurrency) { (modal) in
            
            self.currencyModal = modal
            self.arrCurrencyBaseModal = modal.rates
            self.setUpUI()
            
        }
    }
    

    //MARK:- SETUPUI -

    func setUpUI() {
    
        if arrCurrencyBaseModal.count > 0
        {
            //by default get data based on USD
            
            let arrSelectedBaseCurrency = arrCurrencyBaseModal.filter({$0.symbol == selectedBaseCurrency})
            
            if arrSelectedBaseCurrency.count > 0
            {
                lblBaseCurrency.text = arrSelectedBaseCurrency[0].symbol
                
                if let flag = arrSelectedBaseCurrency[0].symbol?.lowercased()
                {
                    imgBaseCurrency.image = UIImage(named: flag)

                }
                
            }

        }
        
        tblVw.dataSource = self
        tblVw.delegate = self
        tblVw.reloadData()
       
       
    }
    
}

extension CurrencyListVC : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrCurrencyBaseModal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        
        let modal = arrCurrencyBaseModal[indexPath.row]
        cell.lblCurrency.text = modal.symbol
        cell.lblRates.text = "\(modal.value ?? 0.0)"
        
        if let flag = modal.symbol?.lowercased()
        {
            cell.imgCurrency.image = UIImage(named: flag)

        }

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let modal = arrCurrencyBaseModal[indexPath.row]
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyConvertVC") as? CurrencyConvertVC{
            
            vc.selectedBaseCurrency = self.selectedBaseCurrency
            vc.selectedCurrency = modal.symbol ?? ""
            vc.selectedCurrencyvalue = modal.value ?? 0.0
        
            pushVC(vc)
            
        }
        
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
        
    }
}

