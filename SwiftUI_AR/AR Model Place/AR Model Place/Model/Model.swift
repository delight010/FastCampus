//
//  Model.swift
//  AR Model Place
//
//  Created by Seong A Oh on 2022/11/26.
//

import Foundation
import SwiftUI
import RealityKit
import Combine // 한번에 여러가지 일을 해주는 농사기계(비동기적)
// 앱에서 일어나는 이벤트(버튼클릭, 이미지 로드 등)을 한꺼번에 처리

class Model: Identifiable {
    // Identifiable
    // ForEach 문에서 데이터를 사용가능
    // 클래스에서 생성된 각가의 인스턴스에 대해
    // 고유한 아이디를 부여하여 구분
    
    var id = UUID() // 중복되지않는 고유한 아이디
    var modelName: String
    var image: Image {
        Image(modelName)
    }
    var modelEntity: ModelEntity?
    var cancellable: AnyCancellable? = nil // combine을 사용하기 위함
    
    init(modelName: String) {
        self.modelName = modelName
        cancellable = ModelEntity.loadModelAsync(named: modelName)
        // 비동기적으로, 3d모델의 이름을 넣어서 ModelEntity를 로드
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { error in
                print("error to load \(error)")
            }, receiveValue: { modelEntity in
                self.cancellable?.cancel()
                print("success to load")
                self.modelEntity = modelEntity
                self.modelEntity?.name = modelName
            })
        // receiveCompletion: error 발생 시 실행되는 구문
        // receiveValue: 로드에 성공한 데이터를 전달
    }
}

class ModelData {
    // model 클래스의 인스턴스 생성 시
    // 이미지와 3d모델이 생성
    var models: [Model] =  {
        var file = FileManager()
        // 프로젝트 내부의 파일을 가져옴
        guard let path = Bundle.main.resourcePath,
              let files = try? file.contentsOfDirectory(atPath: path) else { return [] }
        
        var modelData = [Model]()
        // item.hasSuffix("usdz")
        // usdz 파일만 가져옴
        for item in files where item.hasSuffix("usdz") {
            // 파일 확장자명 제거
            let modelName = item.replacingOccurrences(of: ".usdz", with: "")
            let model = Model(modelName: modelName)
            modelData.append(model)
        }
        return modelData
    } ()
}
