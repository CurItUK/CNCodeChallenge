//
//  CNURLSessionProtocol.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
protocol CNURLSessionProtocol : class {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask
}

extension URLSession : CNURLSessionProtocol {
    
}
