//
//  StockRank_SwiftUIApp.swift
//  StockRank-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

@main
struct StockRank_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            StockRankView()
                .preferredColorScheme(.dark) // 앱의 라이트/다크모드 설정(강제로 설정)
        }
    }
}
