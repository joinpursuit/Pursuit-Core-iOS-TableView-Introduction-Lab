//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties and Outlets
    @IBOutlet weak var tableView: UITableView!

    private var tasks: [[Task]] = []{
        didSet{
            tableView.reloadData()
        }
    }
    private var sortHighOrLow: Bool = true
    
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tasks = filterTasks(Task.allTasks)
        navigationItem.leftBarButtonItem?.title = "Sort Ascending"
    }

    // MARK: Actions and Other methods

    // Creates a matrix of tasks based on their status
    func filterTasks(_ taskList: [Task]) -> [[Task]] {
        var tempMatrix: [[Task]] = []
        var tempArray1: [Task] = []
        var tempArray2: [Task] = []
        var tempArray3: [Task] = []
            for task in taskList{
                switch task.status{
                case .notStarted:
                    tempArray1.append(task)
                case .inProgress:
                    tempArray2.append(task)
                case .completed:
                    tempArray3.append(task)
                }
            }
        tempMatrix.append(tempArray1)
        tempMatrix.append(tempArray2)
        tempMatrix.append(tempArray3)
        return tempMatrix
    }
    
    @IBAction func pressedBarButton(_ sender: UIBarButtonItem){
        sortTasks(sortHighOrLow)
        sortHighOrLow = !sortHighOrLow
    }
    
    func sortTasks(_ sort: Bool){
        if sort{
            for i in 0..<tasks.count{
                tasks[i] = tasks[i].sorted{ $0.name < $1.name}
            }
            navigationItem.leftBarButtonItem?.title = "Sort Descending"
        } else {
            for i in 0..<tasks.count{
                tasks[i] = tasks[i].sorted{ $0.name > $1.name }
            }
            navigationItem.leftBarButtonItem?.title = "Sort Ascending"
        }
    }
}



// MARK: UITableViewDelegate methods
extension ViewController: UITableViewDelegate{
    
}

// MARK: UITableViewDataSource Methods
extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let row  = tasks[indexPath.section][indexPath.row]
        xCell.textLabel?.text = row.name
        xCell.detailTextLabel?.text = "Due on: \(row.dueDate.description)"
        return xCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tasks[section][section].status.rawValue
    }
}

