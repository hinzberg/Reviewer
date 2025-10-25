import SwiftUI
import Observation

struct ReviewItemsCountView: View {
    @Environment(ReviewItemsRepository.self) private var repository

    var body: some View {
        VStack {
            ReviewItemsCountLineView( value: repository.okItemsCount, color : Color.Ok, text: "OK" )
            ReviewItemsCountLineView( value: repository.reviewItemsCount, color : Color.Review, text: "Review" )
            ReviewItemsCountLineView( value: repository.failedtemsCount, color : Color.Failed, text: "Failed" )
            ReviewItemsCountLineView( value: repository.uncheckedItemsCount, color : Color.Unchecked, text: "Unchecked" )
        }
    }
}

#Preview {
    // Provide a repository instance in the environment for previewing
    let repo = ReviewItemsRepository()
    return ReviewItemsCountView()
        .environment(repo)
}
