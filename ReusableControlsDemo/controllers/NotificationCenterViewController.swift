//
//  NotificationCenterViewController.swift
//  ReusableControlsDemo
//
//  Created by Alejandro  Rodriguez on 26-03-18.
//  Copyright © 2018 Alejandro  Rodriguez. All rights reserved.
//

import UIKit

class NotificationCenterViewController: UIViewController {

    @IBOutlet weak var xDate: UILabel!
    var observer : NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: .main) { (notification) in
            let datevc = notification.object as! PopUpViewController
            self.xDate.text = datevc.formattedDate
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    @IBAction func select_date(_ sender: Any) {
        let sb = UIStoryboard(name: "PopUpStoryBoard", bundle: nil)
        let popup = sb.instantiateInitialViewController()!
        self.present(popup, animated: true)
    }
    
}
