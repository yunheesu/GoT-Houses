//
//  ViewController.swift
//  GoT-Houses
//
//  Created by Heesu Yun on 4/6/20.
//  Copyright © 2020 Heesu Yun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var houses = Houses()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        houses.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // pass data from a selected TableViewCell into houseInfo property
        if segue.identifier == "ShowDetail" {
        let destination = segue.destination as! DetailViewController
        let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.houseInfo = houses.houseArray[selectedIndexPath.row]
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.houseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(houses.houseArray[indexPath.row].name)"
               return cell
    }
    
    
}
