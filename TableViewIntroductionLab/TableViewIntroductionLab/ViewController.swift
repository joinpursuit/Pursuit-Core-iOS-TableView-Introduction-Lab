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
        let sortedTasks = Task.allTasks.sorted { $0.status.rawValue < $1.status.rawValue }
        let sectionsSet: Set<String> = Set(sortedTasks.map { $0.status.rawValue } )
        var tempMatrix = Array(repeating: [Task](), count: sectionsSet.count)
        
        var currentIndex = 0
        var currentSection = sortedTasks[0].status.rawValue
        
        for task in sortedTasks{
            if task.status.rawValue == currentSection{
                tempMatrix[currentIndex].append(task)
            } else {
                currentIndex += 1
                currentSection = task.status.rawValue
                tempMatrix[currentIndex].append(task)
            }
        }
        
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
        return tasks[section][0].status.rawValue
    }
}

