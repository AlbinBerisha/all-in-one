//
//  AIOBrowserViewController.swift
//  All-In-One
//
//  Created by Albin Berisha on 7/19/20.
//  Copyright © 2020 Albin Berisha. All rights reserved.
//

import UIKit

class AIOBrowserViewController: UIViewController {
    
    @IBOutlet weak var aioWebView: UIWebView!
    @IBOutlet weak var urlTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        aioWebView.loadRequest(URLRequest(url: URL(string: "https://www.google.com/")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadUrl() {
        if !((urlTextField.text?.isEmpty)!) {
            aioWebView.loadRequest(URLRequest(url: URL(string: urlTextField.text!)!))
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
