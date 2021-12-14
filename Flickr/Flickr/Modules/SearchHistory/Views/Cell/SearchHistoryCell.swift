//
//  SearchHistoryCell.swift
//  Flickr
//
//  Created by Islam Ibrahim on 14/12/2021.
//

import UIKit

protocol SearchHistoryCellDelegate: AnyObject {
    func deleteHistoryDidSelected(history: String)
}

class SearchHistoryCell: UITableViewCell {

    @IBOutlet private weak var searchHistoryLabel: UILabel!
    
    weak var delegate: SearchHistoryCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func searchHistoryDeletedDidTapped(_ sender: UIButton) {
        let selectedHistory = self.searchHistoryLabel.text ?? ""
        delegate?.deleteHistoryDidSelected(history: selectedHistory)
    }
}

extension SearchHistoryCell {
    func configureCell(_ searchHistory: String) {
        self.searchHistoryLabel.text = searchHistory
    }
}
