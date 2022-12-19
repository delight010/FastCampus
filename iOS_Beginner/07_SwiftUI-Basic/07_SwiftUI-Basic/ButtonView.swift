//
//  ButtonView.swift
//  07_SwiftUI-Basic
//
//  Created by Seong A Oh on 2022/12/19.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button {
            print("button tapped")
        } label: {
            Text("Click Me")
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
