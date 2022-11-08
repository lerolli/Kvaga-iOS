import SwiftUI

struct FullNoteView: View {
    let note: Note
    @State var username = ""
    var body: some View {
        VStack {
            HStack {
                Image(note.imageString)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(150 / 2)
                Text(note.authorName)
                    .bold()
                Spacer()
            }
            Text(note.text)
            Spacer()
            TextField("Прокомментировать", text: $username)
                .cornerRadius(16)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 1)
                )
        }.padding()
    }
}


struct ExpandableText: View {
    @State private var expanded: Bool = false
    @State private var truncated: Bool = false
    private var text: String

    let lineLimit: Int

    init(_ text: String, lineLimit: Int) {
        self.text = text
        self.lineLimit = lineLimit
    }

    private var moreLessText: String {
        if !truncated {
            return ""
        } else {
            return self.expanded ? "Скрыть" : "Показать больше"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .lineLimit(expanded ? nil : lineLimit)
                .background(
                    Text(text).lineLimit(lineLimit)
                        .background(GeometryReader { visibleTextGeometry in
                            ZStack { //large size zstack to contain any size of text
                                Text(self.text)
                                    .background(GeometryReader { fullTextGeometry in
                                        Color.clear.onAppear {
                                            self.truncated = fullTextGeometry.size.height > visibleTextGeometry.size.height
                                        }
                                    })
                            }
                            .frame(height: .greatestFiniteMagnitude)
                        })
                        .hidden() //keep hidden
            )
            if truncated {
                Button(action: {
                    withAnimation {
                        expanded.toggle()
                    }
                }, label: {
                    Text(moreLessText)
                })
            }
        }
    }
}
