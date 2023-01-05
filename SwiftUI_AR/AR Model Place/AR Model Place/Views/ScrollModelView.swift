//
//  ScrollModelView.swift
//  AR Model Place
//
//  Created by Seong A Oh on 2022/11/04.
//

import SwiftUI

struct ScrollModelView: View {
    
    var models: [Model]
    @Binding var selectedModel: Model?
    var body: some View {
        // ScrollView 생성(가로방향)
        ScrollView (.horizontal) {
            // 세로방향 stack 생성
            HStack {
                ForEach(models) { item in
                    Button(action: {
                        selectedModel = item
                        print(selectedModel?.modelName)
                    }, label: {
                        PickerImage(model: item.image)
                    }).buttonStyle(PlainButtonStyle())
                    
                }
            }.background(Color.black.opacity(0.5))
        }
    }
}

struct ScrollModelView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollModelView(models: ModelData().models, selectedModel: .constant(ModelData().models[0]))
    }
}
