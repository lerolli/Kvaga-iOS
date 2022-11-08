import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    
    var tasks: [Task] = [
        Task(title: "Цветочный своп",place: "Антона Валека 12", description: "с 10:00 до 15:00", date: .init(timeIntervalSince1970: 16411111)),
        Task(title: "Своп предметов для рукоделия и творчества",place: "Антона Валека 12", description: "с 10:00 до 15:00", date: .init(timeIntervalSince1970: 16411111)),
        Task(title: "Своп Забери меня",place: "Антона Валека 12" , description: "Меняемся игрушками и детской одеждой!", date: .init(timeIntervalSince1970: 16411111))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker(
                        "День мероприятия",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                .datePickerStyle(.graphical)
                List(tasks, id: \.id) { task in
                    CalendarViewCell(task: task)
                    
                }.navigationTitle("Экомероприятия")
            }
        }
    }
}

struct CalendarViewCell: View {
    var task: Task
    var body: some View {
        VStack {
            HStack {
                Text(task.title)
                    .bold()
                    .font(.system(size: 20))
                    .padding(4)
                Spacer()
            }
            Text("🏢 \(task.place)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(4)
            Text("⏰ \(task.description)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(4)
        }
        
    }
}
