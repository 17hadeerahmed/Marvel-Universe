//
//  SearchViewController.swift
//  MarvelUniverse
//
//  Created by Hader on 19/6/23.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {
    
    @IBOutlet weak var seriesTable: UITableView!
    var viewModelObj : SearchViewModel = SearchViewModel()
    var searching = false
    let searchController = UISearchController(searchResultsController: nil)
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        configureSearchController ()
        viewModelObj.getSeries()
        viewModelObj.bindResultToSearchView = {[weak self] in
            DispatchQueue.main.async{
                self?.renderSearchedSeries()
            }
            
        }
    }
    func configureSearchController ()
    {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType =  UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Series By Name"
    }
    
    func renderSearchedSeries() {
        seriesTable.reloadData()
    }
}

extension SearchViewController : UITableViewDelegate , UITableViewDataSource ,UISearchBarDelegate , UISearchResultsUpdating {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellForSection", for: indexPath)as! TableViewCellForSection
        if searching {
            
            let path = viewModelObj.searchedSeries[indexPath.section].thumbnail?.path ?? ""
            let ext = viewModelObj.searchedSeries[indexPath.section].thumbnail?.extension ?? ""
            let seriesImgUrl = URL(string: path + "." + ext)
            let processor = RoundCornerImageProcessor(cornerRadius: 15)
            
            sectionCell.seriesName.text = viewModelObj.searchedSeries[indexPath.section].title
            sectionCell.seriesImg.kf.setImage(with: seriesImgUrl , options: [
                .processor(processor),
                .transition(.fade(2)),
            ])
            sectionCell.seriesYear.text = "Start Year :" + String(describing: viewModelObj.searchedSeries[indexPath.section].startYear ?? 2000)
            return sectionCell
            
        } else {
            let path = viewModelObj.allSeries[indexPath.section].thumbnail?.path ?? ""
            let ext = viewModelObj.allSeries[indexPath.section].thumbnail?.extension ?? ""
            let seriesImgUrl = URL(string: path + "." + ext)
            let processor = RoundCornerImageProcessor(cornerRadius: 15)
            
            sectionCell.seriesName.text = viewModelObj.allSeries[indexPath.section].title
            sectionCell.seriesImg.kf.setImage(with: seriesImgUrl , options: [
                .processor(processor),
                .transition(.fade(2)),
            ])
            sectionCell.seriesYear.text = "Start Year :" + String(describing: viewModelObj.allSeries[indexPath.section].startYear ?? 2000)
            return sectionCell
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searching {
            return viewModelObj.searchedSeries.count
        }
        else
        {
            return viewModelObj.allSeries.count
            
        }
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty
        {
            searching = true
            viewModelObj.searchedSeries.removeAll()
            for series in viewModelObj.allSeries
            {
                if   series.title!.lowercased().contains(searchText.lowercased())
                {
                    viewModelObj.searchedSeries.append(series)
                }
            }
            renderSearchedSeries()
        }
            else
            {
                searching = false
                viewModelObj.searchedSeries.removeAll()
                viewModelObj.searchedSeries = viewModelObj.allSeries
                renderSearchedSeries()

            }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        viewModelObj.searchedSeries.removeAll()
        renderSearchedSeries()
    }
    
    
}

