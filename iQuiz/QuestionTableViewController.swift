//
//  QuestionTableViewController.swift
//  iQuiz
//
//  Created by Quynh Huynh on 5/15/16.
//  Copyright © 2016 quhuynh. All rights reserved.
//

import UIKit
import SwiftyJSON

class QuestionTableViewController: UITableViewController {
    var quizChoice : Int = 0
    var answers : [String] = []
    var currentQuestion : Int = 0
    var correctAnswer : Int = 0
    var totalQuestions = 0

    @IBOutlet weak var questionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let json = JSON(defaults.objectForKey("data")!)
        let questions = json[quizChoice]["questions"]
        totalQuestions = questions.count
        answers = []
        questionText.text = String(questions[currentQuestion]["text"])
        correctAnswer = Int(questions[currentQuestion]["answer"].stringValue)! - 1
            
        for (_, answer) in questions[currentQuestion]["answers"] {
            answers.append(String(answer))
        }
        self.tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return answers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AnswerTableViewCell", forIndexPath: indexPath) as! AnswerTableViewCell
        cell.answerText.text = answers[indexPath.row]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondVC : AnswerViewController = segue.destinationViewController as! AnswerViewController
        secondVC.choice = tableView.indexPathForSelectedRow!.row
        secondVC.answers = self.answers
        secondVC.correctChoice = correctAnswer
        secondVC.currentQuestion = currentQuestion
        if(tableView.indexPathForSelectedRow!.row == correctAnswer) {
            secondVC.correct = true
        }
        secondVC.quizChoice = quizChoice
        secondVC.totalQuestions = totalQuestions
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
