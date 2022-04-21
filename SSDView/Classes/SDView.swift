//
//  SDView.swift
//  Pods-SSDView_Example
//
//  Created by 이우섭 on 2022/03/27.
//

import UIKit


/// Screenshot Detection View
///
/// Use this view when prevent view from user's screenshot or screen record
public class SDView: UITextField {
    
    private var protector: UIView?
    private var normalView: UIView?
    private var detectView: UIView?
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSDView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSDView()
    }
    
    private func initSDView() {
        // textfield's subview is UITextLayoutCanvasView <- It's a private API
        // UITextLayoutCanvasView is hidden when excute screenshot or record. ( isSecureTextEntry == true )
        self.protector = findProtector()
        self.clearView()
        self.preventInteractionAsTextfield()
    }
    
    private func findProtector() -> UIView? {
        for subview in self.subviews {
            if subview.frame == CGRect(x: 0, y: 0, width: 0, height: 0) {
                return subview
            }
        }
        return nil
    }
    
    private func clearView() {
        self.borderStyle = .none
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func preventInteractionAsTextfield() {
        self.isUserInteractionEnabled = false
    }
}

extension SDView {
    /**
     This method set the view to don't prevent screenshots or screen records.
     */
    @discardableResult
    public func allow() -> Self {
        self.isSecureTextEntry = false
        return self
    }
    
    /**
     This method set the view to prevent screenshots or screen records.
     */
    @discardableResult
    public func disAllow() -> Self {
        self.isSecureTextEntry = true
        return self
    }
    
    /**
     The method which is displayed view when it didn't detected Screenshot or Capture.
         
     - parameter whenItIsNormal: the view which displayed when It didn't detect Screenshot or Capture
         
     - important: If you set displayed view when detected Screenshot or Record, Do not insert normal view with non 1.0 Alpha value
     
     - TODO: delete this method & combine with initalizer
     */
    @discardableResult
    public func setView(whenItIsNormal view: UIView) -> Self {
        self.normalView = view
        self.normalView?.translatesAutoresizingMaskIntoConstraints = false
        guard let protector = protector else { return self }
        guard let normalView = normalView else { return self }
        protector.addSubview(normalView)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.init(item: protector, attribute: .leading, relatedBy: .equal, toItem: normalView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: protector, attribute: .trailing, relatedBy: .equal, toItem: normalView, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: protector, attribute: .top, relatedBy: .equal, toItem: normalView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: protector, attribute: .bottom, relatedBy: .equal, toItem: normalView, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        return self
    }
    
    /**
     The method which is displayed view when it detected Screenshot or Capture.
         
     - parameter whenItIsDetected: the view which displayed when It detect Screenshot or Capture
     */
    @discardableResult
    public func setView(whenItIsDetected view: UIView) -> Self {
        self.detectView = view
        self.detectView?.translatesAutoresizingMaskIntoConstraints = false
        
        guard let protector = protector else { return self }
        guard let detectView = detectView else { return self }
        self.addSubview(detectView)
        self.bringSubviewToFront(protector)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.init(item: self, attribute: .leading, relatedBy: .equal, toItem: detectView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self, attribute: .trailing, relatedBy: .equal, toItem: detectView, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: .equal, toItem: detectView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self, attribute: .bottom, relatedBy: .equal, toItem: detectView, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        return self
    }
}
