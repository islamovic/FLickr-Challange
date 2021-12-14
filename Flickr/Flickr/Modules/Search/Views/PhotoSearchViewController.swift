//
//  PhotoSearchViewController.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import UIKit

protocol PhotoSearchSceneDisplayView: AnyObject {
    func displaySearchResult(photos: [Photo])
}

class PhotoSearchViewController: UIViewController {

    private let numberOfColumns: Int = 2
    private let itemHeight: CGFloat = 200
    
    var interactor: PhotoSearchSceneInteractor!
    var dataStore: PhotoSearchSceneDataStore!
    
    // MARK: - Outletes
    @IBOutlet private weak var imageSearchBar: UISearchBar!
    @IBOutlet private weak var searchResultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

private extension PhotoSearchViewController {
    
    func setupUI() {
        self.searchResultCollectionView.register(PhotoCell.self)
        self.searchResultCollectionView.dataSource = self
        self.searchResultCollectionView.collectionViewLayout = photoListLayout
        self.imageSearchBar.delegate = self
    }
    
    var photoListLayout: UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(itemHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: numberOfColumns)
        let spacing = CGFloat(10)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension PhotoSearchViewController: PhotoSearchSceneDisplayView {
    
    func displaySearchResult(photos: [Photo]) {
        self.searchResultCollectionView.reloadData()
    }
}

extension PhotoSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let search = searchBar.text else { return }
        self.interactor.search(search)
    }
}

extension PhotoSearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataStore.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotoCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        cell.configureCell(self.dataStore.photos[indexPath.row])
        return cell
    }
}
