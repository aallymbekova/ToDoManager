//
//  CustomAlert.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 21/9/24.
//

import UIKit
import SnapKit

class CustomAlert: UIView {
    
    override func layoutSubviews() {
        backgroundColor = .init(hexString: "#99000000")
        
        isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onClick))
        addGestureRecognizer(tap)
        
        setupView()
        setupSubviews()
    }
    
    @objc func onClick() {
        dismiss()
    }
    
    func setupView() { }
    func setupSubviews() { }
    
    func show() {
        isHidden = true
        
        alpha = 0
        
        let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow})
        
        window?.addSubview(self)
        self.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        UIView.animate(withDuration: 0.2) { [self] in
            alpha = 1
            
            isHidden = false
        }
    }
    
    func dismiss() {
        alpha = 1
        
        UIView.animate(withDuration: 0.2) { [self] in
            alpha = 0
        } completion: { [self] state in
            if state {
                isHidden = true
                
                snp.removeConstraints()
                
                removeFromSuperview()
            }
        }
    }
}
