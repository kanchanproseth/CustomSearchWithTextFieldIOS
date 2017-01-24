//
//  SearchVC.swift
//  SearchController
//
//  Created by Kan Chanproseth on 1/20/17.
//  Copyright © 2017 Kan Chanproseth. All rights reserved.
//

import UIKit

class SearchVC: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
   
    
    var StartSearch : Bool?
    var arrFilter = [String]()
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var arrdata = ["Joes Crab Shack", "Miami", "FL","Jims Crab Shack", "Los Angeles"]
    var arrdata2 = ["Joes Crab Shack2", "Miami2", "FL2","Jims Crab Shack2", "Los Angeles2"]
    var SearchData = [String]()
    var SearchData2 = [String]()
    var search:String = ""
    var searchController = UISearchController()
    override func viewDidAppear(_ animated: Bool) {
        txtField.becomeFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        txtField.delegate = self
        SearchData = arrdata
        SearchData2 = arrdata2
        StartSearch = false
        
        //heightMainSearch.constant = 44 + 20
        
//        let searchController = UISearchController(searchResultsController: nil)
//        self.navigationItem.titleView = searchController.searchBar
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.searchBar.tintColor = UIColor.blue
//        self.searchController.delegate = self
//        self.searchController.searchBar.delegate = self
//        self.searchController.searchBar.becomeFirstResponder()
//        searchController.searchBar.placeholder = "Search for Document"
//        searchController.searchBar.sizeToFit()
//        searchController.searchBar.setValue("X", forKey: "_cancelButtonText")
//        searchController.isActive = true
//        searchController.becomeFirstResponder()
//            //(UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self])).tintColor = UIColor.grayColor()
//        (UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])).tintColor = UIColor.gray
//          
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if StartSearch == true{
            if section == 0 {
                return SearchData.count
            }else {
                return SearchData2.count
            }
        }else{
            if section == 0 {
                return SearchData.count
            }else {
                return 0
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! CellOfHistoryList
            cell.btnSetToSearch.setImage(UIImage(named: "Down Left_000000_100"), for: .normal)
            UIView.animate(withDuration: 0, animations:{
                cell.btnSetToSearch.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2)) //M_PI
            })
            if cell.btnSetToSearch.isSelected == true{
                txtField.text = SearchData[indexPath.row]
            }
            
            cell.listLabel.text = SearchData[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! CellOfSearchList
            cell.btnSetToSearch.setImage(UIImage(named: "Down Left_000000_100"), for: .normal)
            UIView.animate(withDuration: 0, animations:{
                cell.btnSetToSearch.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2)) //M_PI
            })
            if cell.btnSetToSearch.isSelected == true{
                txtField.text = SearchData2[indexPath.row]
            }
            cell.listLabel.text = SearchData2[indexPath.row]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.isEmpty
        {
            search = String(search.characters.dropLast())
            if search == ""{
                StartSearch = false
                tableView.reloadData()
            }
        }
        else
        {
            search=txtField.text!+string
            StartSearch = true
        }
        
        print(search)
//        let predicate=NSPredicate(format: "SELF.name CONTAINS[cd] %@", search)
//        let arr=(arrdata as NSArray).filtered(using: predicate)
        let arr = arrdata.filter({ (city) -> Bool in
            let cText: NSString = city as NSString
            
            return (cText.range(of: search, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        let arr2 = arrdata2.filter({ (city) -> Bool in
            let cText: NSString = city as NSString
            
            return (cText.range(of: search, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        
        if arr.count > 0
        {
            SearchData.removeAll(keepingCapacity: true)
            SearchData = arr
            SearchData2.removeAll(keepingCapacity: true)
            SearchData2 = arr2
        }
        else
        {
            SearchData = arrdata
            SearchData2 = []
        }
        tableView.reloadData()
        return true
    }
}
