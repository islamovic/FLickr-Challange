//
//  PhotoSearchViewController.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import UIKit

protocol PhotoSearchSceneDisplayView: AnyObject {
    func displaySearchResult(photoUrls: [String])
}

class PhotoSearchViewController: UIViewController {

    var interactor: PhotoSearchSceneInteractor!
    var viewStore: PhotoSearchSceneViewStore!
    
    // MARK: - Outletes
    @IBOutlet private weak var imageSearchBar: UISearchBar!
    @IBOutlet private weak var searchResultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchResultCollectionView.register(PhotoCell.self)
        self.searchResultCollectionView.dataSource = self
        self.imageSearchBar.delegate = self
    }
}

extension PhotoSearchViewController: PhotoSearchSceneDisplayView {
    
    func displaySearchResult(photoUrls: [String]) {
        self.viewStore.photosUrl = photoUrls
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
        return self.viewStore.photosUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotoCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        cell.configureCell(self.viewStore.photosUrl[indexPath.row])
        return cell
    }
}
