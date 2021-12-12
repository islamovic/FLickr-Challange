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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension PhotoCell {
    
    func configureCell(_ imageURL: String) {
        let url = URL(string: imageURL)!
        photoImageView.kf.setImage(with: url)
    }
}
