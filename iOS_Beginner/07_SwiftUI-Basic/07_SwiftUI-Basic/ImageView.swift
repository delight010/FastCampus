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
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
