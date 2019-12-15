//
//  ViewController.swift
//  TVIntroLab
//
//  Created by Ahad Islam on 12/14/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Sort Ascending", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "Task Cell")
        return tableView
    }()
    
    private var tasks = Task.allTasks {
        didSet {
            tableView.reloadData()
        }
    }

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
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        switch sender.title(for: .normal) {
        case "Sort Ascending":
            tasks = tasks.sorted(by: {$0.name > $1.name })
            sender.setTitle("Sort Descending", for: .normal)
        case "Sort Descending":
            tasks = tasks.sorted(by: {$0.name < $1.name })
            sender.setTitle("Sort Ascending", for: .normal)
        default:
            break
        }
    }
    
    private func configureView() {
        setupButton()
        setupTableView()
    }
    
    private func setupButton() {
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.widthAnchor.constraint(equalToConstant: button.intrinsicContentSize.width + 30)])
        
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = .secondarySystemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: button.bottomAnchor),
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
        let task = groupedTasks[indexPath.section][indexPath.row]
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.dueDate.description
        cell.backgroundColor = .tertiarySystemBackground
        return cell
    }
}
