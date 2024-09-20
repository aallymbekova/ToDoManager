//
//  TasksListView .swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 10/9/24.
//

import UIKit
import SnapKit

final class TasksListView: BaseView {
    
     lazy var tableView: UITableView = {
       let view = UITableView()
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        
        view.register(TasksListCell.self, forCellReuseIdentifier: "TasksListCell")
        
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    private let api = ApiClient()
    lazy var combineData = [DataSoureModel]()
    
    override func setupView() {
        fetchAndCombineData()
    }
    
     func fetchAndCombineData() {
        var apiDataSourceArray = [DataSoureModel]()
        var coreDataSourceArrat = [DataSoureModel]()
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        api.fetchTasks { todos in
            guard let todos = todos else {
                dispatchGroup.leave()
                return
            }
            apiDataSourceArray = todos.map{ DataSoureModel(todo: $0)}
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        CoreDataManager.shared.fetchTasks { tasks in
            coreDataSourceArrat = tasks.map{ DataSoureModel(coreDataTasks: $0) }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.combineData = apiDataSourceArray + coreDataSourceArrat
            self.tableView.reloadData()
        }
    }
    
    override func setupSubViews() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}

extension TasksListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        combineData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksListCell", for: indexPath) as! TasksListCell
    
        let task = combineData[indexPath.row]
        
        cell.title.text = task.title
        cell.descriptionLabel.text = task.title
        cell.tapCheckox(isTapped: task.completed)
        
        return cell
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        superview?.endEditing(true)
    }
}
