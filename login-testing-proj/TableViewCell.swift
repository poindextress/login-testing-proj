//
//  TableCell.swift
//  login-testing-proj
//
//  Created by Ashlei Mitchell on 4/24/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelSender: UILabel!
    @IBOutlet weak var labelSubject: UILabel!
    @IBOutlet weak var labelBody: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
