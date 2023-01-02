//
//  PlayerView.swift
//  DataFlow-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct PlayerView: View {
    let episode: Episode
    @State private var isPlaying: Bool = false
    // 재생여부를 관리하는 @State 정보
    // 이것이 real data
    
    //@State 정보가 변경됨에 따라 View를 재로드
    var body: some View {
        VStack(spacing: 20) {
            Text(episode.title)
                .font(.largeTitle)
            Text(episode.showTitle)
                .font(.title3)
                .foregroundColor(.gray)
            
            //진짜 data를 binding
            PlayButton(isPlaying: $isPlaying)
            // @State영향을 받음
            
            PlayingStatusView(isPlaying: $isPlaying)
            // control + command + e
            // 같은 객체의 이름을 전부 수정 가능
            
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(episode: Episode.list[0])
    }
}
