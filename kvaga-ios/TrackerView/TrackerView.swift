import SwiftUI

struct TrackerView: View {
    var trackers: [Tracker] = [
        Tracker(emogi: "🛍", title: "Покупки без пакетов", count: 1),
        Tracker(emogi: "☕️", title: "Покупать кофе в свою кружку", count: 16),
        Tracker(emogi: "🥤", title: "Пользоваться многоразовой посудой", count: 20)
    ]

    var body: some View {
        NavigationView {
            List(trackers, id: \.emogi) { tracker in
                ListViewRow(tracker: tracker)
            }.navigationTitle("Привычки сентября")
        }
        
    }
}

struct Tracker {
    var emogi: String
    var title: String
    var count: Int
}


struct ListViewRow: View {
    var tracker: Tracker
    var body: some View {
        HStack {
            Text(tracker.emogi)
                .font(.system(size: 30))
            VStack(alignment: .leading) {
                    Text(tracker.title)
                    Text("В этом месяце \(tracker.count)/30")
                        .bold()
            }.padding()
            Spacer()
            Button {
            } label: {
                Text("✓")
            }
            .buttonStyle(.bordered)
        }
    }
}
