//
//  TableViewCellForSection.swift
//  MarvelUniverse
//
//  Created by Hader on 16/6/23.
//

import UIKit

class TableViewCellForSection: UITableViewCell {

    @IBOutlet weak var seriesImg: UIImageView!
    
    @IBOutlet weak var seriesYear: UILabel!
    @IBOutlet weak var seriesName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
       
    }



}
