//
//  SafariView.swift
//  AppleFramework-SwiftUI
//
//  Created by joonwon lee on 2022/06/15.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    // 애플 자체에서 나온 view가 있는 지 찾아볼 것
    
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
