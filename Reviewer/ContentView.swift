import SwiftUI

struct ContentView: View {
    
    @Environment(ReviewItemsRepository.self) private var repository
    @State private var isShowingInspector = false
    

    
    var body: some View {
        ReviewItemsTreeTableView(reviewItems: repository.items)
            .toolbar (id: "main") {
                ToolbarItem(id: "inspector") {
                    Button(action: {
                        isShowingInspector.toggle()
                    } ) {
                        Label("Inspector", systemImage: "sidebar.trailing")
                    }
                }
            }
            .inspector(isPresented: $isShowingInspector) {
                InspectorView()
                    .inspectorColumnWidth(min: 150, ideal: 150, max: 300)
                    .interactiveDismissDisabled()
            }
    }
}
