//
//  FilterAccordingToStatus.swift
//  TableViewIntroductionLab
//
//  Created by Angela Garrovillas on 8/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
func filterAccordingToStatus(arr: [Task], state: Task.Status) -> [Task] {
    switch state {
    case .notStarted:
        return arr.filter({(a:Task) -> Bool in return a.status == .notStarted})
    case .inProgress:
        return arr.filter({(a:Task) -> Bool in return a.status == .inProgress})
    case .completed:
        return arr.filter({(a:Task) -> Bool in return a.status == .completed})
    }
}
