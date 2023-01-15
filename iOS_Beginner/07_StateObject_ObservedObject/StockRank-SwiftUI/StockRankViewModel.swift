//
//  StockRankViewModel.swift
//  StockRank-SwiftUI
//
//  Created by Seong A Oh on 2023/01/14.
//

import Foundation

final class StockRankViewModel: ObservableObject {
    //@Published 변경된 사항에서 알림을 받을 수 있음
    @Published var models: [StockModel] = StockModel.list
    
    var numOfFavorite: Int {
        let favoriteStocks = models.filter { $0.isFavorite }
        return favoriteStocks.count
    }
}
