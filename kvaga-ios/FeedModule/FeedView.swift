import Foundation
import SwiftUI

struct FeedView: View {
    var viewModel = FeedViewModel()
    @State private var selectedNote: Note? = nil
    
    
    var body: some View {
        NavigationView {
            List(viewModel.notes, id: \.authorName, selection: $selectedNote) { note in
            Section(
                content: {
                    NavigationLink(destination: FullNoteView(note: note)) {
                        ExpandableText(note.text, lineLimit: 6)
                    }
                },
                header: {
                    NavigationLink(destination: ProfileView(notes: viewModel.notes.filter {$0.authorName == note.authorName})) {
                        HStack {
                            Image(note.imageString)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(30 / 2)
                            Text(note.authorName)
                            .font(.body)
                            .bold()
                            .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    
                })
        
            }
            .onAppear(perform: {
            })
            .navigationTitle("Лента")
            .toolbar(content: {
                ToolbarItem(content: {
                    NavigationLink("Cоздать", destination: CreateFeedNoteView())
                })
                
            })
        }
    }
}

