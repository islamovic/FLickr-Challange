//
//  PhotoCell.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {

    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension PhotoCell {
    
    func configureCell(_ photo: Photo) {
        
        self.activityIndicator.startAnimating()
        let url = URL(string: photo.photoURL)!

        let resource = ImageResource(downloadURL: url)
        KingfisherManager.shared.retrieveImage(with: resource) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async { [weak self] in
                    self?.activityIndicator.stopAnimating()
                    self?.photoImageView.image = image.image
                }

            case .failure:
                DispatchQueue.main.async { [weak self] in
                    self?.activityIndicator.stopAnimating()
                    self?.photoImageView.image = UIImage(named: "Broken Link")
                }
            }
        }
    }
}
