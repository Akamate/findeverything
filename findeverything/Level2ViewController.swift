//
//  Level2ViewController.swift
//  findeverything
//
//  Created by Aukmate  Chayapiwat on 10/3/2563 BE.
//  Copyright © 2563 Aukmate  Chayapiwat. All rights reserved.
//

import UIKit

class Level2ViewController: UIViewController {
       @IBOutlet weak var image1: UIImageView!
       @IBOutlet weak var image2: UIImageView!
       @IBOutlet weak var image3: UIImageView!
       @IBOutlet weak var image4: UIImageView!
       @IBOutlet weak var image5: UIImageView!
       @IBOutlet weak var level2ImageView: UIImageView!
       @IBOutlet weak var point: UILabel!
       @IBOutlet weak var time: UILabel!
       @IBOutlet weak var item1button: UIButton!
       @IBOutlet weak var item5: UIButton!
       @IBOutlet weak var item4: UIButton!
       @IBOutlet weak var item3: UIButton!
       @IBOutlet weak var item2: UIButton!
        var images : [UIImageView] = []
        var itemButton : [UIButton] = []
        var tabCount = 0
        var previousPoint = 0
        var currentPoints = 10 {
            didSet {
                point.text = "Points \(currentPoints)"
            }
        }
        
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
            currentPoints = previousPoint
            images.append(image1)
            images.append(image2)
            images.append(image3)
            images.append(image4)
            images.append(image5)
            itemButton.append(item1button)
            itemButton.append(item2)
            itemButton.append(item3)
            itemButton.append(item4)
            itemButton.append(item5)
            currentTime = 90
            setTimeLabel()
            let tab1 = UITapGestureRecognizer(target: self, action: #selector(tabOnImage))
            level2ImageView.addGestureRecognizer(tab1)
        }
        
        @objc func tabOnImage(){
            tabCount += 1
            if(tabCount == 2){
                let alert = UIAlertController(title: "Try Again", message: "", preferredStyle: .alert)
                               alert.addAction(UIAlertAction(title: "Next Level", style: .default, handler: { (_) in
                                self.newGame()
                               }))
                               timer?.invalidate()
                               present(alert, animated: true)
            }
        }
        
        func setTimeLabel() {
            time.text = "Time 99"
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
            images[0].layer.opacity = 0.25
            sender.layer.borderWidth = 2
            sender.layer.borderColor = UIColor.white.cgColor
        }
        
        
        @IBAction func Item2(_ sender: UIButton) {
            items[1] = true
            images[1].layer.opacity = 0.25
            sender.layer.borderWidth = 2
            sender.layer.borderColor = UIColor.white.cgColor
        }
        
        @IBAction func Item3(_ sender: UIButton) {
            items[2] = true
            images[2].layer.opacity = 0.25
            sender.layer.borderWidth = 2
            sender.layer.borderColor = UIColor.white.cgColor
        }
        
        @IBAction func Item4(_ sender: UIButton) {
            items[3] = true
            images[3].layer.opacity = 0.25
            sender.layer.borderWidth = 2
            sender.layer.borderColor = UIColor.white.cgColor
        }
        
        @IBAction func Item5(_ sender: UIButton) {
            items[4] = true
            images[4].layer.opacity = 0.25
            sender.layer.borderWidth = 2
            sender.layer.borderColor = UIColor.white.cgColor
        }
        
        @IBAction func imageButton(_ sender: Any) {
            tabCount += 1
            if(tabCount == 2){
                let alert = UIAlertController(title: "Try Again", message: "", preferredStyle: .alert)
                               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                                self.newGame()
                               }))
                               timer?.invalidate()
                               present(alert, animated: true)
            }
        }

        @IBAction func findItems(_ sender: Any) {
            if(currentPoints >= 3){
                currentPoints -= 3
                let randomArray = items.indexes(of: false)
                print(randomArray)
                let number = Int.random(in: 0 ..< randomArray.count)
                items[randomArray[number]]=true
                images[randomArray[number]].layer.opacity=0.25
                itemButton[randomArray[number]].layer.borderWidth = 2
                itemButton[randomArray[number]].layer.borderColor = UIColor.white.cgColor
            }
            else {
                let alert = UIAlertController(title: "Not Enough Points", message: "", preferredStyle: .alert)
                                          alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (_) in
                                              print("points")
                                          }))
                                         
                                          present(alert, animated: true)
            }
            
        }
        
        func newGame() {
            for n in 0...4 {
                items[n]=false
                images[n].layer.opacity=1
                itemButton[n].layer.opacity = 1
                itemButton[n].layer.borderWidth = 0
            }
            
            timer?.invalidate()
            setTimeLabel()
            currentPoints = 10
            tabCount = 0
        }
}
