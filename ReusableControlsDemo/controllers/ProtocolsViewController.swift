//
//  ProtocolsViewController.swift
//  ReusableControlsDemo
//
//  Created by Alejandro  Rodriguez on 26-03-18.
//  Copyright © 2018 Alejandro  Rodriguez. All rights reserved.
//

import UIKit

class ProtocolsViewController: UIViewController {
    @IBOutlet weak var xDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func select_date(_ sender: Any) {
        let sb = UIStoryboard(name: "PopUpStoryBoard", bundle: nil)
        let popup = sb.instantiateInitialViewController() as! PopUpViewController
        popup.showDateTimer = true //time
        popup.delegate = self
        
        self.present(popup, animated: true)
    }
}

extension ProtocolsViewController: PopUpDelegate {
    func popupValue(value: String) {
        self.xDate.text = value
    }
}
