import Foundation
import SwiftUI

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var place: String
    var description: String
    var date: Date
}

    
