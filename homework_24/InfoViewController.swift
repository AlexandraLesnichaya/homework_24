//
//  InfoViewController.swift
//  homework_24
//
//  Created by Александра Лесничая on 4/27/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit
import RealmSwift

class InfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self

        configureTableView()
    }

    private func configureTableView() {
        tableView.tableFooterView = UIView()
    }

    @IBAction func doneButtonDidClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension InfoViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return 1
//        case 1:
//            return 1
//        case 2:
//            return 1
//        case 3:
//            return 1
//        default:
//            return 0
//        }
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell") as! FirstTableViewCell
//            cell.reminderLabelForEditing.text = reminder?.title
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell") as! SecondTableViewCell
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdTableViewCell") as! ThirdTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FourthTableViewCell") as! FourthTableViewCell
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
//            tableView.cellForRow(at: indexPath)?.detailTextLabel.text = priorityDegree
            guard let priorityDetailViewController = PriorityDetailViewController.createFromMainStoryboard() else { return }
            priorityDetailViewController.modalPresentationStyle = .automatic
            self.present(priorityDetailViewController, animated: true, completion: nil)
        }
    }
}
