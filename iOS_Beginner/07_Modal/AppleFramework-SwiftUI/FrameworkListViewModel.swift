//
//  FrameworkListViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by Seong A Oh on 2023/01/20.
//

import Foundation

final class FrameworkListViewModel: ObservableObject {
    @Published var models: [AppleFramework] = AppleFramework.list
    @Published var isShowingDetail: Bool = false
    @Published var selectedItem: AppleFramework? // 선택된 아이템이 없을 수도 있음
}
