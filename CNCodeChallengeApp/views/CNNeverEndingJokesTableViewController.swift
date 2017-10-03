//
//  CNNeverEndingJokesTableViewController.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import UIKit

private let cnTableViewCell = "RandomJokesTableViewCellIdentifier"
class CNNeverEndingJokesTableViewController: UITableViewController {
    
    var viewModel: CNNeverEndingJokesTableViewViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        if self.viewModel == nil {
            self.viewModel = CNNeverEndingJokesTableViewViewModel(view: self , title: "Never Ending Jokes")
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
    
    override func viewDidAppear(_ animated: Bool) {
        guard self.viewModel != nil else {
            return
        }
        
        self.viewModel?.viewDidAppear()
        
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
        
        let numRowsInSection = tableView.numberOfRows(inSection: indexPath.section)
        if  indexPath.row + 1 >= numRowsInSection {
            viewModel.getRandomJokes()
            print("Load more Jokes")
            
        }
        return randomJokesTableViewCell
        
    }
}


extension CNNeverEndingJokesTableViewController: CNNeverEndingJokesTableViewControllerProtocol {
     

    func setNavigationTitle(_ title:String) {
        self.title = title
    }
    func reloadTableView() -> Void {
        self.tableView?.reloadData()
    }
}





















