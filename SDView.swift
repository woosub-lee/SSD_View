//
//  SDView.swift
//  Pods-SSDView_Example
//
//  Created by 이우섭 on 2022/03/27.
//

import UIKit

public class SDView: UITextField {
    
    private var protector: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSDView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSDView()
    }
    
    private func initSDView() {
        // textfield's subview is UITextLayoutCanvasView
        // UITextLayoutCanvasView is hidden when excute screenshot or record. ( isSecureTextEntry == true )
        self.protector = self.subviews.first
        self.clearView()
        self.preventInteractionAsTextfield()
    }
    
    private func clearView() {
        self.borderStyle = .none
        self.backgroundColor = .clear
    }
    
    private func preventInteractionAsTextfield() {
        self.isUserInteractionEnabled = false
    }
}

extension SDView {
    @discardableResult
    public func allow() -> Self {
        self.isSecureTextEntry = false
        return self
    }
    
    @discardableResult
    public func disAllow() -> Self {
        self.isSecureTextEntry = true
        return self
    }
}
