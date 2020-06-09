//
//  SecondTableViewCell.swift
//  homework_24
//
//  Created by Александра Лесничая on 5/21/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit
import RealmSwift

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var remindPerDayLabel: UILabel!
    @IBOutlet weak var remindPerDaySwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
