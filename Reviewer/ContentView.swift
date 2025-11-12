import SwiftUI

struct ContentView: View {
    
    @Environment(ReviewItemsRepository.self) private var repository
    @EnvironmentObject var appState: ApplicationState
    
    var body: some View {
        
        ReviewItemsTreeTableView(repository: repository)
            .toolbar {
                
                ToolbarItemGroup(placement: .principal) {
                    Button(action: {
                        //appState.expandAll.toggle()
                    } ) {
                        Label("Note", systemImage: "quote.bubble")
                    }
                    Button(action: {
                        // Does nothing. Just for show
                    } ) {
                        Label("Check all", systemImage: "checklist.checked")
                    }
                    Button(action: {
                        // Does nothing. Just for show
                    } ) {
                        Label("Refresh", systemImage: "arrow.2.squarepath")
                    }
                }
                                
                ToolbarItemGroup(placement: .primaryAction) {
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
            .navigationTitle(getWindowTitleWithVersion())
    }
    
    func getWindowTitleWithVersion() -> String {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        return "Reviewer - Version \(appVersion!)"
    }
}
