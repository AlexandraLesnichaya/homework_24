//
//  ViewController.swift
//  homework_24
//
//  Created by Александра Лесничая on 4/17/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var toolbar: UIToolbar!

    var tableCellsArray: [UITableViewCell] = []
    let tableCellToAdd = UITableViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()

        doneButtonInvisibility()

        configureTableView()

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    private func configureTableView() {
        tableView.tableFooterView = UIView()
        toolbar.barTintColor = .systemBackground
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
    }

    private func doneButtonInvisibility() {
        doneButton.isEnabled = false
        doneButton.tintColor = UIColor.clear
    }
    
    private func doneButtonVisibility() {
        doneButton.isEnabled = true
        doneButton.tintColor = UIColor.systemBlue
    }

    @IBAction func addNewReminderButtonDidClick(_ sender: Any) {
        tableCellsArray.append(tableCellToAdd)
        self.tableView.reloadData()
        doneButtonVisibility()
    }

    @IBAction func editButtonDidClick(_ sender: Any) {
        var isEditing = tableView.isEditing
        isEditing.toggle()
        tableView.setEditing(isEditing, animated: true)
        if isEditing {
            editButton.title = "Done"
        } else {
            editButton.title = "Edit"
        }
    }

    @IBAction func doneButtonDidClick(_ sender: Any) {    // <- прятание клавиатуры при нажатии кнопки "Готово"
        view.endEditing(true)
        doneButtonInvisibility()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCellsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
//        cell.minHeight = 44

        tableView.cellForRow(at: indexPath)?.accessoryType = .detailButton

        return cell
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableCellsArray.remove(at: indexPath.row)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            self.tableView.deleteRows(at: [indexPath], with: .right)
        }
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedReminder = tableCellsArray[sourceIndexPath.row]
        tableCellsArray.remove(at: sourceIndexPath.row)
        tableCellsArray.insert(movedReminder, at: destinationIndexPath.row)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.isSelected == true {
            tableView.cellForRow(at: indexPath)?.accessoryType = .detailButton
        } else if tableView.cellForRow(at: indexPath)?.isSelected == false {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }

        doneButtonVisibility()
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }

    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        guard let infoViewController = InfoViewController.createFromMainStoryboard() else { return }
        let navigationInfoVC = UINavigationController(rootViewController: infoViewController)
        navigationInfoVC.modalPresentationStyle = .automatic
        self.present(navigationInfoVC, animated: true, completion: nil)
    }
}


