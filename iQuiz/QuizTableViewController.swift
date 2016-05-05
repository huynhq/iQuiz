//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by Quynh Huynh on 5/5/16.
//  Copyright © 2016 quhuynh. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    // MARK: Properties
    
    var quizzes = [Quiz]()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadQuizzes()
    }
    
    @IBAction func alertSettings(sender: AnyObject) {
        let alertController = UIAlertController(title: "Settings", message:
            "Settings go here", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func loadQuizzes() {
        let photo1 = UIImage(named: "marvel")!
        let quiz1 = Quiz(name: "Marvel", photo: photo1, description: "How well do you know \nyour super heroes?")
        
        let photo2 = UIImage(named: "math")!
        let quiz2 = Quiz(name: "Math", photo: photo2, description: "All things math!")
        
        let photo3 = UIImage(named: "science")!
        let quiz3 = Quiz(name: "Science", photo: photo3, description: "Science trivia level 100")
        
        quizzes += [quiz1, quiz2, quiz3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuizOptionTableViewCell", forIndexPath: indexPath) as! QuizOptionTableViewCell
        let quiz = quizzes[indexPath.row]
        cell.quizLabel.text = quiz.name
        cell.quizImage.image = quiz.photo
        cell.quizDescription.text = quiz.description
        cell.quizDescription.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cell.quizDescription.numberOfLines = 0
        cell.quizDescription.sizeToFit()

        return cell
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
