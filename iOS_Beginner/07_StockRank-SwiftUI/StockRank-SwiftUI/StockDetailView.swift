//
//  StockDetailView.swift
//  StockRank-SwiftUI
//
//  Created by Seong A Oh on 2023/01/10.
//

import SwiftUI

struct StockDetailView: View {
    @Binding var stock: StockModel
    // 실제 데이터는 @State 변수로.
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Image(stock.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                Text(stock.name)
                    .font(.system(size: 30, weight: .bold))
                Text("\(stock.price) 원")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(stock.diff > 0 ? .red : .blue)
            }
        }
        .navigationTitle("Stock Detail View")
    }
}

struct StockDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StockDetailView(stock: .constant( StockModel.list[0]))
        // 임의의 데이터를 넣기 위해
        // .constant를 사용
            .preferredColorScheme(.dark)
        // 프리뷰에서 볼 라이트/다크모드 설정
    }
}
