//
//  ReminderInfo.swift
//  homework_24
//
//  Created by Александра Лесничая on 4/25/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import Foundation
import RealmSwift

class Reminder: Object {
    @objc dynamic var title: String?
    @objc dynamic var priorityDegree: String?
}





