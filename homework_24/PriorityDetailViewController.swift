//
//  PriorityDetailController.swift
//  homework_24
//
//  Created by Александра Лесничая on 5/24/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class PriorityDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let priorityDegrees: [String] = ["Нет", "Низкий", "Средний", "Высокий"]

    var priority: String?
    
    let heightForFooter: CGFloat = 2.0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self

        configureTableView()
    }

    private func configureTableView() {
        tableView.tableFooterView = UIView()
    }
}

extension PriorityDetailViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return priorityDegrees.count - 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return heightForFooter
        case 1:
            return 0
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PriorityDetailTableViewCell") as! PriorityDetailTableViewCell

        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        switch indexPath.row {
        case 0:
            cell.priorityDegreeLabel.text = priorityDegrees[0]
        case 1:
            cell.priorityDegreeLabel.text = priorityDegrees[1]
        case 2:
            cell.priorityDegreeLabel.text = priorityDegrees[2]
        case 3:
            cell.priorityDegreeLabel.text = priorityDegrees[3]
        default:
            return cell
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        priority = tableView.cellForRow(at: indexPath)?.textLabel?.text
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
