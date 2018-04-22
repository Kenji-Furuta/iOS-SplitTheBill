//
//  ViewController3.swift
//  spritTheBill
//
//  Created by 古田拳児 on 2018/04/14.
//  Copyright © 2018 Kenji Furuta. All rights reserved.
//

import UIKit

class CalculateByConditions: UIViewController {
    
    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var labelRight: UILabel!
    @IBOutlet weak var textLeft: UITextField!
    @IBOutlet weak var textRight: UITextField!
    @IBOutlet weak var totalText: UITextField!
    var sliderValueA: Int = 50
    var sliderValueB: Int = 50
    
    @IBAction func slider(_ sender: UISlider) {
        sliderValueB = Int(round(sender.value * 100))
        sliderValueA = 100 - sliderValueA
        labelLeft.text = "A:" + String(sliderValueA) + "%"
        labelRight.text = "B:" + String(sliderValueB) + "%"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // show keyboard
        self.totalText.keyboardType = UIKeyboardType.decimalPad
        self.textLeft.keyboardType = UIKeyboardType.decimalPad
        self.textRight.keyboardType = UIKeyboardType.decimalPad
        // Do any additional setup after loading the view.
    }
    //keyboard以外の画面を押すと、keyboardを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.totalText.isFirstResponder){
            self.totalText.resignFirstResponder()
        }
        if (self.textLeft.isFirstResponder) {
            self.textLeft.resignFirstResponder()
        }
        if (self.textRight.isFirstResponder){
            self.textRight.resignFirstResponder()
        }
    }
    
    @IBAction func splitButton(_ sender: Any) {
        guard let resultByConditions = UIStoryboard(name: "Main2", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultByConditions") as? ResultByConditions else {
            showAlert(message: "画面遷移できませんでした。復旧するまでお待ちください。")
            return
        }
        if let totalNum = Double(self.totalText.text ?? ""), let textLeftNum = Double(self.textLeft.text ?? ""), let textRightNum = Double(self.textRight.text ?? ""){
            
            let a = totalNum * (Double(sliderValueA) / 100)
            let b = totalNum * (Double(sliderValueB) / 100)
            let resultA = ceil((a / textLeftNum ) * 100) / 100
            let resultB = ceil((b / textRightNum) * 100) / 100
            resultByConditions.textA = String(resultA)
            resultByConditions.textB = String(resultB)
            // push -> trsultByConditions
            self.navigationController?.pushViewController(resultByConditions, animated: true)
            
            
        } else {
            // nil -> errorMessage
            if let errorMessage = makeErrorMessage(totalText:(self.totalText.text),textLeft: (self.textLeft.text), textRight: (self.textRight.text)){
                showAlert(message: errorMessage)
            }
        }
//        // check nil
//        if self.totalText.text == "" || self.textLeft.text == "" || self.textRight.text == "" {
//            // nil -> errorMessage
//            if let errorMessage = makeErrorMessage(totalText:(self.totalText.text),textLeft: (self.textLeft.text), textRight: (self.textRight.text)){
//                showAlert(message: errorMessage)
//            }
//        } else {
//            // calculate split The Bill
//            if let totalNum = self.totalText.text, let textLeftNum = self.textLeft.text, let textRightNum = self.textRight.text{
//                let total = Double(totalNum)
//                let leftNum = Double(textLeftNum)
//                let rightNum = Double(textRightNum)
//                let a = (total ?? 0) * (Double(sliderValueA) / 100)
//                let b = (total ?? 0) * (Double(sliderValueB) / 100)
//                let resultA = Int(ceil((a / (leftNum ?? 0)) / 10) * 10)
//                let resultB = Int(ceil(Double((b / (rightNum ?? 0)) / 10)) * 10)
//                resultByConditions.textA = String(resultA)
//                resultByConditions.textB = String(resultB)
//                // push ->
//                self.navigationController?.pushViewController(resultByConditions, animated: true)
//            }
//
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // function check nil
    func makeErrorMessage(totalText: String?, textLeft: String?, textRight: String?) -> String? {
        var errMessage: String?
        if totalText == "" {
            errMessage = (errMessage ?? "") + "合計金額を入れてください\n"
        }
        if textLeft == "" {
            errMessage = (errMessage ?? "") +  "Aに人数を入れてください\n"
        }
        if textRight == "" {
            errMessage = (errMessage ?? "") +  "Bに人数を入れてください\n"
        }
        return errMessage
    }
    // function Alert
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
