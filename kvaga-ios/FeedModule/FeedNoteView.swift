import Foundation
import SwiftUI

struct NoteView: View {
    let note: Note
    
    var body: some View {
        Text(note.text)
    }
}
