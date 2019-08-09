//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var sortButton: UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return Task.organizeTasksByStatus()[0].count
        case 1:
            return Task.organizeTasksByStatus()[1].count
        case 2:
            return Task.organizeTasksByStatus()[2].count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "individualTask", for: indexPath)
        setCellLabelText(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func setCellLabelText(cell: UITableViewCell, indexPath: IndexPath) {
        cell.textLabel?.text = "\(Task.getTaskName(indexPath: indexPath))"
        cell.detailTextLabel?.text = "\(Task.getDueDate(indexPath: indexPath))"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Not Started"
        case 1:
            return "In Progress"
        case 2:
            return "Completed"
        default:
            return "Not Available"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }

    @IBAction func toggleSortOrder(_ sender: UIButton) {
        switch Task.ascendingOrder {
        case true:
            sortButton.setTitle("Sort: Ascending", for: UIControl.State.normal)
        case false:
            sortButton.setTitle("Sort: Descending", for: UIControl.State.normal)
        }
        Task.ascendingOrder = !Task.ascendingOrder
        taskTableView.reloadData()
    }
}

