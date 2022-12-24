//
//  TextView.swift
//  07_SwiftUI-Basic
//
//  Created by Seong A Oh on 2022/12/19.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        HStack {
            Text("SwiftUI")
                .font(.system(size: 40, weight: .bold, design: .default))
            // .(점)찍고 나오는 것들이 modifier
            // modifier의 순서는 중요
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
