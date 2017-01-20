//
//  SearchVC.swift
//  SearchController
//
//  Created by Kan Chanproseth on 1/20/17.
//  Copyright © 2017 Kan Chanproseth. All rights reserved.
//

import UIKit

class SearchVC: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
   

    var arrFilter = [String]()
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var arrdata = ["Joes Crab Shack", "Miami", "FL","Jims Crab Shack", "Los Angeles"]
    var SearchData = [String]()
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
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! CellOfSearchList
        cell.listLabel.text = SearchData[indexPath.row]
        return cell
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if string.isEmpty
        {
            search = String(search.characters.dropLast())
        }
        else
        {
            search=txtField.text!+string
        }
        
        print(search)
//        let predicate=NSPredicate(format: "SELF.name CONTAINS[cd] %@", search)
//        let arr=(arrdata as NSArray).filtered(using: predicate)
        let arr = arrdata.filter({ (city) -> Bool in
            let cityText: NSString = city as NSString
            
            return (cityText.range(of: search, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        
        if arr.count > 0
        {
            SearchData.removeAll(keepingCapacity: true)
            SearchData = arr 
        }
        else
        {
            SearchData=arrdata
        }
        tableView.reloadData()
        return true
    }
}
