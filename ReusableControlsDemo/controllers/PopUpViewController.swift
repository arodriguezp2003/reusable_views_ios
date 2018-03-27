//
//  PopUpViewController.swift
//  ReusableControlsDemo
//
//  Created by Alejandro  Rodriguez on 26-03-18.
//  Copyright © 2018 Alejandro  Rodriguez. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var xtitle: UILabel!
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var button: UIButton!
    
    var delegate : PopUpDelegate?
    
    var showDateTimer: Bool = false
    
    var onSave: ((_ date: String) -> ())?
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: picker.date)
    }
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: picker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.datePickerMode = .date
        if showDateTimer {
            picker.datePickerMode = .time
        }
    }

   
    @IBAction func click_saveDate(_ sender: Any) {
        NotificationCenter.default.post(name: .saveDateTime, object: self)
        
        if showDateTimer {
            onSave?(formattedTime)
            delegate?.popupValue(value: formattedTime)
        } else {
            onSave?(formattedDate)
            delegate?.popupValue(value: formattedDate)
        }
        
        dismiss(animated: true)
    }
    
}
