//
//  InspectorView.swift
//  Reviewer
//
//  Created by Holger Hinzberg on 17.10.25.
//

import SwiftUI

struct InspectorView: View {
    var body: some View {
        VStack {
            ReviewItemsCountChartView()
                .frame(width: 170, height: 170)
               .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0) )
            ReviewItemsCountView()
            Spacer()
        }
    }
}

#Preview {
    InspectorView()
}
