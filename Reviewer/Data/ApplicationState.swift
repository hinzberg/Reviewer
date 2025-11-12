//  ApplicationState.swift
//  Reviewer
//  Created by Holger Hinzberg on 17.10.25.

import SwiftUI
import Combine

public class ApplicationState: ObservableObject {
    @Published var isShowingInspector = true
}
