//
//  Quiz.swift
//  iQuiz
//
//  Created by Quynh Huynh on 5/5/16.
//  Copyright © 2016 quhuynh. All rights reserved.
//

import UIKit

class Quiz {
    var name: String
    var photo: UIImage?
    var description: String
    
    // MARK: Initialization
    
    init(name: String, photo: UIImage?, description: String) {
        self.name = name
        self.photo = photo
        self.description = description
    }
}
