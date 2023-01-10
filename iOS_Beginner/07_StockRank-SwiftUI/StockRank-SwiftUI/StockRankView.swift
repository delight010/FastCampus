//
//  ContentView.swift
//  StockRank-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct StockRankView: View {
    @State var list = StockModel.list
    var body: some View {
        NavigationView {
            //ForEach문으로 대응
            List($list) { $item in
                ZStack {
                    NavigationLink {
                        // tap 시 이동할 target
                        StockDetailView(stock: $item)
                    } label: {
                        EmptyView() // 비어있는 View
                        // 즉 투명한 버튼
                    }
                    StockRankRow(stock: $item)
                }
                .listRowInsets(EdgeInsets())
                .frame(height: 80)
            }
            .listStyle(.plain)
            .navigationTitle("Stock Rank")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StockRankView()
            .preferredColorScheme(.dark)
    }
}
