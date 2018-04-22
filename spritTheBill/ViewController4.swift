//
//  ViewController4.swift
//  spritTheBill
//
//  Created by 古田拳児 on 2018/04/20.
//  Copyright © 2018 Kenji Furuta. All rights reserved.
//

import UIKit

class ResultByConditions: UIViewController {
    var textA: String?
    var textB: String?
    @IBOutlet weak var textLeft: UITextField!
    @IBOutlet weak var textRight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.textLeft.text = self.textA
         self.textRight.text = self.textB
        
    }
    
    @IBAction func topPageButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
