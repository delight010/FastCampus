//
//  FrameworkDetailView.swift
//  AppleFramework-SwiftUI
//
//  Created by Seong A Oh on 2023/01/20.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @Binding var framework: AppleFramework? // 선택된 값이 없을 수도 있으므로
    // 환경변수 EnvironmentObject와는 완전 다름
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //PresentationMode Deprecated 됨(iOS 13.0~16.1 사용 가능)
    
//    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            //옵셔널 처리
            if let framework = framework {
                Image(framework.imageName)
                Text(framework.name)
                Text(framework.description)
            } else {
                Text("Noting Selected")
            }
            
            Button {
                // view 닫기
                presentationMode.wrappedValue.dismiss()
//                isShowingDetail = false // 이렇게도 사용가능하지만 의존성이 생기므로.. 가급적 사용 x
            } label: {
                Text("Button")
            }
        }
        .onAppear {
            print("DetailView: On appear \(presentationMode.wrappedValue.isPresented)")
        }
        .onDisappear {
            print("DetailView: On disappear \(presentationMode.wrappedValue.isPresented)")
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: .constant(AppleFramework.list[0]))
        // .constant: 데이터 바인딩
    }
}
