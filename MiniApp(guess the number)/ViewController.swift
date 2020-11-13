//
//  ViewController.swift
//  MiniApp(guess the number)
//
//  Created by Сергей Голенко on 13.11.2020.
//  Copyright © 2020 Сергей Голенко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
  //Здесь будем вводить число
    @IBOutlet weak var enterNumberTextField: UITextField!
  
  //Cюда будет рандомно генерироваться загадонное число при запуске приложения и обновлятся при нажатии кнопки reset
    var  number : Int?
    
   //Кнопка reset
    @IBAction func resetButton(_ sender: Any) {
        number = Int.random(in:1..<100)
        enterNumberTextField.text?.removeAll()
        print(number)
    }
    
    
    @IBAction func guessButton(_ sender: UIButton) {
        showAllert()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number = Int.random(in:1..<100)
        print(number)
    }

    
    
//функция для обновления текста
    func gueesNumberTextWill() -> String{
        var message = ""
        
        if differentNumbers() == 0{
            message = "Ты угадал"
        } else  if differentNumbers() < 3 {
            message = "Ты почти угадал,разница в 2 единицы"
        } else if differentNumbers() < 6 {
            message = "Ты почти угадал,разница в 5 единиц"
        } else {
           message = "Далеко... Попробуй еще"
        }
        return message
    }
    
    //здесь высчитую разницу
    func differentNumbers() -> Int{
        var different = 0
        different = number! - Int(enterNumberTextField.text!)!
        return abs(different)
    }
    
    // создаю aller
    func showAllert(){
        let allert = UIAlertController(title: nil, message: gueesNumberTextWill(), preferredStyle: .alert)
        let allertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        allert.addAction(allertAction)
        self.present(allert, animated: true)
    }
    
    
    
    
}

