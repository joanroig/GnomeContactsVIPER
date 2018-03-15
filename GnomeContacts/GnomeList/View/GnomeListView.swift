//
//  GnomeListView.swift
//  GnomeContacts
//
//  Created by Joan Roig on 3/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import UIKit
import Kingfisher

class GnomeListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBAction func reloadData(_ sender: Any) {
        presenter?.viewDidLoad()
    }
    
    var presenter: GnomeListPresenterProtocol?
    var gnomes: [Gnome] = []
    var filteredGnomes = [Gnome]()

    let gnomeCell = "GnomeListTableViewCell"
    let defaultFilterValue = "All"
    var filterValues = [hairColor.Pink.rawValue, hairColor.Red.rawValue,
                      hairColor.Green.rawValue, hairColor.Black.rawValue, hairColor.Gray.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

        // Register the cells from XIB files
        let nib = UINib(nibName: gnomeCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: gnomeCell)

        // Search Controller setup
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search gnome name"
        navigationItem.searchController = searchController
        definesPresentationContext = true

        // Scope categories Setup
        searchController.searchBar.scopeButtonTitles = [defaultFilterValue]
        searchController.searchBar.scopeButtonTitles?.append(contentsOf: filterValues)
        searchController.searchBar.delegate = self

    }
}

extension GnomeListView: GnomeListViewProtocol{

    func showContactDirectory(data contactDirectory: ContactDirectory) {
        // TODO for now we only work with one City data
        gnomes = contactDirectory.cities[0].citizens
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.navigationItem.title = contactDirectory.cities[0].cityName
        }
    }
}

extension GnomeListView: UsesInternetProtocol{
    
    func connectionError() {
        showConnectionError(self)
    }
    
    func showLoading() {
        showLoadingSpinner(self)
    }
    
    func hideLoading() {
        hideLoadingSpinner(self)
    }
}

extension GnomeListView: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table View
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: gnomeCell, for: indexPath) as! GnomeListTableViewCell
        
        var gnomeData : Gnome
        
        if filtering() {
            gnomeData = filteredGnomes[indexPath.row]
        } else {
            gnomeData = gnomes[indexPath.row]
        }
        
        cell.fill(data: gnomeData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filtering() {
            return filteredGnomes.count
        }
        return gnomes.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if filtering() {
            presenter?.showGnomeDetail(gnomeData: filteredGnomes[indexPath.row])
        } else{
            presenter?.showGnomeDetail(gnomeData: gnomes[indexPath.row])
        }
    }
}

extension GnomeListView: UISearchResultsUpdating, UISearchBarDelegate {
    
    // MARK: - UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let scope = searchBar.scopeButtonTitles![selectedScope]
        filterContentForSearchText(searchBar.text!, scope: scope)
    }
    
    // MARK: - UISearchResultsUpdatingDelegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String) {
        filteredGnomes = gnomes.filter({( gnome : Gnome) -> Bool in
            
            // Check if matches with the category
            let categoryMatch = (scope == defaultFilterValue) || (gnome.hair_color.rawValue == scope)
            
            if searchBarEmpty() {
                return categoryMatch
            } else {
                // Check also if matches with the search bar input
                return categoryMatch && gnome.name.lowercased().contains(searchText.lowercased())
            }
        })
        tableView.reloadData()
    }
    
    func searchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filtering() -> Bool {
        let categoryFilterActive = searchController.searchBar.selectedScopeButtonIndex != 0
        // Only filter when the search controler is shown and there are text or category filters enabled
        return searchController.isActive && (!searchBarEmpty() || categoryFilterActive)
    }
    
}

