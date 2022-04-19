//
//  ScreenshotView.swift
//  Pods-SSDView_Example
//
//  Created by 이우섭 on 2022/04/07.
//
import SwiftUI

private struct ScreenShotView<Content>: UIViewRepresentable where Content: View {
    var parent: SDView
    var child: UIView
    
    private init(@ViewBuilder content: () -> Content) {
        let uiKitHost = UIHostingController<Content>(rootView: content())
        
        self.parent = SDView()
        self.child = uiKitHost.view
        self.child.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func makeUIView(context: Context) -> some UIView {
        parent.setView(whenItIsNormal: child)
        return parent
    }
    // TODO: SwiftUI Representable이 아닌 SwiftUI native로 작성할 수 있는지 확인
    // TODO: View Memory Leak 해결
    fileprivate func updateUIView(_ uiView: UIViewType, context: Context) { }
}


