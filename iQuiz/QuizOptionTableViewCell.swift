//
//  QuizOptionTableViewCell.swift
//  iQuiz
//
//  Created by quhuynh on 5/3/16.
//  Copyright © 2016 quhuynh. All rights reserved.
//

import UIKit

class QuizOptionTableViewCell: UITableViewCell {
    // MARK: Properties
    
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var quizDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
