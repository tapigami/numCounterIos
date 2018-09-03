//
//  ViewController.swift
//  numCounterIos
//
//  Created by 西上 良祐 on 2018/09/04.
//  Copyright © 2018年 tapigami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var textField: UITextField!
    var titleText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .blue
        textField = UITextField()
        //textfieldの位置とサイズを設定
        textField.frame = CGRect(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 - 15, width: 200, height: 30)
        //アウトラインを表示
        textField.borderStyle = .roundedRect
        textField.delegate = self
        //改行ボタンを完了ボタンに変更
        textField.returnKeyType = .done

        //文字が何も入力されていない時に表示される文字(薄っすら見える文字)
        textField.placeholder = "hogeho"

        view.addSubview(textField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        titleText = textField.text!
        print(titleText)
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField){
//        textField.text = titleText
    }
}
