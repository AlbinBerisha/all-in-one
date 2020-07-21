//
//  AIOMemoViewController.swift
//  All-In-One
//
//  Created by Albin Berisha on 7/19/20.
//  Copyright © 2020 Albin Berisha. All rights reserved.
//

import UIKit

class AIOMemoViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var memo = AIOMemo(title: "", text: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = memo?.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }

}
