//
//  ImageView.swift
//  07_SwiftUI-Basic
//
//  Created by Seong A Oh on 2022/12/19.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image(systemName: "sun.max.fill")
            .renderingMode(.original)
            .resizable() // resizing 가능하도록 변경,
            .aspectRatio(contentMode: .fit) // 1:1비율, 화면에 꽉 차도록
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
