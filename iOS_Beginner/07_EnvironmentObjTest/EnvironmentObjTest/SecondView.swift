//
//  SecondView.swift
//  EnvironmentObjTest
//
//  Created by Seong A Oh on 2023/01/15.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack(spacing: 20)  {
            NavigationLink {
                // 이동할 View
                ThirdView()
            } label: {
                Text("Third View")
            }
        }
        .navigationTitle("Second View")
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
