//
//  SystemInfoTableViewCell.swift
//
//  Created by Zaber on 4/4/22.
//

import UIKit

class SystemInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var infoTitleLabel: UILabel!
    @IBOutlet var infoDescLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func reload(info: (String, String)){
        infoTitleLabel.text = info.0
        infoDescLabel.text = info.1
    }
}





