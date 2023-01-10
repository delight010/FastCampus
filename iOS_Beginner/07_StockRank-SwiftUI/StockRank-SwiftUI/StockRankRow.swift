//
//  StockRankRow.swift
//  StockRank-SwiftUI
//
//  Created by Seong A Oh on 2023/01/05.
//

import SwiftUI

struct StockRankRow: View {
    @Binding var stock: StockModel
    // @Binding이 없다면
    // 값을 복사하게 됨.
    var body: some View {
        HStack {
            Text("\(stock.rank)")
                .font(.system(size: 16, weight: .bold, design: .default))
                .frame(width: 30)
                .foregroundColor(.blue)
            Image(stock.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 5) {
                Text("\(stock.name)")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                HStack {
                    Text("\(stock.price) 원")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    Text("\(stock.diff * 100, specifier: "%.2f") %")
                        .font(.system(size: 12))
                        .foregroundColor(stock.diff > 0 ? .red : .blue)
                }
            }
            Spacer()
            Image(systemName: "heart.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity) // .infinity: 화면을 꽉 채움
        .background(.black)
    }
}

struct StockRankRow_Previews: PreviewProvider {
    static var previews: some View {
        StockRankRow(stock: .constant( StockModel.list[2]))
            .previewLayout(.fixed(width: 390, height: 80))
        // 프리뷰 레이아웃 고정크기 지정
    }
}
