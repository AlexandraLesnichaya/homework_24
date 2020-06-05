//
//  TableViewCell.swift
//  homework_24
//
//  Created by Александра Лесничая on 4/25/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewBox: UIView!
//    var minHeight: CGFloat?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        textView.becomeFirstResponder()

        adjustUITextViewHeight(textView: textView, viewBox: viewBox)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//           let size = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
//           guard let minHeight = minHeight else { return size }
//           return CGSize(width: size.width, height: max(size.height, minHeight))
//       }

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
