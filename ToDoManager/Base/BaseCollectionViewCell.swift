//
//  BaseCollectionViewCell.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 9/9/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    private var action: () -> Void = {}
    
    public func onTab(action: @escaping () -> Void) {
        self.action = action
        
        isUserInteractionEnabled = true
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(onClick))
        addGestureRecognizer(tab)
    }
    
    @objc func onClick() {
        action()
    }
    
    var isCreate = false
    
    override func layoutSubviews() {
        if !isCreate {
            isCreate = true
            
            setupView()
            setupSubViews()
        }
    }
    
    func setupView() { }
    
    func setupSubViews() { }
}
