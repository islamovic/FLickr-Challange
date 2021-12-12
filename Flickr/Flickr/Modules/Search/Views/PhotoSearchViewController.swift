//
//  PhotoSearchViewController.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import UIKit

protocol PhotoSearchSceneDisplayView: AnyObject {
    
}

class PhotoSearchViewController: UIViewController {

    var interactor: PhotoSearchSceneInteractor!
    let photoSearchWorker = PhotoSearchWorker()
    
    // MARK: - Outletes
    @IBOutlet private weak var imageSearchBar: UISearchBar!
    @IBOutlet private weak var searchResultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoSearchWorker.search("cat") { result in
            print(result)
        }
    }
}

extension PhotoSearchViewController: PhotoSearchSceneDisplayView {
    
}
