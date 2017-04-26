//
//  ViewController.swift
//  HatPinCollector
//
//  Created by Jordan Matthews on 4/25/17.
//  Copyright © 2017 Jordan Matthews. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var pins : [Pin] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
        pins = try context.fetch(Pin.fetchRequest())
        tableView.reloadData()
        } catch {
            
        }
        
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
            
            return pins.count
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = UITableViewCell()
            let pin = pins[indexPath.row]
            cell.textLabel?.text = pin.title
            cell.imageView?.image = UIImage(data: pin.image! as Data)
            return cell
        }
    
        
    }
    


