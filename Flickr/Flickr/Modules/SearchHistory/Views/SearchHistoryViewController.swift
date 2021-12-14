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

protocol SearchHistorySceneDisplayView: AnyObject {
    func displaySearchHistory(_ searchHistory: [String])
}

class SearchHistoryViewController: UIViewController {

    @IBOutlet private weak var searchHistoryTableView: UITableView!
    
    var interactor: SearchHistorySceneInteractor!
    var dataStore: SearchHistorySceneDataStore!
    
    weak var delegate: SearchHistorySceneDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        self.interactor.fetchSearchHistory()
    }
}

extension SearchHistoryViewController: SearchHistorySceneDisplayView {
    func displaySearchHistory(_ searchHistory: [String]) {
        self.searchHistoryTableView.reloadData()
    }
}

extension SearchHistoryViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let search = searchBar.text else { return }
        AppFileManager.save(search: search)
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
        self.searchHistoryTableView.dataSource = self
        self.searchHistoryTableView.register(SearchHistoryCell.self)
    }
}

extension SearchHistoryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataStore.searchHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchHistoryCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.configureCell(self.dataStore.searchHistory[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension SearchHistoryViewController: SearchHistoryCellDelegate {
    
    func deleteHistoryDidSelected(history: String) {
        AppFileManager.deleteHistory(history)
        self.interactor.fetchSearchHistory()
    }
}
