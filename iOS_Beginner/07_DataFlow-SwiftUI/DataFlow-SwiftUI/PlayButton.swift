//
//  PlayButton.swift
//  DataFlow-SwiftUI
//
//  Created by Seong A Oh on 2023/01/02.
//

import SwiftUI

struct PlayButton: View {
    @Binding var isPlaying: Bool
    // 진짜 데이터를 받아와서 binding(참조)
    
    var body: some View {
        Button { // @State영향을 받음
            self.isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "pause.circle": "play.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 80)
                .foregroundColor(.primary)
        }
    }
}
