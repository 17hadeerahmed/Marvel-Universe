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
    
    var sections = [section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moviesTable.delegate = self
        moviesTable.dataSource = self
    
        self.moviesTable.register(UINib(nibName: "TableViewCellForRow", bundle: nil), forCellReuseIdentifier: "TableViewCellForRow")
        
        
        sections = [
            section(seriesName: "spider man", row: ["row1"]),
        section(seriesName: "spider man2", row: ["row1"]),
        section(seriesName: "spider man3", row: ["row1"]),
        section(seriesName: "spider man4", row: ["row1"]),
        section(seriesName: "spider man5", row: ["row1"]),
        section(seriesName: "spider man6", row: ["row1"]),
        section(seriesName: "spider man7", row: ["row1"]),
        section(seriesName: "spider man8", row: ["row1"]),
        ]
        
    }
    

   
}


extension HomeViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        if section.isSelcted {
            return section.row.count + 1
        }
        else {
            return 1
        }
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellForSection", for: indexPath)as! TableViewCellForSection
        
        
        
        let rowCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellForRow", for: indexPath)as! TableViewCellForRow
        if indexPath.row == 0 {
            sectionCell.seriesName.text = sections[indexPath.section].seriesName
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
            sections[indexPath.section].isSelcted = !sections[indexPath.section].isSelcted
            moviesTable.reloadSections([indexPath.section], with: .none)
        }
        else {
            print(" taped cell for row")
        }
    }
   
    
    
}


