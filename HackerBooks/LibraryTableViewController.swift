//
//  LibraryTableViewController.swift
//  HackerBooks
//
//  Created by Ramiro García Salazar on 13/12/15.
//  Copyright © 2015 Ramiro García Salazar. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var bibilioteca = Library()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        
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
        return bibilioteca.countTags
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bibilioteca.bookCountForTag(bibilioteca.tags[section])
    }
    
    
    
    func loadData(){
        
        do{
            if let url = NSURL(string: Library.URL_JSON),
                data = NSData(contentsOfURL: url),
                libros = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray
            {
                bibilioteca = Library(books: decode(bookArray: libros))
                
                print("countBooks -> \(bibilioteca.countBooks)")
                print("bookCountForTag -> \(bibilioteca.bookCountForTag("data mining"))")
                print("booksForTag -> \(bibilioteca.booksForTag("data mining"))")
                print("countBooks -> \(bibilioteca.countBooks)")
                
            }
        }catch{
            print("Error: Parseando el JSON")
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("bookCellId", forIndexPath: indexPath) as! BookTableViewCell
        
        let tag = self.bibilioteca.tags[indexPath.section]
        let booksForTag = self.bibilioteca.booksForTag(tag)
        let book = booksForTag?[indexPath.row]
        
        cell.lblTitle.text = book?.title
        cell.lblAuthors.text = book?.authors.joinWithSeparator(", ")
        
        cell.imgBook.image = UIImage(data: <#T##NSData#>)

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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
