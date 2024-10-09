//
//  StatusCollectonView.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 22/9/24.
//

import UIKit
import SnapKit

final class StatusCollectonView: BaseView {
    
    private lazy var collectionView: UICollectionView = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        view.isPagingEnabled = true
        view.allowsSelection = true
        view.delegate = self
        view.dataSource = self
        
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        
        view.register(StatusCell.self, forCellWithReuseIdentifier: "StatusCell")
        
        return view
    }()
    
    private var completedTasksCount = 0
    private var notCompletedTaskCount = 0

    let status = [R.Strings.StatusItem.all, R.Strings.StatusItem.open, R.Strings.StatusItem.closed]
    
    func updateTaskData(completed: Int, notCompleted: Int) {
        self.completedTasksCount = completed
        self.notCompletedTaskCount = notCompleted
        collectionView.reloadData()
    }
    
    override func setupSubViews() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension StatusCollectonView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatusCell", for: indexPath) as! StatusCell
        
        let status = status[indexPath.row]
        cell.title.text = status
       
        switch indexPath.row {
        case 0:
            cell.count.text = "\(completedTasksCount + notCompletedTaskCount)"
        case 1:
            cell.count.text = "\(notCompletedTaskCount)"
        case 2:
            cell.count.text = "\(completedTasksCount)"
        default:
            cell.count.text = "0"
        }
        
        return cell
    }
}
