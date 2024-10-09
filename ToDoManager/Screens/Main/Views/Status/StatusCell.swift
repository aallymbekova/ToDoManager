//
//  StatusCell.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 22/9/24.
//

import UIKit
import SnapKit

final class StatusCell: BaseCollectionViewCell {
    
     lazy var title: BaseLabel = {
       let view = BaseLabel()
        view.text = R.Strings.StatusItem.all
        view.textColor = R.Colors.inactive
        view.font = R.Fonts.helvelticaRegular(with: 16)
        return view
    }()
    
     lazy var count: BaseLabel = {
       let view = BaseLabel()
        view.textColor = R.Colors.cellBackground
        view.font = R.Fonts.helvelticaRegular(with: 12)
        return view
    }()
    
    private lazy var contener: BaseView = {
       let view = BaseView()
        view.layer.cornerRadius = 8
        view.backgroundColor = R.Colors.inactive
        return view
    }()
    
    override func setupSubViews() {
        addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview()
        }
        
        addSubview(contener)
        contener.snp.makeConstraints { make in
            make.top.equalTo(title.snp.top)
            make.leading.equalTo(title.snp.trailing).offset(8)
            make.height.equalTo(17)
            make.width.equalTo(22)
        }
        
        contener.addSubview(count)
        count.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
