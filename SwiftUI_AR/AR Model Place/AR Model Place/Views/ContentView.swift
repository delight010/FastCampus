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
    var modelData = ModelData()
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            ScrollModelView(models: modelData.models)
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
