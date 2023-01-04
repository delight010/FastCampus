//
//  ContentView.swift
//  SymbolRoller-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct SymbolRollerView: View {
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @State var imageName: String = "moon" // real data
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .renderingMode(.template) // 원하는 색으로 변경할 수 있는 template로 적용
                .resizable() // resizing
                .aspectRatio(contentMode: .fit) // 비율
            Spacer()
            Text(imageName)
                .font(.system(size: 40, weight: .bold))
            Button {
                // tap
                print("Button tapped")
                imageName = symbols.randomElement()!
            } label: {
                HStack {
                    Image(systemName: "arrow.3.trianglepath")
                        .foregroundColor(.mint)
                    //내부 설정이 더 우선시 된다
                    VStack {
                        Text("Reload")
                            .font(.system(size: 30, weight: .bold, design: .default))
                        // design은 영문에만 적용됨
                        Text("Click me to Reload")
                    }
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 80)
            // .infinity: screen 안을 꽉 채움
            .background(.pink)
            .cornerRadius(40)
//            .clipShape(Capsule()) // 캡슐형태로 clip
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolRollerView()
    }
}
