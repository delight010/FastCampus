//
//  ContentView.swift
//  07_SwiftUI-Basic
//
//  Created by Seong A Oh on 2022/12/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // main View를 담당
        VStack() {
            
            ImageView()
            ButtonView()
            TextView()
            
            Spacer()
            // StackView사이에 공간을 넣어줌
            
            HStack {
                ImageView()
                ButtonView()
                TextView()
            }
            
            ZStack {
                ImageView()
                ButtonView()
                TextView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
