import SwiftUI

struct ContentView: View {
    
    @Environment(ReviewItemsRepository.self) private var repository
    @EnvironmentObject var appState: ApplicationState
    
    var body: some View {
        
        ReviewItemsTreeTableView(repository: repository)
            .toolbar (id: "main") {
                /*
                ToolbarItem(id: "expand") {
                    Button(action: {
                        appState.expandAll.toggle()
                    } ) {
                        Label("Expand all", systemImage: "list.bullet.indent")
                    }
                }
                */
                ToolbarItem(id: "inspector") {
                    Button(action: {
                        appState.isShowingInspector.toggle()
                    } ) {
                        Label("Inspector", systemImage: "sidebar.trailing")
                    }
                }
            }
            .inspector(isPresented: $appState.isShowingInspector)
            {
                InspectorView()
                    .inspectorColumnWidth(min: 220, ideal: 220, max: 220)
                    .interactiveDismissDisabled()
            }
    }
}
