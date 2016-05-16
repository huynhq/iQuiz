//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Quynh Huynh on 5/15/16.
//  Copyright © 2016 quhuynh. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var userAnswer: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    var choice = 0
    var correctChoice = 0
    var correct = false
    var answers = []
    var currentQuestion = 0
    var quizChoice = 0
    var totalQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userAnswer.text = String(answers[choice])
        correctAnswer.text = String(answers[correctChoice])
        if(choice == correctChoice) {
            message.text = "Nice, you got it right!"
        } else {
            message.text = "WRONG"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func transition(sender: AnyObject) {
        if(currentQuestion + 1 < totalQuestions) {
            performSegueWithIdentifier("QuestionSegue", sender: nil)
        } else {
            performSegueWithIdentifier("FinishSegue", sender: nil)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "QuestionSegue") {
            let secondVC : QuestionTableViewController = segue.destinationViewController as! QuestionTableViewController
            secondVC.currentQuestion = currentQuestion + 1
            secondVC.quizChoice = quizChoice
        }
    }

}
