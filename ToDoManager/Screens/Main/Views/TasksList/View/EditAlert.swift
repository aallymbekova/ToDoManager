//
//  EditAlert.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 21/9/24.
//

import UIKit
import SnapKit

class EditAlert: CustomAlert {
    
    private lazy var contener: BaseView = {
        let view = BaseView()
        view.backgroundColor = R.Colors.lightGray
        view.layer.cornerRadius = 16
        return view
    }()
    
   private lazy var textField: UITextField = {
       let view = UITextField()
        view.placeholder = "Edit task"
        view.borderStyle = .roundedRect
        return view
    }()
    
    private lazy var dateTextField: UITextField = {
        let view = UITextField()
         view.placeholder = "Date"
         view.borderStyle = .roundedRect
         return view
    }()
    
    private lazy var checkBoxLabel: BaseLabel = {
       let view = BaseLabel()
        view.text = "Is completed?"
        view.textColor = R.Colors.secondary
        return view
    }()
    
    private lazy var checkBox: UIButton = {
        let view = UIButton(type: .system)
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.layer.borderColor = R.Colors.inactive.cgColor
        view.addTarget(self, action: #selector(tapCheckox), for: .touchUpInside)
        return view
    }()
    
    private lazy var editButton: UIButton = {
        let view = UIButton()
        view.setTitle("Edit", for: .normal)
        view.backgroundColor = R.Colors.active
        view.layer.cornerRadius = 10
        return view
    }()
    
    override func setupSubviews() {
        addSubview(contener)
        contener.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(250)
        }
        
        contener.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(contener).inset(30)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(40)
        }
        
        contener.addSubview(dateTextField)
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).inset(-20)
            make.leading.trailing.equalTo(textField)
            make.height.equalTo(textField)
        }
        
        contener.addSubview(checkBoxLabel)
        checkBoxLabel.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).inset(-20)
            make.leading.equalTo(dateTextField)
        }
        
        contener.addSubview(checkBox)
        checkBox.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.centerY.equalTo(checkBoxLabel)
            make.leading.equalTo(checkBoxLabel.snp.trailing).inset(-10)
        }
        
        contener.addSubview(editButton)
        editButton.snp.makeConstraints { make in
            make.top.equalTo(checkBoxLabel.snp.bottom).inset(-20)
            make.leading.trailing.equalTo(dateTextField)
            make.height.equalTo(dateTextField)
        }
    }
}

@objc extension EditAlert {
    
    func tapCheckox() {
        if checkBox.currentImage == nil {
            checkBox.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            checkBox.layer.borderWidth = 0
        } else {
                        checkBox.setImage(nil, for: .normal)
                        checkBox.layer.borderWidth = 2
        }
    }
}
