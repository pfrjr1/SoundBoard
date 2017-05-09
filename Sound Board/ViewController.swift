//
//  ViewController.swift
//  Sound Board
//
//  Created by Peter Rooney on 5/4/17.
//  Copyright © 2017 Peter Rooney. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
   
    
    var sounds : [Sound] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as!
            AppDelegate).persistentContainer.viewContext
        do{
        
        sounds = try context.fetch(Sound.fetchRequest())
            tableView.reloadData()
        }catch{}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let sound = sounds[indexPath.row]
        
        cell.textLabel?.text = sound.name
        
        return cell
    }

 }

