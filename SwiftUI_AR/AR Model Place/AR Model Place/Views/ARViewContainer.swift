//
//  ARViewContainer.swift
//  AR Model Place
//
//  Created by Seong A Oh on 2022/11/04.
//

import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    //UIViewRepresentable를 사용할 땐 반드시 2개의 함수가 필요
    //UIViewRepresentable은 SwiftUI에서 메인으로 지원하지 않는
    //서브 View들을 사용하고자 할 때 필요한 protocol
    @Binding var selectedModel: Model?
    
    //ARViewContainer가 초기실행되었을 때 1번 실행되는 함수
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        // 선택된 3D모델이 없기 때문에 빈 view를 return
        
        return arView
        
    }
    
    //View가 업데이트될 때마다 실행되는 함수
    func updateUIView(_ uiView: ARView, context: Context) {
        if let model = selectedModel?.modelEntity {
            //3D모델이 위치할 수 있는 평면을 anchor를 통해 지정
            let anchor = AnchorEntity(plane: .any)
            // .any: 어느방향이든
            anchor.addChild(model) // model add
            
            uiView.scene.anchors.append(anchor)
        }
    }

    
}

