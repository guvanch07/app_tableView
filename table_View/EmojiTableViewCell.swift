//
//  EmojiTableViewCell.swift
//  table_View
//
//  Created by Macbook on 11.06.22.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var emoji: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var subLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(object: EmojiModelData) {
        
        self.emoji.text = object.emoji
        self.label.text = object.title
        self.subLabel.text = object.subTitle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
