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
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension InfoViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell1 = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell") as! FirstTableViewCell

        switch indexPath.section {
        case 0:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell") as! FirstTableViewCell
            cell1.selectionStyle = .none
            return cell1
        case 1:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell") as! SecondTableViewCell
            cell2.selectionStyle = .none
            return cell2
        case 2:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "ThirdTableViewCell") as! ThirdTableViewCell
            cell3.selectionStyle = .none
            return cell3
        case 3:
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "FourthTableViewCell") as! FourthTableViewCell
            cell4.selectionStyle = .none
            return cell4
        default:
            return cell1
        }
    }

     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.systemGroupedBackground
        header.layer.borderColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0).cgColor
        header.layer.borderWidth = 0.25
        return header
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            guard let priorityDetailViewController = PriorityDetailViewController.createFromMainStoryboard() else { return }
            let navigationPriorityDetailVC = UINavigationController(rootViewController: priorityDetailViewController)
            navigationPriorityDetailVC.modalPresentationStyle = .automatic
            self.present(navigationPriorityDetailVC, animated: true, completion: nil)
        }
    }
}
