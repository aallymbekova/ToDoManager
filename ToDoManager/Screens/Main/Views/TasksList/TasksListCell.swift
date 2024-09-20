//
//  TasksListCell.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 10/9/24.
//

import UIKit
import SnapKit

final class TasksListCell: BaseTableViewCell {
    
    private lazy var contener: BaseView = {
       let view = BaseView()
        view.backgroundColor = R.Colors.cellBackground
        view.layer.cornerRadius = 10
        return view
    }()
    
     lazy var title: BaseLabel = {
       let view = BaseLabel()
        view.textColor = R.Colors.title
        view.font = R.Fonts.helveticaNeue(with: 20)
        return view
    }()
    
     lazy var descriptionLabel: BaseLabel = {
       let view = BaseLabel()
        view.textColor = R.Colors.secondary
        view.font = R.Fonts.helveticaNeue(with: 13)
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
    
    private lazy var separator: BaseView = {
       let view = BaseView()
        view.backgroundColor = R.Colors.lightGray
        return view
    }()
    
    private lazy var line: BaseView = {
       let view = BaseView()
        view.backgroundColor = R.Colors.secondary
        view.isHidden = true
        return view
    }()
    
    private lazy var todayLabel: BaseLabel = {
       let view = BaseLabel()
        view.text = R.Strings.TaskListCell.today
        view.textColor = R.Colors.secondary
        view.font = R.Fonts.helveticaNeue(with: 13)
        return view
    }()
    
    private lazy var dateLabel: BaseLabel = {
       let view = BaseLabel()
        view.text = "09:15 PM-03:00 PM"
        view.textColor = R.Colors.inactive
        view.font = R.Fonts.helveticaNeue(with: 13)
        return view
    }()

    override func setupSubViews() {
        addSubview(contener)
        contener.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(130)
        }
        
        contener.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(200)
        }
        
        contener.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(8)
            make.leading.equalTo(title.snp.leading)
            make.width.equalTo(title.snp.width)
        }
        
        contener.addSubview(line)
        line.snp.makeConstraints { make in
            make.centerY.equalTo(title.snp.centerY)
            make.leading.equalTo(title.snp.leading)
            make.trailing.equalTo(title.snp.trailing)
            make.height.equalTo(0.5)
        }
        
        contener.addSubview(checkBox)
        checkBox.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.top.equalTo(title.snp.bottom).offset(-15)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        contener.addSubview(separator)
        separator.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.leading.equalTo(descriptionLabel.snp.leading)
            make.trailing.equalTo(checkBox.snp.trailing)
            make.height.equalTo(2)
        }
        
        contener.addSubview(todayLabel)
        todayLabel.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom).offset(15)
            make.leading.equalTo(separator.snp.leading)
        }
        
        contener.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(todayLabel.snp.top)
            make.leading.equalTo(todayLabel.snp.trailing).offset(10)
        }
    }
}

@objc extension TasksListCell {
    
    func tapCheckox(isTapped: Bool) {
        if isTapped {
            checkBox.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            checkBox.layer.borderWidth = 0
            line.isHidden = false
        } else {
            checkBox.setImage(nil, for: .normal)
            checkBox.layer.borderWidth = 2
            line.isHidden = true
        }
    }
}
