//
//  ViewController.swift
//  findeverything
//
//  Created by Aukmate  Chayapiwat on 26/2/2563 BE.
//  Copyright © 2563 Aukmate  Chayapiwat. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var level1ImageView: UIImageView!
    @IBOutlet weak var leveLabel: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var item1button: UIButton!
    var tabCount = 0
    var items = [false,false,false,false,false] {
        didSet {
            if(items.filter{!$0}.isEmpty){
                let alert = UIAlertController(title: "Mission Complete", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Next Level", style: .default, handler: { (_) in
                    print("Win")
                }))
                timer?.invalidate()
                present(alert, animated: true)
            }
        }
    }
    
    var timer : Timer?
    var currentTime = 90
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTime = 90
        setTimeLabel()
        let tab1 = UITapGestureRecognizer(target: self, action: #selector(tabOnImage))
        level1ImageView.addGestureRecognizer(tab1)
    }
    
    @objc func tabOnImage(){
        tabCount += 1
        if(tabCount == 2){
            let alert = UIAlertController(title: "Try Again", message: "", preferredStyle: .alert)
                           alert.addAction(UIAlertAction(title: "Next Level", style: .default, handler: { (_) in
                               print("lose")
                           }))
                           timer?.invalidate()
                           present(alert, animated: true)
        }
    }
    
    func setTimeLabel() {
        time.text = "Time 1:30"
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if(self.currentTime != 0){
                self.currentTime -= 1
                self.time.text = "Time \(self.currentTime)"
            }
            else {
                timer.invalidate()
            }
        })
    }
    
    @IBAction func Item1(_ sender: UIButton) {
        items[0] = true
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.white.cgColor
    }
    
    
    @IBAction func Item2(_ sender: UIButton) {
        items[1] = true
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func Item3(_ sender: UIButton) {
        items[2] = true
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func Item4(_ sender: UIButton) {
        items[3] = true
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func Item5(_ sender: UIButton) {
        items[4] = true
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func imageButton(_ sender: Any) {
        tabCount += 1
        if(tabCount == 2){
            let alert = UIAlertController(title: "Try Again", message: "", preferredStyle: .alert)
                           alert.addAction(UIAlertAction(title: "Next Level", style: .default, handler: { (_) in
                               print("lose")
                           }))
                           timer?.invalidate()
                           present(alert, animated: true)
        }
    }
}

