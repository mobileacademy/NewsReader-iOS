//
//  SettingsTableViewController.swift
//  NewsReader
//
//  Created by Mac on 25/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SettingsTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var bgSwtich: UISwitch!
    @IBOutlet weak var bgSegment: UISegmentedControl!
    
    @IBAction func toggleBGSwitch(sender: UISwitch) {
        print( "\(sender.on)" )
        
        NSUserDefaults.standardUserDefaults().setBool(sender.on, forKey: SettingsKey.BG.rawValue)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func bgValueChanged(sender: UISegmentedControl) {
        NSUserDefaults.standardUserDefaults().setInteger(sender.selectedSegmentIndex+1, forKey: SettingsKey.BGTheme.rawValue)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func tappedChooseImage(sender: UIButton) {
        let alertController = UIAlertController(title: "Choose", message: "Choose the source", preferredStyle: .ActionSheet )
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let action = UIAlertAction(title: "Camera", style: .Default ){
                ac in
                self.showPicker( .Camera )
            }
            
            alertController.addAction(action)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum) {
            let action = UIAlertAction(title: "Photos", style: .Default ){
                ac in
                self.showPicker( .PhotoLibrary )
            }
            
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel){
            ac in
        }
        
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true){}
    }
    
    func showPicker(type:UIImagePickerControllerSourceType){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = type
        
        presentViewController(pickerController, animated: true, completion: { () in })
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        if let data = UIImagePNGRepresentation(image){
            let path = NSHomeDirectory()+"/Documents/bg.png"
            
            data.writeToFile(path, atomically: true)
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: SettingsKey.CustomBG.rawValue)
        }
        
        picker.dismissViewControllerAnimated(true){}
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        picker.dismissViewControllerAnimated(true){}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        bgSwtich.on = NSUserDefaults.standardUserDefaults().boolForKey( SettingsKey.BG.rawValue)
        bgSegment.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey( SettingsKey.BGTheme.rawValue ) - 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
