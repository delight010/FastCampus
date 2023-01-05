//
//  ContentView.swift
//  AR Model Place
//
//  Created by Seong A Oh on 2022/11/04.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    // mainView
    @State private var selectedModel: Model?
    var modelData = ModelData()
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(selectedModel: $selectedModel)
            ScrollModelView(models: modelData.models, selectedModel: $selectedModel)
            //$selectedModel: 바인딩
        }.edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
