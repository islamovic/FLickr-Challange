//
//  SearchHistoryViewController.swift
//  Flickr
//
//  Created by Islam Ibrahim on 14/12/2021.
//

import UIKit

protocol SearchHistorySceneDelegate: AnyObject {
    func searchText(with search: String)
}

class SearchHistoryViewController: UIViewController {

    @IBOutlet private weak var searchHistoryTableView: UITableView!
    
    weak var delegate: SearchHistorySceneDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
}

extension SearchHistoryViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let search = searchBar.text else { return }
        delegate?.searchText(with: search)
        self.navigationController?.popViewController(animated: true)
    }
}

private extension SearchHistoryViewController {
    
    func updateUI() {
        InitializeSearchBar()
        udpateTableView()
    }
    
    func InitializeSearchBar() {
        
        // Create Search Bar
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
        searchBar.delegate = self
        searchBar.returnKeyType = .search
        searchBar.placeholder = "search away..."
        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.becomeFirstResponder()
        
        // Update Navigation Bar with Search Bar
        self.navigationController?.navigationBar.backItem?.title = ""
        let searchBarBarButtonItem = UIBarButtonItem(customView: searchBar)
        self.navigationItem.rightBarButtonItem = searchBarBarButtonItem
    }
    
    func udpateTableView() {
        self.searchHistoryTableView.tableFooterView = UIView(frame: .zero)
    }
}
