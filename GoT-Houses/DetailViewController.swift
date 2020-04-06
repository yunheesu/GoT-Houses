//
//  DetailViewController.swift
//  GoT-Houses
//
//  Created by Heesu Yun on 4/6/20.
//  Copyright © 2020 Heesu Yun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionImageView: UIImageView!
    @IBOutlet weak var coatOfArmsLabel: UILabel!
    @IBOutlet weak var coatOfArmsTextView: UITextView!
    
    var houseInfo: HouseInfo!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if houseInfo == nil { // passing empty string for starter
            houseInfo = HouseInfo(name: "", region: "", coatOfArms: "", words: "")
        }
        updateUsertInterface()
    }
    
    func updateUsertInterface() {
        nameLabel.text = houseInfo.name
        wordsLabel.text = houseInfo.words //TODO: fix the quotes
        if wordsLabel.text != ""{
        wordsLabel.text = "\"\(houseInfo.words)\"" // using a double quote! by slash!
        }
        regionLabel.text = houseInfo.region
        coatOfArmsTextView.text = houseInfo.coatOfArms
        regionImageView.image = UIImage(named: houseInfo.region) // updating userinterface!
        if coatOfArmsTextView.text == "" { // hiding coat of arms label when there is no description
            coatOfArmsLabel.isHidden = true 
            

        }
    }
    
}
