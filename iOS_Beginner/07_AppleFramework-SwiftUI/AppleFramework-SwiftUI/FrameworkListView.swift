//
//  ContentView.swift
//  AppleFramework-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

// command + name 클릭으로 해당하는
// view의 이름을 전부 수정 가능
struct FrameworkListView: View {
    @State var list: [AppleFramework] = AppleFramework.list
    
    //1줄에 들어갈 cell 정의(현재는 3개)
    //.flexible: 화면 크기에 따라 유연하게 사이즈가 바뀜
    //.fixed: 사이즈 고정
    //.adaptive: 최소 크기, 최대 크기를 정의하고,
    // 화면 사이즈가 남는 다면 알아서 cell을 추가함
    let layout: [GridItem] = [GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible())
    ]
    var body: some View {
        
        //Grid 만들기
        // UIKit: UIColectionView
        //  -Data, Presentation Layout
        // SwiftUI: LazyVGrid, LazyHGrid
        //  -Data, Presentation, Layout
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(list) { item in
                        FrameworkCell(framework: item)
                    }
                }
                .padding([.top, .leading, .trailing], 16.0)
                // 상단, 좌, 우에 padding 16 적용
            }
            .navigationTitle("☀️ Apple Framework")
            // 이모티콘은 control + command + space
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
    }
}
