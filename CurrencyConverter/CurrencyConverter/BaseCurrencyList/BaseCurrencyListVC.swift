//
//  BaseCurrencyListVC.swift
//  CurrencyConverter
//
//  Created by Priya Agarwal on 04/01/2021.
//

import UIKit

class BaseCurrencyListVC: UIViewController {

    @IBOutlet weak var tblVw: UITableView!
    
    public var returnBaseCurrencySelectionCompletion : ((CurrencyDetailsModal) -> Void)?
    var arrCurrencyBaseModal = [CurrencyDetailsModal]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblVw.dataSource = self
        tblVw.delegate = self
        tblVw.reloadData()
        
    }
    
    //MARK:- IBActionMethods -

    @IBAction func btnBack(_ sender: Any) {
        
        popVC()
    }

}
extension BaseCurrencyListVC : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrCurrencyBaseModal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        
        let modal = arrCurrencyBaseModal[indexPath.row]
        cell.lblCurrency.text = modal.symbol
        if let flag = modal.symbol?.lowercased()
        {
            cell.imgCurrency.image = UIImage(named: flag)

        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let modal = arrCurrencyBaseModal[indexPath.row]
        self.returnBaseCurrencySelectionCompletion!(modal)
        popVC()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
        
    }
}
