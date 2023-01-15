//
//  UserProfileSettings.swift
//  EnvironmentObjTest
//
//  Created by Seong A Oh on 2023/01/15.
//

import Foundation

final class UserProfileSettings: ObservableObject {
    @Published var name: String = ""
    @Published var age: Int = 0
    
    func haveBirthDayParty() {
        age += 1
    }
}
