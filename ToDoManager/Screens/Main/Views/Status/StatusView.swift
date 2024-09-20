//
//  StatusView.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 9/9/24.
//

import UIKit
import SnapKit

final class StatusView: BaseView  {
    
    lazy var all = StatusItem(title: R.Strings.StatusItem.all, count: "25")
    
    private lazy var separator: BaseView = {
       let view = BaseView()
        view.backgroundColor = R.Colors.inactive
        return view
    }()
    
    lazy var open = StatusItem(title: R.Strings.StatusItem.open, count: "14")
    
    lazy var closed = StatusItem(title: R.Strings.StatusItem.closed, count: "19")
    
    override func setupSubViews() {
        addSubview(all)
        all.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(50)
        }
        
        addSubview(separator)
        separator.snp.makeConstraints { make in
            make.centerY.equalTo(all.snp.centerY)
            make.leading.equalTo(all.snp.trailing).offset(20)
            make.height.equalTo(15)
            make.width.equalTo(2)
        }
        
        addSubview(open)
        open.snp.makeConstraints { make in
            make.top.equalTo(all.snp.top)
            make.leading.equalTo(separator.snp.trailing).offset(20)
            make.height.equalTo(all.snp.height)
            make.width.equalTo(all.snp.width)
        }
        
        addSubview(closed)
        closed.snp.makeConstraints { make in
            make.top.equalTo(all.snp.top)
            make.leading.equalTo(open.snp.trailing).offset(35)
            make.height.equalTo(open.snp.height)
            make.width.equalTo(open.snp.width)
        }
    }
}
