//
//  ViewController2.swift
//  spritTheBill
//
//  Created by 古田拳児 on 2018/04/13.
//  Copyright © 2018 Kenji Furuta. All rights reserved.
//

import UIKit

class Result: UIViewController {
    
    var resultText: String?
    @IBOutlet weak var splitTheBill: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitTheBill.text = self.resultText


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToTopPageButton(_ sender: Any) {
        guard let topPage = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TopPage") as? TopPage else {
            showAlert(message: "画面遷移できませんでした。復旧するまでお待ちください。")
            return
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(
            title: "エラー",
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { _ in
        }
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
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
