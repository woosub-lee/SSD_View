//
//  ScreenshotView.swift
//  Pods-SSDView_Example
//
//  Created by 이우섭 on 2022/04/07.
//
import SwiftUI

public struct ScreenShotView<Content>: UIViewRepresentable where Content: View {
    @Binding var isDisallow: Bool
    var parent: SDView
    var child: UIView
    
    public init(disallow: Binding<Bool>, @ViewBuilder content: () -> Content) {
        let uiKitHost = UIHostingController<Content>(rootView: content())
        
        self._isDisallow = disallow
        self.parent = SDView()
        self.child = uiKitHost.view
        self.child.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func makeUIView(context: Context) -> some UIView {
        parent.addSubview(child)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: parent, attribute: .leading, relatedBy: .equal, toItem: child, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: parent, attribute: .trailing, relatedBy: .equal, toItem: child, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: parent, attribute: .top, relatedBy: .equal, toItem: child, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: parent, attribute: .bottom, relatedBy: .equal, toItem: child, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        
        return parent
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        if isDisallow {
            parent.disAllow()
        } else {
            parent.allow()
        }
    }
    
}


