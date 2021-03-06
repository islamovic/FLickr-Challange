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
        self.interactor.search = search
        self.interactor.saveHistory(search: search)
        delegate?.searchText(with: search)
        self.navigationController?.popViewController(animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
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
        self.searchHistoryTableView.delegate = self
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

extension SearchHistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if self.dataStore.searchHistory.isEmpty {
            return nil
        }
        let clearAllHeaderView = ClearAllHeader()
        clearAllHeaderView.delegate = self
        return clearAllHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchHistory = self.dataStore.searchHistory[indexPath.row]
        delegate?.searchText(with: searchHistory)
        self.navigationController?.popViewController(animated: true)
    }
}

extension SearchHistoryViewController: SearchHistoryCellDelegate {
    
    func deleteHistoryDidSelected(history: String) {
        self.interactor.delete(history: history)
        self.searchHistoryTableView.reloadData()
    }
}

extension SearchHistoryViewController: ClearAllHeaderDelegate {
    
    func clearAllHistoryDidTapped() {
        self.interactor.clearAllSearchHistory()
        self.searchHistoryTableView.reloadData()
    }
}
