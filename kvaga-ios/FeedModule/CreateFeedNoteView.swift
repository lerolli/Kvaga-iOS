import SwiftUI

struct CreateFeedNoteView: View {
    @State var username = "Расскажите что-нибудь..."
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        VStack {
            
            TextEditor(text: $username)
                .foregroundColor(Color.gray)
                .font(.custom("HelveticaNeue", size: 13))
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 1)
                )
            Button("Опубликовать", action: {
                self.mode.wrappedValue.dismiss()
            })
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.blue, lineWidth: 1)
            )
        }
        .padding()
        .navigationTitle("Добавить запись")
    }
}

struct CreateFeedNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFeedNoteView()
    }
}
