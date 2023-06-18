//
//  TableViewCellForRow.swift
//  MarvelUniverse
//
//  Created by Hader on 17/6/23.
//

import UIKit

class TableViewCellForRow: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        seriesDescrp.isEditable = false
    }

    @IBOutlet weak var seriesDescrp: UITextView!
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = CGRect(x: 0, y: 0, width: 393, height: 200)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
