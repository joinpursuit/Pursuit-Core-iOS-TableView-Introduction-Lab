//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableViewTasks: UITableView!
    
//    private var tasks = [Task]() {
//        didSet {
//            tableViewTasks.reloadData()
//        }
//    }

    private var taskss = [[Task]]() {
        didSet {
            tableViewTasks.reloadData()
        }
    }
    
    private var  sortAscending = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewTasks.dataSource = self
//        sortData(true)
        dump(Task.getSection())
        loadData()
    }
    func loadData() {
      taskss = Task.getSection()
    }
    
//    @IBAction func sortButtonPressed(_ sender: UIBarButtonItem) {
//        sortAscending.toggle()
//        sortData(sortAscending)
//    }
    
//    func sortData(_ sortAscending: Bool) {
//        if sortAscending {
//            tasks = Task.allTasks.sorted { $0.name < $1.name }
//            navigationItem.rightBarButtonItem?.title = "Sort Descending"
//        } else {
//            tasks = Task.allTasks.sorted { $0.name > $1.name }
//            navigationItem.rightBarButtonItem?.title = "Sort Ascending"
//        }
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return taskss.count
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskss[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = taskss[indexPath.section][indexPath.row]
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.dueDate.description
       // let currentSection = indexPath.section
        //let taskAtRow = tasks[currentSection][task]
        return cell
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let section = tableView.
//    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return taskss[section].first?.status.rawValue
    }
    
}
