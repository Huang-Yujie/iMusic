//
//  ViewController.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/21.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        firstView.topBar.delegate = self
        
        firstView.topTable.delegate = self
        firstView.topTable.dataSource = self
        
        firstView.collection.delegate = self
        firstView.collection.dataSource = self
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 160, height: 200)
//        layout.minimumLineSpacing = 30
//        layout.minimumInteritemSpacing = 50
//        firstView.collection.collectionViewLayout = layout
    }

    let firstView = FirstView()
    
    private func setupViews(){

        view.addSubview(firstView)

        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        firstView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
}

extension FirstVC: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension FirstVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableCell
        cell = CustomTableCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        if let label = cell.textLabel {
            label.text = "\(info[indexPath.row])"
        }
        return cell
    }
}

extension FirstVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionCell
        cell = CustomCollectionCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
}
