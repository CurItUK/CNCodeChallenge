//
//  CNNeverEndingJokesTableViewCell.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import UIKit

class CNNeverEndingJokesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var jokeTitle: UILabel!
    @IBOutlet weak var jokeDetail: UILabel!
    @IBOutlet weak var jokeID: UILabel!
    @IBOutlet weak var cnImageView: UIImageView!
    
    var viewModel:CNNeverEndingJokesTableViewCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
  //  override func setSelected(_ selected: Bool, animated: Bool) {
    //    super.setSelected(selected, animated: animated)
        
    //}
    
    func setup() {
        viewModel?.setup()
    }
    
}


extension CNNeverEndingJokesTableViewCell : CNNeverEndingJokesTableViewCellProtocol  {
    
    func setTitle(_ title:String) {
        print(self.jokeTitle)
        self.jokeTitle.text = title
        
    }
    func setDetail(_ detail:String){
        
        self.jokeDetail.text =  detail
    }
    
    func setID(_ detail:String){
        
        self.jokeID.text =  detail
    }
    
 
    
    
    
    
}
