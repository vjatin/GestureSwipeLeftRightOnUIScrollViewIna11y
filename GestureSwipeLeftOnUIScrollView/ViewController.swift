//
//  ViewController.swift
//  GestureSwipeLeftOnUIScrollView
//
//  Created by Jatin K Vaishnav on 11/20/15.
//  Copyright © 2015 Jatin K Vaishnav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swipeView: UIScrollView!
    
    fileprivate var swipeleftAction: UIAccessibilityCustomAction!
    fileprivate var swiperightAction: UIAccessibilityCustomAction!
    
    let swipeleftRec = UISwipeGestureRecognizer()
    let swiperightRec = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        swipeleftRec.direction = .left
        swipeleftRec.addTarget(self, action: #selector(ViewController.swipedViewleft))
        swipeView.addGestureRecognizer(swipeleftRec)
        //swipeView.userInteractionEnabled = true
        swipeleftAction = UIAccessibilityCustomAction(name: "Swipe Left", target: self, selector: #selector(ViewController.swipeleftActionActivated))
        
        swiperightRec.direction = .right
        swiperightRec.addTarget(self, action: #selector(ViewController.swipedViewright))
        swipeView.addGestureRecognizer(swiperightRec)
        //swipeView.userInteractionEnabled = true test test
        swiperightAction = UIAccessibilityCustomAction(name: "Swipe Right", target: self, selector: #selector(ViewController.swiperightActionActivated))
        //accessibilityCustomActions = [swipeleftAction, swiperightAction]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipedViewright(){
        let swipeAlert = UIAlertController(title: "Swipe Right", message: "Your detailed checking balance consists of two 100$ each.", preferredStyle: UIAlertControllerStyle.alert)
        swipeAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(swipeAlert, animated: true, completion: nil)
    }
    
    func swipedViewleft(){
        let swipeAlert = UIAlertController(title: "Swipe Left", message: "Your summary balance is 600$", preferredStyle: UIAlertControllerStyle.alert)
        swipeAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(swipeAlert, animated: true, completion: nil)
    }
    
    @objc fileprivate func swipeleftActionActivated() -> Bool {
        swipedViewleft()
        return true
    }
    
    @objc fileprivate func swiperightActionActivated() -> Bool {
        swipedViewright()
        return true
    }
    
}

