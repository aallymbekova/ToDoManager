//
//  MainToolbar.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 9/9/24.
//

import UIKit
import SnapKit

final class MainToolbar: BaseView {
    
    private lazy var title: BaseLabel = {
       let view = BaseLabel()
        view.font = R.Fonts.helvelticaRegular(with: 25)
        view.text = R.Strings.Tabbar.title
        view.textColor = R.Colors.title
        return view
    }()
    
    private lazy var day: BaseLabel = {
       let view = BaseLabel()
        view.font = R.Fonts.helveticaNeue(with: 16)
        view.text = R.Strings.Tabbar.day
        view.textColor = R.Colors.secondary
        return view
    }()
    
    lazy var add = AddButton()
    
    override func setupView() {
        backgroundColor = .clear
    }
    
    override func setupSubViews() {
        addSubview(title)
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        addSubview(day)
        day.snp.makeConstraints { make in
            make.leading.equalTo(title)
            make.top.equalTo(title.snp.bottom).offset(5)
        }
        
        addSubview(add)
        add.snp.makeConstraints { make in
            make.top.equalTo(title.snp.centerY).offset(-6)
            make.trailing.equalToSuperview()
            make.width.equalTo(140)
        }
    }
}
