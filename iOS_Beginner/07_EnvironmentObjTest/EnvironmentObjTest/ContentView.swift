//
//  FirstView.swift
//  EnvironmentObjTest
//
//  Created by joonwon lee on 2022/06/12.
//

import SwiftUI

struct FirstView: View {
    
    @EnvironmentObject var userProfile: UserProfileSettings
    var body: some View {
        NavigationView{
            VStack(spacing: 20)  {
                Text("Current Age: \(userProfile.age)")
                
                NavigationLink {
                    // 이동할 View
                    SecondView()
                } label: {
                    Text("Second View")
                }
                
                Button {
                    userProfile.haveBirthDayParty()
                    print("Button Pressed")
                } label: {
                    Text("Having Birthday Party")
                }
            }
            .navigationTitle("First View")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView().environmentObject(UserProfileSettings())
        // 프리뷰에서도 environmentObject 설정을 해야 함
    }
}
