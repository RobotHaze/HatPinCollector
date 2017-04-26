//
//  HatPinViewController.swift
//  HatPinCollector
//
//  Created by Jordan Matthews on 4/25/17.
//  Copyright © 2017 Jordan Matthews. All rights reserved.
//

import UIKit

class HatPinViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var pinImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
    }
    
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        pinImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let pin = Pin(context: context)
        pin.title = nameTextField.text
        pin.image = UIImagePNGRepresentation(pinImageView.image!)! as NSData
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    

}
