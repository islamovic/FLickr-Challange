//
//  SearchHistoryCell.swift
//  Flickr
//
//  Created by Islam Ibrahim on 14/12/2021.
//

import UIKit

class SearchHistoryCell: UITableViewCell {

    @IBOutlet private weak var searchHistoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension SearchHistoryCell {
    func configureCell(_ searchHistory: String) {
        self.searchHistoryLabel.text = searchHistory
    }
}
