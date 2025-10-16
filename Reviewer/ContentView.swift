import SwiftUI

struct ContentView: View {
    
    @Environment(ReviewItemsRepository.self) private var repository
    
    var body: some View {
        ReviewItemsTreeTableView(reviewItems: repository.items)
    }
}
