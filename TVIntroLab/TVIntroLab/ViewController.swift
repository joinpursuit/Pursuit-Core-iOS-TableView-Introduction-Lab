//
//  ViewController.swift
//  TVIntroLab
//
//  Created by Ahad Islam on 12/14/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "Task Cell")
        return tableView
    }()
    
    private var tasks = Task.allTasks

    private var groupedTasksKey: [Task.Status] {
        Dictionary(grouping: tasks) { $0.status}
            .sorted(by: {$0.key < $1.key})
            .map({$0.key})
        }
    
    private var groupedTasks: [[Task]] {
        Dictionary(grouping: tasks) { $0.status}
        .sorted(by: {$0.key < $1.key})
        .map({$0.value})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureView()
        print(tasks.count)
        print(groupedTasks.count)
        groupedTasks.forEach({print($0.count)})
    }
    
    private func configureView() {
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = .secondarySystemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}

extension ViewController: UITableViewDelegate {}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupedTasksKey[section].rawValue
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupedTasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedTasks[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Task Cell", for: indexPath)
        print(indexPath.section, terminator: " ")
        print(indexPath.row)
        let task = groupedTasks[indexPath.section][indexPath.row]
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.dueDate.description
        cell.backgroundColor = .tertiarySystemBackground
        return cell
    }
}
