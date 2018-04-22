//
//  ViewController.swift
//  spritTheBill
//
//  Created by 古田拳児 on 2018/04/13.
//  Copyright © 2018 Kenji Furuta. All rights reserved.
//

import UIKit

class Calculate: UIViewController, UITextViewDelegate {
    
    // UITextField total
    @IBOutlet weak var total: UITextField!
    // UITextField Number of people
    @IBOutlet weak var numberOfPeople: UITextField!
    // result
    var splitTheBill: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.total.keyboardType = UIKeyboardType.decimalPad
        self.numberOfPeople.keyboardType = UIKeyboardType.decimalPad
    }
    
   
    //keyboard以外の画面を押すと、keyboardを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.total.isFirstResponder) {
            self.total.resignFirstResponder()
        }
        if (self.numberOfPeople.isFirstResponder){
            self.numberOfPeople.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetButton(_ sender: Any) {
        self.total.text = ""
        self.numberOfPeople.text = ""
    }
    // action button
    @IBAction func tapCalcButton(_ sender: Any) {
        //        guard let viewController2 = self.storyboard?.instantiateViewController(withIdentifier: "Result") as? Result else {
        //                showAlert(message: "画面遷移できませんでした。復旧するまでお待ちください。")
        //                return
        //            }
        guard let result = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Result") as? Result else {
            showAlert(message: "画面遷移できませんでした。復旧するまでお待ちください。")
            return
        }
        if let totalNum = Double(self.total.text ?? ""),let numberOfPeopleNum = Double(self.numberOfPeople.text ?? "") {
            if (numberOfPeopleNum < 2){
                showAlert(message: "人数は２人以上入力してください")
                return
            }
            // split
            splitTheBill = totalNum / numberOfPeopleNum
            // ceil splitTheBill
            let resultNum = ceil(splitTheBill * 100) / 100
            result.resultText = resultNum
            result.total = String(totalNum)
            result.numberOfPeople = Int(numberOfPeopleNum)
            //        self.present(result, animated: true, completion: nil)
            self.navigationController?.pushViewController(result, animated: true)
        } else {
            if let errorMessage = makeErrorMessage(
                total: Double(self.total.text ?? ""),
                numberOfPeople: Double(self.numberOfPeople.text ?? "")) {
                    showAlert(message: errorMessage)
            }
        }
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
    
    func makeErrorMessage(total: Double?, numberOfPeople: Double?) -> String? {
        if total == nil && numberOfPeople == nil {
           return "合計金額が入力されていません。\n 人数が入力されていません。"
        } else if total == nil {
            return "合計金額が入力されていません。"
        } else if numberOfPeople == nil {
            return "人数が入力されていません。"
        }
        return nil
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        total.resignFirstResponder()
        return true
    }
}
//        if let splitTheBill = splitTheBill {
//            newVC.resultText = String(splitTheBill)
//        } else {
//            let alertController = UIAlertController(
//                title: "エラー",
//                message: "割り勘できませんでした",
//                preferredStyle: UIAlertControllerStyle.alert
//            )
//            let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { _ in
//
//            }
//            alertController.addAction(alertAction)
//            self.present(alertController, animated: true)
//        }
