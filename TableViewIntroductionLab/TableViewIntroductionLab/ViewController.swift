//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return inProgress.count
        case 1:
            return notStarted.count
        case 2:
            return completed.count
        default:
            return 0
        }
        
    }
    
    
    
    let logic = Task.allTasks
    var completed: [Task] = []
    var inProgress: [Task] = []
    var notStarted: [Task] = []
    
//    var completed = getCompletedTasks()
//    var inProgress = getInProgressTasks()
//    var notStarted = getNotStartedTasks()
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func SortButton(_ sender: UIButton) {
    switchSort(sort: SortOutlet)
        
    }
    
    @IBOutlet weak var SortOutlet: UIButton!
    
    func switchSort(sort: UIButton) {
        if sort.titleLabel!.text == "Sort Descending" {
            sort.titleLabel!.text = "Sort Ascending"
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let names = logic[indexPath.row].name
        let dates = "\(logic[indexPath.row].dueDate)"
        let cell = tableView.dequeueReusableCell(withIdentifier: "name")!
        cell.textLabel?.text = names
        cell.detailTextLabel!.text = dates
        
        return cell
    }
//        let date = logic[indexPath.row].dueDate
//        let name = logic[indexPath.row].name
//        cell.textLabel?.text = "\(name) : \(date)"
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "In Progress"
        case 1:
            return "Not Started"
        case 2:
            return "Complete"
        default:
            return "Never"
        }
    }
    
    func separate(){
        for i in Task.allTasks {
        completed = i.getCompletedTasks()
        notStarted = i.getNotStartedTasks()
        inProgress = i.getInProgressTasks()
        }
    }
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        separate()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}



    

