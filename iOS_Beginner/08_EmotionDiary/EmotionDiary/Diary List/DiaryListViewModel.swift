//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by Seong A Oh on 2023/03/01.
//

import Foundation

final class DiaryListViewModel: ObservableObject {
    // 원하는 것
    // Sequence -> Dictionary
    // [String: [MoodDiary]]
    // ["2022-02": [MoodDiary]]
    
    @Published var list: [MoodDiary] = MoodDiary.list
    @Published var dic: [String: [MoodDiary]] = [:]
    
    init() {
        // 딕셔너리 그룹핑
        // grouping: 그룹핑할 대상
        // by: 그룹핑할 기준
        self.dic = Dictionary(grouping: self.list, by: { $0.monthlyIdentifier })
    }
    
    var keys: [String] {
        // 순서정렬해서 return
        // "2022-4", "2022-5"...
        return dic.keys.sorted { $0 < $1 }
    }
}
