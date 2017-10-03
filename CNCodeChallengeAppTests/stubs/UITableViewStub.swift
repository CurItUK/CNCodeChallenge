//
//  UITableViewStub.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import UIKit
@testable import CNCodeChallengeApp
class UITableViewStub: UITableView {
    
    init() {
        super.init(frame: CGRect.zero ,  style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder){
        
        super.init(coder: aDecoder)
        
    }
    
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        return CNNeverEndingJokesTableViewCell()
    }
    
}
