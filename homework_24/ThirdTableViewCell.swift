//
//  ThirdTableViewCell.swift
//  homework_24
//
//  Created by Александра Лесничая on 5/21/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit
import RealmSwift

class ThirdTableViewCell: UITableViewCell {

    @IBOutlet weak var remindByPlaceLabel: UILabel!
    @IBOutlet weak var remindByPlaceSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
