//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Task.allTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "cellTask")
        
        
        if let unwrappedCell = cell {
            unwrappedCell.textLabel?.text = Task.allTasks[indexPath.row].name
        
            unwrappedCell.detailTextLabel?.text = Task.allTasks[indexPath.row].dueDate.description(with: .autoupdatingCurrent)
        
        
            return unwrappedCell
        }
        return UITableViewCell()
    }
    
    @IBOutlet weak var taskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskTableView.dataSource = self
        taskTableView.delegate = self
    }


}

