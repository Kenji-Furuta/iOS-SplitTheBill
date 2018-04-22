//
//  ViewController0.swift
//  spritTheBill
//
//  Created by 古田拳児 on 2018/04/17.
//  Copyright © 2018 Kenji Furuta. All rights reserved.
//

import UIKit

class TopPage: UIViewController {
    
    @IBOutlet weak var isCondition: UISegmentedControl!
    
    
    
    @IBAction func start(_ sender: Any) {
        
        
        if (isCondition.selectedSegmentIndex == 0){
            guard let calculate = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Calculate") as? Calculate else {
            showAlert(message: "画面遷移できませんでした。復旧するまでお待ちください。")
            return
            }
            self.navigationController?.pushViewController(calculate, animated: true)
        } else if (isCondition.selectedSegmentIndex == 1){
            guard let calculateByConditions = UIStoryboard(name: "Main2", bundle: Bundle.main).instantiateViewController(withIdentifier: "CalculateByConditions") as? CalculateByConditions else {
                showAlert(message: "画面遷移できませんでした。復旧するまでお待ちください。")
                return
            }
            self.navigationController?.pushViewController(calculateByConditions, animated: true)
            //self.present(viewController3, animated: true, completion: nil)
        }
        
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
}
