//
//  AIOEditMemoViewController.swift
//  All-In-One
//
//  Created by Albin Berisha on 7/19/20.
//  Copyright © 2020 Albin Berisha. All rights reserved.
//

import UIKit

class AIOEditMemoViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var aioMemo: AIOMemo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        aioMemo = AIOMemo(title: titleTextField.text!, text: textField.text)
       
    }

}
