//
//  AIOMemoTableViewController.swift
//  All-In-One
//
//  Created by Albin Berisha on 7/19/20.
//  Copyright © 2020 Albin Berisha. All rights reserved.
//

import UIKit

class AIOMemoTableViewController: UITableViewController {
    
    var memos = [AIOMemo]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        if let savedMemos = loadMemos() {
            memos += savedMemos
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AIOMemoTableViewCell", for: indexPath) as! AIOMemoTableViewCell
        let memo = memos[indexPath.row]
        cell.titleLabel.text = memo.title
        cell.row = indexPath.row
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            memos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveMemos()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowMemo" {
            (segue.destination as? AIOMemoViewController)?.title = (sender as? AIOMemoTableViewCell)?.titleLabel.text
            (segue.destination as? AIOMemoViewController)?.memo?.text = memos[((sender as? AIOMemoTableViewCell)?.row)!].text
            (segue.destination as? AIOMemoViewController)?.memo?.title = memos[((sender as? AIOMemoTableViewCell)?.row)!].title
        }
        
    }
    
    @IBAction func unwindToMemoTableView(sender: UIStoryboardSegue) {
        
        let sourceViewController = sender.source as? AIOEditMemoViewController
        let memo = sourceViewController?.aioMemo
        if (sourceViewController != nil && memo?.title != "") {
            let newIndexPath = IndexPath(row: memos.count, section: 0)
            memos.append(memo!)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
        }
        saveMemos()
        
    }
    
    func saveMemos() {
        let isSaved = NSKeyedArchiver.archiveRootObject(memos, toFile: AIOMemo.ArchiveUrl.path)
        if !isSaved {
            print("Failed to save items...")
        }
    }
    
    func loadMemos() -> [AIOMemo]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: AIOMemo.ArchiveUrl.path) as? [AIOMemo]
    }

}
