//
//  Import.swift
//  SwiftVideo
//
//  Created by messel on 10/14/14.
//  Copyright (c) 2014 messel. All rights reserved.
//
/*
import UIKit
import MobileCoreServices

class SecondViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var img:UIImageView!=nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
    @IBAction func buttonTapped(AnyObject)
    {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            println("Button capture")
            
            var imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
//            imag.mediaTypes = [kUTTypeImage];
            imag.mediaTypes = [kUTTypeVideo];
            imag.allowsEditing = false
            
            self.presentViewController(imag, animated: true, completion: nil)
        }
    }
    
    func videoPickerController(picker: UIImagePickerController!, didFinishPickingVideo image: UIImage!, editingInfo: NSDictionary!) {
        let selectedImage : UIImage = image
        //var tempImage:UIImage = editingInfo[UIImagePickerControllerOriginalImage] as UIImage
        img.image=selectedImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
*/