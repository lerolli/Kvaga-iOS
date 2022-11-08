
import SwiftUI

struct ProfileView: View {
    var notes: [Note]
    
    var body: some View {
        VStack {
            Image(notes.first?.imageString ?? "")
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(150 / 2)
            HStack {
                Text(notes.first?.authorName ?? "")
            }
            List(notes, id: \.authorName) { note in
                Section(
                    content: {
                        Text(note.text)
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                    },
                    header: {})
            }
        }
    }
}
