//
//  PickerImage.swift
//  AR Model Place
//
//  Created by Seong A Oh on 2022/11/04.
//

import SwiftUI

struct PickerImage: View {
    var model: Image
    var body: some View {
        // 이미지 생성
        model
        // 속성정의는 .(점)을 붙인다
            .resizable() // 사이즈변경 가능
            .frame(width: 100, height: 100, alignment: .center) // 크기 및 정렬
            .aspectRatio(contentMode: .fit)
            .background(Color.white)
            .cornerRadius(20)
            .padding()
    }
}

struct PickerImage_Previews: PreviewProvider {
    static var previews: some View {
        PickerImage(model: Image("toy_drummer"))
    }
}
