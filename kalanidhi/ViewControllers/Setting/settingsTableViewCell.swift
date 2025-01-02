//
//  settingsTableViewCell.swift
//  kalanidhi
//
//  Created by Batch  - 2 on 02/01/25.
//

import UIKit

class settingsTableViewCell: UITableViewCell {
    
    
    @IBOutlet var settingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(setting: Setting) {
        settingLabel.text = setting.value
    }

}
