//
//  FrameworkCell.swift
//  AppleFramework-SwiftUI
//
//  Created by Seong A Oh on 2023/01/08.
//

import SwiftUI

struct FrameworkCell: View {
    var framework: AppleFramework
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .aspectRatio( contentMode: .fit)
            Spacer()
            Text(framework.name)
                .font(.system(size: 16, weight: .bold))
            Spacer()
        }
    }
}

struct FrameworkCell_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkCell(framework: AppleFramework.list[0])
            .previewLayout(.fixed(width: 160, height: 250))
        // 미리보기이 레이아웃 조정
    }
}
