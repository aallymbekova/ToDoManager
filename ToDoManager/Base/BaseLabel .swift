//
//  BaseLabel .swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 9/9/24.
//

import UIKit

class BaseLabel: UILabel {
    
    private var action: () -> Void = { }
    
    public func onTab(action: @escaping () -> Void) {
        self.action = action
        
        isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onClick))
        addGestureRecognizer(tap)
    }
    
    @objc func onClick() {
        action()
    }
}
