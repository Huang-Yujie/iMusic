//
//  ViewController.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/10/21.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

import UIKit

class LibraryViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class LibraryRootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.rightBarButtonItem = editButtonItem
        self.navigationController?.navigationBar.tintColor = .red
        
        libraryView.topTable.delegate = self
        libraryView.topTable.dataSource = self
        
        libraryView.collection.delegate = self
        libraryView.collection.dataSource = self
        
        self.title = "资料库"
    }
    
    let libraryView = LibraryView()
    
    private func setupViews(){
        
        view.addSubview(libraryView)
        
        libraryView.scroll.contentSize = libraryView.backView.bounds.size
        
        
        libraryView.translatesAutoresizingMaskIntoConstraints = false
        libraryView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        libraryView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        libraryView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        libraryView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

// MARK: UITableViewDataSource & UITableViewDelegate

extension LibraryRootViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! CustomTableCell
        cell = CustomTableCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "TableCell")
        if let label = cell.textLabel {
            label.text = "\(info[indexPath.row])"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controllerTitle = ["播放列表", "艺人", "专辑", "歌曲"]
        let subViewController = SubviewController(controllerTitle[indexPath.row])
        self.navigationController?.pushViewController(subViewController, animated: true)
    }
}

extension LibraryRootViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CustomCollectionCell
        cell.imageView.image = UIImage(named: "\(songs[indexPath.item]).png")
        cell.title.text = "\(songs[indexPath.item])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.present(PlayerViewController(), animated: true, completion: .none)
    }
}
