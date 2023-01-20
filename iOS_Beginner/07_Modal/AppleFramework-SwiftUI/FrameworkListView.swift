//
//  ContentView.swift
//  AppleFramework-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct FrameworkListView: View {
    
    @StateObject var vm = FrameworkListViewModel()
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        // Grid 만들기
        // - UIKit : UICollectionView
        //   - Data, Presentaion, Layout
        // - SwiftUI : LazyVGrid, LazyHGrid
        //   - ✅ Data, ✅ Presentaion, ✅ Layout
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach($vm.models) { $item in
                        FrameworkCell(framework: $item)
                            .onTapGesture {
                                //tap 시 동작
                                // $가 없을 땐 값 그 그자체
                                vm.isShowingDetail = true
                                vm.selectedItem = item
                            }
                    }
                }
                .padding([.top, .leading, .trailing], 16.0)
            }
            .navigationTitle("☀️ Apple Framework")
        }
        // 팝업 형태(드래그 가능)
//        .sheet(isPresented: $vm.isShowingDetail) {
//            FrameworkDetailView(framework: $vm.selectedItem)
//        }
        // full Screen 형태(드래그 불가능)
        //---
//        .fullScreenCover(isPresented: $vm.isShowingDetail) {
//            FrameworkDetailView(framework: $vm.selectedItem)
//        }
        //---
        .sheet(isPresented: $vm.isShowingDetail) {
            //---
//            FrameworkDetailView(framework: $vm.selectedItem)
            //---
            let vm = FrameworkDetailViewModel(framework: vm.selectedItem!)
            FrameworkDetailView(viewModel: vm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
    }
}
