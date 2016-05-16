//
//  AnswerTableViewCell.swift
//  iQuiz
//
//  Created by Quynh Huynh on 5/15/16.
//  Copyright © 2016 quhuynh. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var answerText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
