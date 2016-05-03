//
//  QuizOption.swift
//  iQuiz
//
//  Created by quhuynh on 5/3/16.
//  Copyright © 2016 quhuynh. All rights reserved.
//
// This represents a quiz a user can select
import UIKit

class QuizOption: NSObject {
    var name: String
    
    // Returns a ToDoItem initialized with the given text and default completed value.
    init(name: String) {
        self.name = name
    }
}
