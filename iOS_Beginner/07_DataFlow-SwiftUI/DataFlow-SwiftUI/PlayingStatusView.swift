//
//  PlayingStatusView.swift
//  DataFlow-SwiftUI
//
//  Created by Seong A Oh on 2023/01/02.
//

import SwiftUI

struct PlayingStatusView: View {
    @Binding var isPlaying: Bool
    // 진짜 데이터를 받아와서 binding(참조)
    
    var body: some View {
        Image(systemName: isPlaying ?  "sun.max.fill" : "sun.max")
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
    }
}
