//
//  AddButton.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 19/9/24.
//

import UIKit
import SnapKit

class AddButton: BaseView {
    
    private lazy var title: BaseLabel = {
       let view = BaseLabel()
        view.text = R.Strings.Tabbar.button
        view.textColor = R.Colors.buttonText
        return view
    }()
    
    private lazy var image: BaseImage = {
      let view = BaseImage()
        view.image = UIImage(systemName: "plus")
        return view
    }()
    
    override func setupView() {
        layer.cornerRadius = 12
        backgroundColor = R.Colors.buttonBackground
        
        snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }
    
    override func setupSubViews() {
        addSubview(image)
        image.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.width.height.equalTo(20)
        }
        
        addSubview(title)
        title.snp.makeConstraints { make in
            make.centerY.equalTo(image.snp.centerY)
            make.leading.equalTo(image.snp.trailing).offset(10)
        }
    }
}
