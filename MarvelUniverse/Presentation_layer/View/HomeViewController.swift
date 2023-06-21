//
//  HomeViewController.swift
//  MarvelUniverse
//
//  Created by Hader on 14/6/23.
//

import UIKit
import Kingfisher
import CoreData

class HomeViewController: UIViewController {

    
    @IBOutlet weak var moviesTable: UITableView!
    var viewModelObj : HomeViewModel = HomeViewModel()
    var isSelcted : [Bool] = Array(repeating: false, count: 20)
    var loadedCellCount = 15
    
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
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font:  UIFont(name: "Georgia Bold ", size: 19) as Any ]
        
    }
    func renderSeries() {
        self.moviesTable.reloadData()
    }
    
   
    @IBAction func searchBTN(_ sender: Any) {
        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(searchVC, animated: true)

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
        guard indexPath.section < viewModelObj.fetchSeriesRes.count else {
            return sectionCell
        }
        guard indexPath.row < viewModelObj.fetchSeriesRes.count else {
            return sectionCell
        }
        let path = viewModelObj.fetchSeriesRes[indexPath.section].thumbnail?.path ?? ""
        let ext = viewModelObj.fetchSeriesRes[indexPath.section].thumbnail?.extension ?? ""
        let seriesImgUrl = URL(string: path + "." + ext)
        let processor = RoundCornerImageProcessor(cornerRadius: 15)
       
        if indexPath.row == 0 {
            sectionCell.seriesName.text = viewModelObj.fetchSeriesRes[indexPath.section].title
            sectionCell.seriesImg.kf.setImage(with: seriesImgUrl , options: [
                .processor(processor),
                .transition(.fade(2)),
            ])
            
            sectionCell.seriesYear.text = "Start Year :" + String(describing: viewModelObj.fetchSeriesRes[indexPath.section].startYear ?? 2000)
            //return cell for section
            return sectionCell
        }
        else {
            rowCell.seriesDescrp.text = viewModelObj.fetchSeriesRes[indexPath.section].description ?? "sorry this Series does not have a formal description "
            
            rowCell.seriesCreators.text = viewModelObj.fetchSeriesRes[indexPath.section].creators?.items?.first?.name ?? "sorry this series does not have a formal creators "
            return rowCell
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moviesTable.deselectRow(at: indexPath , animated: true)
        let descrp = viewModelObj.fetchSeriesRes[indexPath.section].description ?? "sorry this Series does not have a formal description "
        let creator = viewModelObj.fetchSeriesRes[indexPath.section].creators?.items?.first?.name ?? "sorry this series does not have a formal creators "
        CoreDataManager.SaveToCoreData(descrip: descrp , creators: creator)
        
        if indexPath.row == 0 {
          isSelcted[indexPath.section] = !isSelcted[indexPath.section]
            moviesTable.reloadSections([indexPath.section], with: .fade)
        }
        else {
            print(" taped cell for row")
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let maximumOffeset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if (maximumOffeset - contentOffsetY <= 200 && loadedCellCount < viewModelObj.fetchSeriesRes.count){
            
            let sectionToLoaded = Int(ceil(Double(viewModelObj.fetchSeriesRes.count - loadedCellCount) / 15.0))
            
            loadedCellCount += sectionToLoaded * 15
            renderSeries()
        }
    }
   
    
    
}


