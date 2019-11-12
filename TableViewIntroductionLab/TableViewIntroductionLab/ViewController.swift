//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var tasks = [Task.allTasks]{
        didSet{
            //reload the table view
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        tasks = Task.getSections()
    }
}

extension ViewController:UITableViewDataSource {
    
    //CELL METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        //object at current indexPath
        let cellObj = tasks[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = cellObj.name
        cell.detailTextLabel?.text = cellObj.dueDate.description
        
        return cell
    }
    
    //SECTION METHODS
    func numberOfSections(in tableView: UITableView) -> Int {
        tasks.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionName:String?
        if tasks[section].first?.status.rawValue == "completed"{
            sectionName = "Completed"
        } else if tasks[section].first?.status.rawValue == "inProgress"{
            sectionName = "In Progress"
        } else if tasks[section].first?.status.rawValue == "notStarted"{
            sectionName = "Not Started"
        }
        return sectionName
        //return tasks[section].first?.status.rawValue
    }
}
