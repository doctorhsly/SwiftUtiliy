//
//  PhotoViewController.swift
//  SwiftUtilityProject
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 TDENERGYs. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    
    @IBOutlet weak var selectImageVIew: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func takePhotoAction(sender: AnyObject) {
        
        let alertController = UIAlertController.init(title: "Take Image From", message: "", preferredStyle: .ActionSheet)
        let cameraAction = UIAlertAction.init(title: "From Camera", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            print("action...%@",alertAction);
            self.imgFromCamera()
        }
        let albumAction = UIAlertAction.init(title: "From Album", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            print("action...%@",alertAction);
            self.imgFromAlbum()
        }
        let cancelAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
            print("action...%@",alertAction);
        }
        
        alertController.addAction(cameraAction)
        alertController.addAction(albumAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true) { () -> Void in
            
        }
    }
    
    
    func imgFromCamera () {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .Camera
        pickerController.allowsEditing = true;
        presentViewController(pickerController, animated: true) { () -> Void in
            
        }
    }
    
    func imgFromAlbum () {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .PhotoLibrary
        pickerController.allowsEditing = true
        presentViewController(pickerController, animated: true) { () -> Void in
            
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        dismissViewControllerAnimated(true) { () -> Void in
            self.selectImageVIew.image = image
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true) { () -> Void in
            print("cancel image picker contoller")
        }
    }
    
    
    @IBAction func loginAction(sender: AnyObject) {
        
        var usernameTextField: UITextField?
        var passwordTextField: UITextField?
        
        let alertController = UIAlertController.init(title: "Log in", message: "Please enter your credentials", preferredStyle: .Alert)
        
        let loginAction = UIAlertAction(title: "Log in", style: UIAlertActionStyle.Default) { (action) -> Void in
            
            if let username = usernameTextField?.text {
                print("username = \(username)")
            } else {
                print("no username entered")
            }
            
            if let password = passwordTextField?.text {
                print("password = \(password)")
            } else {
                print("no password entered")
            }
        }
        
        alertController.addTextFieldWithConfigurationHandler { (txtUsername) -> Void in
            usernameTextField = txtUsername
            usernameTextField!.placeholder = "<Your username here>"
        }
        alertController.addTextFieldWithConfigurationHandler { (txtPassword) -> Void in
            passwordTextField = txtPassword
            passwordTextField!.secureTextEntry = true
            passwordTextField!.placeholder = "<Your password here>"
        }
        
        alertController.addAction(loginAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    

}
