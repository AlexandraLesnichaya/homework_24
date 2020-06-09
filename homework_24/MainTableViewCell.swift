//
//  TableViewCell.swift
//  homework_24
//
//  Created by Александра Лесничая on 4/25/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//
import UIKit
import RealmSwift

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewBox: UIView!
//    var minHeight: CGFloat?
    let realm = try! Realm()

    override func awakeFromNib() {
        super.awakeFromNib()

        textView.becomeFirstResponder()

        adjustUITextViewHeight(textView: textView, viewBox: viewBox)

        addTitleOfReminder()

        let filePath = realm.configuration.fileURL
        print(filePath)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//           let size = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
//           guard let minHeight = minHeight else { return size }
//           return CGSize(width: size.width, height: max(size.height, minHeight))
//       }

    func addTitleOfReminder() {
//        try! FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
        let titleOfReminder = Reminder()
        titleOfReminder.title = textView.text

        try! realm.write {
            realm.add(titleOfReminder)
        }
    }

    func adjustUITextViewHeight(textView: UITextView, viewBox: UIView) {
        textView.isScrollEnabled = false
        let size = CGSize(width: viewBox.frame.width - 45.0, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)

        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}
