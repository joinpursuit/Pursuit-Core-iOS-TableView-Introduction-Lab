import Foundation

struct Task {
    enum Status {
        case notStarted
        case inProgress
        case completed
    }
    
    let name: String
    let status: Status
    let dueDate: Date
    
    static var ascendingOrder = true
    
    static var allTasks: [Task] {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return [
            Task(name: "Create project roadmap",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "08-13-2020")!),
            Task(name: "Source information session speakers",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "09-22-2020")!),
            Task(name: "Secure event funding",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "09-28-2020")!),
            Task(name: "Secure venue for keynote",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "10-23-2020")!),
            Task(name: "Identify event KPIs",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "7-04-2020")!),
            Task(name: "Create internal newsletter advertising event",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "6-09-2020")!),
            Task(name: "Submit food budget",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "6-12-2020")!),
            Task(name: "Create event logo",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "5-02-2020")!),
            Task(name: "Make companion iOS application for event",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "11-14-2020")!),
            Task(name: "Get celebrity speaker (Tim Cook?)",
                 status: .inProgress,
                 dueDate: dateFormatter.date(from: "8-16-2020")!),
            Task(name: "Purchase event insurance",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "5-19-2020")!),
            Task(name: "Get event SWAG",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "8-20-2020")!),
            Task(name: "Secure seat with SpaceX",
                 status: .notStarted,
                 dueDate: dateFormatter.date(from: "11-13-2020")!),
            Task(name: "Conduct brainstorming session",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "10-03-2020")!),
            Task(name: "Get all necessary headcount allocated",
                 status: .completed,
                 dueDate: dateFormatter.date(from: "04-13-2020")!),
        ]
    }
    
    static func organizeTasksByStatus() -> [[Task]] {
        let notStarted = Task.allTasks.filter { $0.status == .notStarted }
        let inProgress = Task.allTasks.filter { $0.status == .inProgress }
        let completed = Task.allTasks.filter { $0.status == .completed }
        
        return [notStarted, inProgress, completed]
    }
    
    static func getTaskName(indexPath: IndexPath) -> String {
        if ascendingOrder {
            return Task.sortByAscendingDates()[indexPath.section][indexPath.row].name
        } else {
            return Task.sortByDescendingDates()[indexPath.section][indexPath.row].name
        }
    }
    
    static func getDueDate(indexPath: IndexPath) -> String {
        if ascendingOrder {
            return Task.sortByAscendingDates()[indexPath.section][indexPath.row].dueDate.description(with: Locale.autoupdatingCurrent)
        } else {
            return Task.sortByDescendingDates()[indexPath.section][indexPath.row].dueDate.description(with: Locale.autoupdatingCurrent)
        }
    }
    
    static func sortByAscendingDates() -> [[Task]] {
        let notStartedSorted = Task.organizeTasksByStatus()[0].sorted(by: { $0.dueDate < $1.dueDate } )
        let inProgressSorted = Task.organizeTasksByStatus()[1].sorted(by: { $0.dueDate < $1.dueDate } )
        let completedSorted = Task.organizeTasksByStatus()[2].sorted(by: { $0.dueDate < $1.dueDate } )
        
        return [notStartedSorted, inProgressSorted, completedSorted]
        
    }
    
    static func sortByDescendingDates() -> [[Task]] {
        let notStartedSorted = Task.organizeTasksByStatus()[0].sorted(by: { $0.dueDate > $1.dueDate } )
        let inProgressSorted = Task.organizeTasksByStatus()[1].sorted(by: { $0.dueDate > $1.dueDate } )
        let completedSorted = Task.organizeTasksByStatus()[2].sorted(by: { $0.dueDate > $1.dueDate } )
        
        return [notStartedSorted, inProgressSorted, completedSorted]
    }
    
}
