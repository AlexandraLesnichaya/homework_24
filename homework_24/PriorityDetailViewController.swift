//
//  PriorityDetailController.swift
//  homework_24
//
//  Created by Александра Лесничая on 5/24/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit
import RealmSwift

class PriorityDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let noPriority: String = "Нет"

    let priorityDegrees: [String] = ["Низкий", "Средний", "Высокий"]

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
            return priorityDegrees.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        switch section {
        case 0:
            header.backgroundColor = UIColor.systemGroupedBackground
        case 1:
            header.frame.size.height = 2
            header.backgroundColor = UIColor.systemGray3
        default:
            header.backgroundColor = UIColor.clear
        }
        return header
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PriorityDetailTableViewCell") as! PriorityDetailTableViewCell

        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        switch indexPath.section {
        case 0:
            cell.priorityDegreeLabel.text = noPriority
        case 1:
            cell.priorityDegreeLabel.text = priorityDegrees[indexPath.row]
            if indexPath.row == 2 {
                cell.separatorInset = UIEdgeInsets(top: cell.bounds.minY, left: 0, bottom: cell.bounds.maxY, right: 0)
            }
        default:
            return cell
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
