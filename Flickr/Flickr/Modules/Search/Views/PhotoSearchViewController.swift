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
    var router: PhotoSearchSceneRouter!
    
    // MARK: - Outletes
    @IBOutlet private weak var imageSearchBar: UISearchBar!
    @IBOutlet private weak var searchResultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Photos Feed"
    }
    
    @IBAction func searchButtonDidTapped(_ sender: UIButton) {
        self.router.routeToSearchHistory()
    }
}

private extension PhotoSearchViewController {
    
    func setupUI() {
        self.searchResultCollectionView.register(PhotoCell.self)
        self.searchResultCollectionView.dataSource = self
        self.searchResultCollectionView.delegate = self
        self.searchResultCollectionView.collectionViewLayout = photoListLayout

        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                           style: .plain, target: self, action: #selector(searchButtonDidTapped(_:)))
        self.navigationItem.rightBarButtonItem = searchButton
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
        self.dataStore.photos.append(contentsOf: photos)
        self.searchResultCollectionView.reloadData()
    }
}

extension PhotoSearchViewController: SearchHistorySceneDelegate {
    
    func searchText(with search: String) {
        self.dataStore.search = search
        self.interactor.searchPhotos()
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

extension PhotoSearchViewController: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath) {
        
            if indexPath.row == self.dataStore.photos.count - 1 {
                self.dataStore.page += 1
                self.interactor.searchPhotos()
            }
    }
}
