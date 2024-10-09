//
//  ViewController.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 9/9/24.
//

import UIKit
import SnapKit

final class ViewController: BaseViewController {
    
    private lazy var toolbar = MainToolbar()
    
    private lazy var list = TasksListView()

    override func setupController() {
        view.backgroundColor = R.Colors.background
        setupAction() 
    }
    
    override func setupSubviews() {
        view.addSubview(toolbar)
        toolbar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalToSuperview().offset(25)
            make.width.equalTo(350)
            make.height.equalTo(90)
        }
        
        view.addSubview(list)
        list.snp.makeConstraints { make in
            make.top.equalTo(toolbar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupAction() {
        toolbar.add.onTab {
            let alert = UIAlertController(title: "New Task", message: "Create new task", preferredStyle: .alert)
            
            alert.addTextField(configurationHandler: nil)
            alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak self] _ in
                guard let self = self else { return }
                guard let tf = alert.textFields?.first, let text = tf.text, !text.isEmpty else { return }
                
                CoreDataManager.shared.createTask(text) { newTask in
                    guard let newTask = newTask else { return }
                    self.list.combineData.insert(DataSoureModel(coreDataTasks: newTask), at: 0)
                    
                    DispatchQueue.main.async {
                        self.list.tableView.reloadData()
                    }
                }
            }))
            
            self.present(alert, animated: true)
        }
    }
}
