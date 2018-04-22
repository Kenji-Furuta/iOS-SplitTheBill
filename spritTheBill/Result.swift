//
//  ViewController2.swift
//  spritTheBill
//
//  Created by 古田拳児 on 2018/04/13.
//  Copyright © 2018 Kenji Furuta. All rights reserved.
//

import UIKit

class Result: UIViewController {
    
    var resultText: Double = 0.0
    var total: String?
    var numberOfPeople: Int?
    var sliderRateTax = 0.0
    var sliderRateTip = 0.0
    
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitTheBill: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBAction func sliderTax(_ sender: UISlider) {
        self.sliderRateTax = Double(round(sender.value * 200)) / 10
        taxLabel.text = String(self.sliderRateTax) + "%"
        if sliderRateTip != 0.0 {
            self.splitTheBill.text = String(ceil((resultText * Double((self.sliderRateTip + 100) / 100) * Double((self.sliderRateTax + 100) / 100)) * 100) / 100)
        } else {
            self.splitTheBill.text = String(ceil((resultText * Double((self.sliderRateTax + 100) / 100)) * 100) / 100)
        }
    }
    @IBAction func sliderTip(_ sender: UISlider) {
        self.sliderRateTip = Double(ceil(sender.value * 30))
        tipLabel.text = String(self.sliderRateTip) + "%"
        if sliderRateTax != 0.0 {
            self.splitTheBill.text = String(ceil((resultText * Double((self.sliderRateTip + 100) / 100) * Double((self.sliderRateTax + 100) / 100)) * 100) / 100)
        } else {
            self.splitTheBill.text = String(ceil((resultText * Double((self.sliderRateTip + 100) / 100)) * 100) / 100)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitTheBill.text = String(self.resultText)
        self.totalLabel.text = "合計金額：" + (self.total ?? "")
        self.numberOfPeopleLabel.text = String((self.numberOfPeople ?? 0)) + "人で割り勘"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToTopPageButton(_ sender: Any) {
//        guard let topPage = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TopPage") as? TopPage else {
//            showAlert(message: "画面遷移できませんでした。復旧するまでお待ちください。")
//            return
//        }
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
