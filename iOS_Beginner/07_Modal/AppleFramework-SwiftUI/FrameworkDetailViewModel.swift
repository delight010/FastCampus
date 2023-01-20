//
//  FrameworkDetailViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by Seong A Oh on 2023/01/20.
//

import Foundation
import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    @Published var framework: AppleFramework
    @Published var isSafariPresented: Bool = false
    
    init(framework: AppleFramework) {
        self.framework = framework
    }
}
