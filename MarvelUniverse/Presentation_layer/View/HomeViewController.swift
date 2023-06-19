//
//  HomeViewController.swift
//  MarvelUniverse
//
//  Created by Hader on 14/6/23.
//

import UIKit

//////////
class section {
    let seriesName : String
    let row : [String]
    var isSelcted : Bool = false
    init( seriesName : String , row : [String] ,isSelcted : Bool = false) {
        self.seriesName = seriesName
        self.row = row
        self.isSelcted = isSelcted
    }
}

////////////

class HomeViewController: UIViewController {

    
    @IBOutlet weak var moviesTable: UITableView!
    var viewModelObj : HomeViewModel = HomeViewModel()
    var isSelcted : [Bool] = Array(repeating: false, count: 20)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTable.delegate = self
        moviesTable.dataSource = self
        
        self.moviesTable.register(UINib(nibName: "TableViewCellForRow", bundle: nil), forCellReuseIdentifier: "TableViewCellForRow")
           
            viewModelObj.bindResultToHomeView = {
                DispatchQueue.main.async{ [weak self] in
                    self?.renderSeries()
                }
            }
        viewModelObj.getSeries()
    }
    func renderSeries() {
        self.moviesTable.reloadData()
    }
    
   
}


extension HomeViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSelcted[section] {
            return 2
        }
        else {
            return 1
        }
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModelObj.fetchSeriesRes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellForSection", for: indexPath)as! TableViewCellForSection
        
        
        
        let rowCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellForRow", for: indexPath)as! TableViewCellForRow
        if indexPath.row == 0 {
            sectionCell.seriesName.text = viewModelObj.fetchSeriesRes[indexPath.section].title
            //return cell for section
            return sectionCell
        }
        else {
      //      cell.seriesName.text = sections[indexPath.section].row[indexPath.row - 1]
        
            return rowCell
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moviesTable.deselectRow(at: indexPath , animated: true)
        
        if indexPath.row == 0 {
          isSelcted[indexPath.section] = !isSelcted[indexPath.section]
            moviesTable.reloadSections([indexPath.section], with: .fade)
        }
        else {
            print(" taped cell for row")
        }
    }
   
    
    
}


