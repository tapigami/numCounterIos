//
//  ViewController.swift
//  numCounterIos
//
//  Created by 西上 良祐 on 2018/09/04.
//  Copyright © 2018年 tapigami. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    var textField: UITextField!
    var titleText = ""
    var button : UIButton!
    var currentAction: Action?
    private var realm: Realm!
    
 //   override func awakeFromNib() {
   //     super.awakeFromNib()
        
        // RealmのTodoリストを取得し，更新を監視
     //   realm = try! Realm()
       // let act = realm.objects(Act.self)
//        titleText = act[0].title
  //  }

    override func viewDidLoad() {
        super.viewDidLoad()

        realm = try! Realm()
        currentAction = realm.objects(Action.self).last
        
        view.backgroundColor = .blue
        textField = UITextField()
        textField.frame = CGRect(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 - 15, width: 200, height: 30)
        textField.borderStyle = .roundedRect
        textField.delegate = self
        textField.returnKeyType = .done
        textField.placeholder = "hogeho"
        
        view.addSubview(textField)
        button = UIButton()
        
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.addTarget(self, action: #selector(hoge(sender: )), for: .touchUpInside)
        // buttonにイベントを追加
        
        
        button.setTitle("Tap me", for: .normal)
        self.view.addSubview(button)

        if currentAction != nil {
            let label = UILabel()
            label.backgroundColor = .orange
            label.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
            label.text = "\(currentAction!.title): \(currentAction!.commit)"
            label.textColor = .white
            self.view.addSubview(label)
            
            let commitButton = UIButton()
            
            commitButton.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
            commitButton.addTarget(self, action: #selector(commit(sender: )), for: .touchUpInside)
            commitButton.setTitle("commmit", for: .normal)
            self.view.addSubview(commitButton)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func hoge(sender:UIButton) {
        realm = try! Realm()
        try! realm.write {
                realm.add(Action(value: ["title": titleText]))
        }
        viewDidLoad()
    }
    @objc func commit(sender: UIButton) {
        realm = try! Realm()
        try! realm.write {
          currentAction!.commit = currentAction!.commit + 1
        }
        viewDidLoad()
        
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        titleText = textField.text!
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
