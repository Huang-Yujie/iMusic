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
        
        firstView.topTable.delegate = self
        firstView.topTable.dataSource = self
        
        firstView.collection.delegate = self
        firstView.collection.dataSource = self
        
        self.title = "资料库"
    }
    
    let firstView = FirstView()
    
    private func setupViews(){
        
        view.addSubview(firstView)
        
        firstView.scroll.contentSize = firstView.backView.bounds.size
        
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        firstView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
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
        enum controllers: Int {case Playlists = 0, Artists, Albums, Songs}
        let page = controllers(rawValue: indexPath.row)
        switch page {
        case .Playlists:
            self.navigationController?.pushViewController(PlaylistsVC(), animated: true)
        case .Artists:
            self.navigationController?.pushViewController(ArtistsVC(), animated: true)
        case .Albums:
            self.navigationController?.pushViewController(AlbumsVC(), animated: true)
        case .Songs:
            self.navigationController?.pushViewController(SongsVC(), animated: true)
        case .none:
            break
        }
    }
}

extension LibraryRootViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CustomCollectionCell
        cell.imageView.image = UIImage(named: "\(songs[indexPath.item]).png")
        cell.title.text = "\(songs[indexPath.item])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.present(PlayerVC(), animated: true, completion: .none)
    }
}
