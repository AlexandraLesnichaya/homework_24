//
//  FirstTableViewCell.swift
//  homework_24
//
//  Created by Александра Лесничая on 5/21/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit
import RealmSwift

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var reminderLabelForEditing: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
