//
//  UILabelStub.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//


import Foundation
import UIKit
@testable import CNCodeChallengeApp
class UILabelStub: UILabel {
    
    init() {
        
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
}
