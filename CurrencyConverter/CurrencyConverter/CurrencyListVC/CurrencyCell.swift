//
//  CurrencyCell.swift
//  CurrencyConverter
//
//  Created by Priya Agarwal on 05/01/2021.
//

import UIKit

class CurrencyCell: UITableViewCell {

    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var imgCurrency: UIImageView!
    @IBOutlet weak var lblRates: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
