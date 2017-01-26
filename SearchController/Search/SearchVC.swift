//
//  SearchVC.swift
//  SearchController
//
//  Created by Kan Chanproseth on 1/20/17.
//  Copyright © 2017 Kan Chanproseth. All rights reserved.
//

import UIKit

class SearchVC: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
   
    var ShowSearchResult:Bool?
    
    
    var StartSearch : Bool?
    var arrFilter = [String]()
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var arrdata = ["Joes Crab Shack", "Miami", "FL","Jims Crab Shack", "Los Angeles"]
    var arrdata2 = ["Joes Crab Shack2", "Miami2", "FL2","Jims Crab Shack2", "Los Angeles2"]
    var arrSearchData = ["Joes Crab Shack***2", "Miami***2", "FL***2","Jims Crab Shack***2", "Los Angeles***2"]
    var SearchData = [String]()
    var SearchData2 = [String]()
    var search:String = ""
    var searchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShowSearchResult = false
        
        tableView.delegate = self
        tableView.dataSource = self
        txtField.delegate = self
        SearchData = arrdata
        SearchData2 = arrdata2
        StartSearch = false
        txtField.becomeFirstResponder()
        
    }
//    func dismissKeyboard(){
//        view.endEditing(true)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if ShowSearchResult == true{
            if section == 0 || section == 1 {
                return 0
            }else {
                return arrSearchData.count
            }
        }else{
            if StartSearch == true{
                if section == 0 {
                    return SearchData.count
                }
                if section == 1{
                    return SearchData2.count
                }
                if section == 2{
                    return 0
                }
            }else{
                if section == 0 {
                    return SearchData.count
                }
                if section == 1{
                    return 0
                }
                if section == 2{
                    return 0
                }
            }
        }
        return 0 //this line never execute
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
        }
        if indexPath.section == 1{
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
        if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResult", for: indexPath) as! CellOfSearchResult
            
            return cell
        
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2{
            return 100
        }
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 || indexPath.section == 1 {
            ShowSearchResult = true
            view.endEditing(true)
            tableView.reloadData()
        }else{
            
        }
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
            ShowSearchResult = false
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
    
    @IBAction func backToSearchFilter(_ sender: Any) {
        if ShowSearchResult == true{
            ShowSearchResult = false
            tableView.reloadData()
        }else{
            dismiss(animated: true, completion: nil)
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
}
