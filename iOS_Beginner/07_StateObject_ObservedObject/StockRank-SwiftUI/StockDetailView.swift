//
//  StockDetailView.swift
//  StockRank-SwiftUI
//
//  Created by joonwon lee on 2022/06/06.
//

import SwiftUI

struct StockDetailView: View {
    // 아래 2가지 객체는 원본을 참조한다
    @ObservedObject var viewModel: StockRankViewModel
    @Binding var stock: StockModel
    
    var body: some View {
        VStack(spacing: 40) {
            
            Text("# of My favorites: \(viewModel.numOfFavorite)")
                .font(.system(size: 20, weight: .bold, design: .default))
            Image(stock.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:120, height: 120)
            Text(stock.name)
                .font(.system(size: 30, weight: .bold))
            Text("\(stock.price) 원")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(stock.diff > 0 ? .red : .blue)
            
            Button {
                stock.isFavorite.toggle()
                // true -> false
                // false -> true
            } label: {
                Image(systemName: "heart.fill")
                    .resizable()
                    .renderingMode(.template)
                // .template: 원하는 색으로 변경가능
                // .original: 항상 원본의 색상을 유지
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .foregroundColor(stock.isFavorite ? .white : .gray)
            }

            
        }
    }
}

struct StockDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StockDetailView(viewModel: StockRankViewModel(),
            stock: .constant(StockModel.list[0]))
            .preferredColorScheme(.dark)
    }
}
