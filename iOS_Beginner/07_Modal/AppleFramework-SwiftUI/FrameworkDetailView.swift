//
//  FrameworkDetailView.swift
//  AppleFramework-SwiftUI
//
//  Created by Seong A Oh on 2023/01/20.
//

import SwiftUI

struct FrameworkDetailView: View {
    //-----
//    @Binding var framework: AppleFramework? // 선택된 값이 없을 수도 있으므로
    // 환경변수 EnvironmentObject와는 완전 다름
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //PresentationMode Deprecated 됨(iOS 13.0~16.1 사용 가능)
    //@Binding var isShowingDetail: Bool
    //---
    
    @StateObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            //---
            //옵셔널 처리
//            if let framework = framework {
//                Image(framework.imageName)
//                Text(framework.name)
//                Text(framework.description)
//            } else {
//                Text("Noting Selected")
//            }
            //---
            
            Spacer()
            Image(viewModel.framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(viewModel.framework.name)
                .font(.system(size: 24, weight: .bold))
            Text(viewModel.framework.description)
                .font(.system(size: 16, weight: .regular))
            
            Spacer()
            
            Button {
                //---
                // view 닫기
//                presentationMode.wrappedValue.dismiss()
//                isShowingDetail = false // 이렇게도 사용가능하지만 의존성이 생기므로.. 가급적 사용 x
                //---
                viewModel.isSafariPresented = true
            } label: {
                Text("Learn more")
                    .font(.system(size: 20, weight: .bold , design: .default))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.pink)
            .cornerRadius(40)
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        .sheet(isPresented: $viewModel.isSafariPresented) {
            //Safari View 띄우기
            let url = URL(string: viewModel.framework.urlString)!
            SafariView(url: url)
        }
//        .onAppear {
//            print("DetailView: On appear \(presentationMode.wrappedValue.isPresented)")
//        }
//        .onDisappear {
//            print("DetailView: On disappear \(presentationMode.wrappedValue.isPresented)")
//        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //---
//        FrameworkDetailView(viewModel: .constant(AppleFramework.list[0]))
        // .constant: 데이터 바인딩
        //---
        let vm = FrameworkDetailViewModel(framework: AppleFramework.list[0])
        FrameworkDetailView(viewModel: vm)
    }
}
