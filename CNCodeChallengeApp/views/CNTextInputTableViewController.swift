//
//  CNTextInputTableViewController.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//



import Foundation
import UIKit

private let cnTableViewCell = "RandomJokesTableViewCellIdentifier"
class CNTextInputTableViewController: UITableViewController , UITextFieldDelegate{
    
    var viewModel: CNTextInputJokesTableViewViewModel?
    
    var searchText: String?  {
        didSet {
            self.searchForJokes()
        }
    }
    
    @IBOutlet weak var searchField: UITextField!{
        didSet {
            searchField.delegate = self
            searchField.text = searchText
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        if self.viewModel == nil {
            self.viewModel = CNTextInputJokesTableViewViewModel(view: self , title: "Text Input Jokes")
        }
        self.viewModel?.initialViewSetup()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = self.viewModel else {
            return 0
        }
        
        return viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = self.viewModel else {
            return 0
        }
        
        return viewModel.numberOfRowsInSection(section)
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchText = textField.text
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cnTableViewCell, for: indexPath) as? CNNeverEndingJokesTableViewCell
        
        guard let viewModel = viewModel,
            let randomJokesTableViewCell = cell else {
                return UITableViewCell()
        }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cellViewModel?.view = randomJokesTableViewCell
        //TODO: This method questionable
        randomJokesTableViewCell.viewModel = cellViewModel
        // cellViewModel.setView(randomJokesTableViewCell)
        randomJokesTableViewCell.setup()
        
        _ = tableView.numberOfRows(inSection: indexPath.section)
        
        return randomJokesTableViewCell
        
    }
}


extension CNTextInputTableViewController: CNNeverEndingJokesTextInputProtocol {
    func setNavigationTitle(_ title:String) {
        guard !title.isEmpty else { return}
        guard let viewModel = self.viewModel else {return}
        viewModel.setNavigationTitle(title)
        
    }
    func reloadTableView() -> Void {
        self.tableView?.reloadData()
    }
    
    func searchForJokes() {
        guard let viewModel = self.viewModel else {
            return
        }
        return viewModel.searchForJokes(self.searchText)
        
    }
    func showAlert(_ message: String){
        let alert = UIAlertController(title: "Invalid Text", message: message , preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}





















