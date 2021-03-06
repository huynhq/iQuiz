//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by Quynh Huynh on 5/5/16.
//  Copyright © 2016 quhuynh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class QuizTableViewController: UITableViewController {
    // MARK: Properties
    
    var quizzes = [Quiz]()
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        getQuizData("http://tednewardsandbox.site44.com/questions.json")
    }
    
    func getQuizData(url : String) {
        Alamofire.request(.GET, url).validate()
            .responseJSON { response in
                self.defaults.setObject(response.result.value!, forKey: "data")
                // add quizzes to main window
                for quiz in JSON(response.result.value!).array! {
                    let title = String(quiz["title"])
                    let desc = String(quiz["desc"])
                    let quizPhoto = UIImage(named: title)!
                    let quizItem = Quiz(name: title, photo: quizPhoto, description: desc)
                    self.quizzes.append(quizItem)
                }
                self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondVC : QuestionTableViewController = segue.destinationViewController as! QuestionTableViewController
        secondVC.quizChoice = tableView.indexPathForSelectedRow!.row
    }
    
    @IBAction func alertSettings(sender: AnyObject) {
        let alertController = UIAlertController(title: "Settings", message:
            "Settings go here", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
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
