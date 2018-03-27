//
//  CallbacksViewController.swift
//  ReusableControlsDemo
//
//  Created by Alejandro  Rodriguez on 26-03-18.
//  Copyright © 2018 Alejandro  Rodriguez. All rights reserved.
//

import UIKit

class CallbacksViewController: UIViewController {

    @IBOutlet weak var xDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func select_date(_ sender: Any) {
        let sb = UIStoryboard(name: "PopUpStoryBoard", bundle: nil)
        let popup = sb.instantiateInitialViewController() as! PopUpViewController
        
        popup.onSave = { (date: String)  -> () in
            self.xDate.text = date
        }
    
        
        self.present(popup, animated: true)
    }

}
