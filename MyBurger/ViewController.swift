//
//  ViewController.swift
//  MyBurger
//
//  Created by Jube on 2022/9/2.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorAdjustView: UIView!
    @IBOutlet weak var burgerAdjustView: UIView!
    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var sauceContainer: UIView!
    @IBOutlet weak var meatContainer: UIView!
    @IBOutlet weak var vegeContainer: UIView!
    @IBOutlet weak var breadContainer: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var sauceLabel: UILabel!
    @IBOutlet weak var meatLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var vegeLabel: UILabel!
    @IBOutlet weak var breadLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    let breadLabels = ["普通麵包", "白麵包", "竹炭麵包"]
    let vegeLabels = ["番茄", "培根", "醃黃瓜"]
    let topLabels = ["起士", "生菜", "洋蔥"]
    let meatLabels = ["牛肉排", "雞肉排", "太陽蛋"]
    let sauceLabels = ["番茄醬", "酸奶青蔥", "蜂蜜芥末"]
    var index = 0
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorAdjustView.isHidden = true
        makeGradientBg()
    }
    //  nextBtn
    @IBAction func nextBreatBtn(_ sender: Any) {
        index = (index +  1) % breadLabels.count
        breadLabel.text = breadLabels[index]
        scrollBreadImage(index: self.index)
        }
    @IBAction func nextVegeBtn(_ sender: Any) {
        index = (index +  1) % vegeLabels.count
        vegeLabel.text = vegeLabels[index]
        scrollVegeImage(index: self.index)
    }
    @IBAction func nextTopBtn(_ sender: Any) {
        index = (index +  1) % topLabels.count
        topLabel.text = topLabels[index]
        scrollTopImage(index: self.index)
    }
    @IBAction func nextMeatBtn(_ sender: Any) {
        index = (index +  1) % meatLabels.count
        meatLabel.text = meatLabels[index]
        scrollMeatImage(index: self.index)
    }
    @IBAction func nextSauceBtn(_ sender: Any) {
        index = (index +  1) % sauceLabels.count
        sauceLabel.text = sauceLabels[index]
        scrollSauceImage(index: self.index)
    }
    // preBtn
    @IBAction func preVegeBtn(_ sender: Any) {
        index = (index + vegeLabels.count - 1) % vegeLabels.count
        vegeLabel.text = vegeLabels[index]
        scrollVegeImage(index: self.index)
    }
    @IBAction func preBreadBtn(_ sender: Any) {
        index = (index + breadLabels.count - 1) % breadLabels.count
        breadLabel.text = breadLabels[index]
        scrollBreadImage(index: self.index)
    }
    @IBAction func preTopBtn(_ sender: Any) {
        index = (index + topLabels.count - 1) % topLabels.count
        topLabel.text = topLabels[index]
        scrollTopImage(index: self.index)
    }
    @IBAction func preSauceBtn(_ sender: Any) {
        index = (index + sauceLabels.count - 1) % sauceLabels.count
        sauceLabel.text = sauceLabels[index]
        scrollSauceImage(index: self.index)
    }
    @IBAction func preMeatBtn(_ sender: Any) {
        index = (index + meatLabels.count - 1) % meatLabels.count
        meatLabel.text = meatLabels[index]
        scrollMeatImage(index: self.index)
    }
    //亂數按鈕
    @IBAction func randomBtn(_ sender: Any) {
        let breadRandomNum = Int.random(in: 0...2)
        let vegeRandomNum = Int.random(in: 0...2)
        let topRandomNum = Int.random(in: 0...2)
        let meatRandomNum = Int.random(in: 0...2)
        let sauceRandomNum = Int.random(in: 0...2)
        breadLabel.text = breadLabels[breadRandomNum]
        scrollBreadImage(index: breadRandomNum)
        vegeLabel.text = vegeLabels[vegeRandomNum]
        scrollVegeImage(index: vegeRandomNum)
        topLabel.text = topLabels[topRandomNum]
        scrollTopImage(index: topRandomNum)
        meatLabel.text = meatLabels[meatRandomNum]
        scrollMeatImage(index: meatRandomNum)
        sauceLabel.text = sauceLabels[sauceRandomNum]
        scrollSauceImage(index: sauceRandomNum)
    }
    @IBAction func randomColor(_ sender: Any) {
        redSlider.setValue(.random(in: 0...1), animated: true)
        greenSlider.setValue(.random(in: 0...1), animated: true)
        blueSlider.setValue(.random(in: 0...1), animated: true)
        makeGradientBg()
    }
    
    //切換segmentedControl
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            colorAdjustView.isHidden = true
            burgerAdjustView.isHidden = false
        } else {
            colorAdjustView.isHidden = false
            burgerAdjustView.isHidden = true
        }
    }
    //color slider
    @IBAction func changeColorSlider(_ sender: UISlider) {
        makeGradientBg()
    }
    //滑動圖片function
    func scrollBreadImage(index: Int){
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
            self.breadContainer.frame.origin.x = CGFloat(-(index * 375))
        }
    }
    func scrollTopImage(index: Int){
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
            self.topContainer.frame.origin.x = CGFloat(-(index * 375))
        }
    }
    func scrollMeatImage(index: Int){
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
            self.meatContainer.frame.origin.x = CGFloat(-(index * 375))
        }
    }
    func scrollVegeImage(index: Int){
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
            self.vegeContainer.frame.origin.x = CGFloat(-(index * 375))
        }
    }
    func scrollSauceImage(index: Int){
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
            self.sauceContainer.frame.origin.x = CGFloat(-(index * 375))
        }
    }
    //背景加漸層
    func makeGradientBg(){
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 400)
        gradientLayer.colors = [CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value)), CGColor(red: CGFloat(redSlider.value / 2), green: CGFloat(greenSlider.value / 2), blue: CGFloat(blueSlider.value / 2), alpha: CGFloat(alphaSlider.value))]
        bgView.layer.insertSublayer(gradientLayer, at: 0)
    }
}

