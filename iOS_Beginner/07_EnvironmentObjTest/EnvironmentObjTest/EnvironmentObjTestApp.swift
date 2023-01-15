//
//  EnvironmentObjTestApp.swift
//  EnvironmentObjTest
//
//  Created by joonwon lee on 2022/06/12.
//

import SwiftUI

@main
struct EnvironmentObjTestApp: App {
    
    @StateObject var userProfile = UserProfileSettings()
    var body: some Scene {
        WindowGroup {
            FirstView().environmentObject(userProfile)
            //userProfile의 정보를 FirstView부터
            // 계속 넘어갈 수 있게끔 함
        }
    }
}
