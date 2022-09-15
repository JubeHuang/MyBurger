//
//  ViewController.swift
//  MyBurger
//
//  Created by Jube on 2022/9/2.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var preMeatImage: UIImageView!
    @IBOutlet weak var nextMeatImage: UIImageView!
    @IBOutlet weak var currentMeatImage: UIImageView!
    @IBOutlet weak var preTopImage: UIImageView!
    @IBOutlet weak var nextTopImage: UIImageView!
    @IBOutlet weak var preSauceImage: UIImageView!
    @IBOutlet weak var nextSauceImage: UIImageView!
    @IBOutlet weak var currentSauceImage: UIImageView!
    @IBOutlet weak var currentTopImage: UIImageView!
    @IBOutlet weak var preVegeImage: UIImageView!
    @IBOutlet weak var nextVegeImage: UIImageView!
    @IBOutlet weak var currentVegeImage: UIImageView!
    @IBOutlet weak var currentBreadImage: UIImageView!
    @IBOutlet weak var nextBreadImage: UIImageView!
    @IBOutlet weak var preBreadImage: UIImageView!
    @IBOutlet weak var colorAdjustView: UIView!
    @IBOutlet weak var burgerAdjustView: UIView!
    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var sauceContainer: UIView!
    @IBOutlet weak var meatContainer: UIView!
    @IBOutlet weak var vegeContainer: UIView!
    @IBOutlet weak var breadContainer: UIView!
    @IBOutlet weak var breadMaskView: UIView!
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
    
    let breadLabels = ["普通麵包", "白麵包", "竹炭麵包", "透明麵包"]
    let vegeLabels = ["番茄", "培根", "醃黃瓜"]
    let topLabels = ["起士", "生菜", "洋蔥"]
    let meatLabels = ["牛肉排", "雞肉排", "太陽蛋"]
    let sauceLabels = ["番茄醬", "酸奶青蔥", "蜂蜜芥末"]
    let breadImageName = ["breadA", "breadB", "breadC", "breadD"]
    let vegeImageNames = ["vegeA", "vegeB", "vegeC"]
    let topImageNames = ["topA", "topB", "topC"]
    let meatImageNames = ["meatA", "meatB", "meatC"]
    let sauceImageNames = ["sauceA", "sauceB", "sauceC"]
    var index = 0
    class IngredientIndex{
        var breadIndex = 0
        var vegeIndex = 0
        var topIndex = 0
        var meatIndex = 0
        var sauce = 0
    }
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorAdjustView.isHidden = true
        makeGradientBg()
        let transparentBreadImageView = UIImageView(image: UIImage(named: "breadC"))
        transparentBreadImageView.frame = breadMaskView.bounds
        breadMaskView.mask = transparentBreadImageView
    }
    //  nextBtn
    @IBAction func nextBreatBtn(_ sender: Any) {
        index = (index +  1) % breadLabels.count
        breadLabel.text = breadLabels[index]
        scrollNextImage(index: index, arraySum: breadImageName.count, imageNames: breadImageName, preImageView: preBreadImage, currentImageView: currentBreadImage, nextImageView: nextBreadImage, container: breadContainer)
        }
    @IBAction func nextVegeBtn(_ sender: Any) {
        index = (index +  1) % vegeLabels.count
        vegeLabel.text = vegeLabels[index]
        scrollNextImage(index: index, arraySum: vegeImageNames.count, imageNames: vegeImageNames, preImageView: preVegeImage, currentImageView: currentVegeImage, nextImageView: nextVegeImage, container: vegeContainer)
    }
    @IBAction func nextTopBtn(_ sender: Any) {
        index = (index +  1) % topLabels.count
        topLabel.text = topLabels[index]
        scrollNextImage(index: index, arraySum: topImageNames.count, imageNames: topImageNames, preImageView: preTopImage, currentImageView: currentTopImage, nextImageView: nextTopImage, container: topContainer)
    }
    @IBAction func nextMeatBtn(_ sender: Any) {
        index = (index +  1) % meatLabels.count
        meatLabel.text = meatLabels[index]
        scrollNextImage(index: index, arraySum: meatImageNames.count, imageNames: meatImageNames, preImageView: preMeatImage, currentImageView: currentMeatImage, nextImageView: nextMeatImage, container: meatContainer)
    }
    @IBAction func nextSauceBtn(_ sender: Any) {
        index = (index +  1) % sauceLabels.count
        sauceLabel.text = sauceLabels[index]
        scrollNextImage(index: index, arraySum: sauceImageNames.count, imageNames: sauceImageNames, preImageView: preSauceImage, currentImageView: currentSauceImage, nextImageView: nextSauceImage, container: sauceContainer)
    }
    // preBtn
    @IBAction func preVegeBtn(_ sender: Any) {
        index = (index + vegeLabels.count - 1) % vegeLabels.count
        vegeLabel.text = vegeLabels[index]
        scrollPreImage(index: index, arraySum: vegeImageNames.count, imageNames: vegeImageNames, preImageView: preVegeImage, currentImageView: currentVegeImage, nextImageView: nextVegeImage, container: vegeContainer)
    }
    @IBAction func preBreadBtn(_ sender: Any) {
        index = (index + breadLabels.count - 1) % breadLabels.count
        breadLabel.text = breadLabels[index]
        scrollPreImage(index: index, arraySum: breadImageName.count, imageNames: breadImageName, preImageView: preBreadImage, currentImageView: currentBreadImage, nextImageView: nextBreadImage, container: breadContainer)
    }
    @IBAction func preTopBtn(_ sender: Any) {
        index = (index + topLabels.count - 1) % topLabels.count
        topLabel.text = topLabels[index]
        scrollPreImage(index: index, arraySum: topImageNames.count, imageNames: topImageNames, preImageView: preTopImage, currentImageView: currentTopImage, nextImageView: nextTopImage, container: topContainer)
    }
    @IBAction func preSauceBtn(_ sender: Any) {
        index = (index + sauceLabels.count - 1) % sauceLabels.count
        sauceLabel.text = sauceLabels[index]
        scrollPreImage(index: index, arraySum: sauceImageNames.count, imageNames: sauceImageNames, preImageView: preSauceImage, currentImageView: currentSauceImage, nextImageView: nextSauceImage, container: sauceContainer)
    }
    @IBAction func preMeatBtn(_ sender: Any) {
        index = (index + meatLabels.count - 1) % meatLabels.count
        meatLabel.text = meatLabels[index]
        scrollPreImage(index: index, arraySum: meatImageNames.count, imageNames: meatImageNames, preImageView: preMeatImage, currentImageView: currentMeatImage, nextImageView: nextMeatImage, container: meatContainer)
    }
    //亂數按鈕
    @IBAction func randomBtn(_ sender: Any) {
        let breadRandomNum = Int.random(in: 0...2)
        let vegeRandomNum = Int.random(in: 0...2)
        let topRandomNum = Int.random(in: 0...2)
        let meatRandomNum = Int.random(in: 0...2)
        let sauceRandomNum = Int.random(in: 0...2)
        breadLabel.text = breadLabels[breadRandomNum]
        scrollNextImage(index: breadRandomNum, arraySum: breadImageName.count, imageNames: breadImageName, preImageView: preBreadImage, currentImageView: currentBreadImage, nextImageView: nextBreadImage, container: breadContainer)
        vegeLabel.text = vegeLabels[vegeRandomNum]
        scrollPreImage(index: vegeRandomNum, arraySum: vegeImageNames.count, imageNames: vegeImageNames, preImageView: preVegeImage, currentImageView: currentVegeImage, nextImageView: nextVegeImage, container: vegeContainer)
        topLabel.text = topLabels[topRandomNum]
        scrollNextImage(index: topRandomNum, arraySum: topImageNames.count, imageNames: topImageNames, preImageView: preTopImage, currentImageView: currentTopImage, nextImageView: nextTopImage, container: topContainer)
        meatLabel.text = meatLabels[meatRandomNum]
        scrollPreImage(index: meatRandomNum, arraySum: meatImageNames.count, imageNames: meatImageNames, preImageView: preMeatImage, currentImageView: currentMeatImage, nextImageView: nextMeatImage, container: meatContainer)
        sauceLabel.text = sauceLabels[sauceRandomNum]
        scrollNextImage(index: sauceRandomNum, arraySum: sauceImageNames.count, imageNames: sauceImageNames, preImageView: preSauceImage, currentImageView: currentSauceImage, nextImageView: nextSauceImage, container: sauceContainer)
    }
    @IBAction func randomColor(_ sender: Any) {
        redSlider.setValue(.random(in: 0...1), animated: true)
        greenSlider.setValue(.random(in: 0...1), animated: true)
        blueSlider.setValue(.random(in: 0...1), animated: true)
        makeGradientBg()
        breadMaskView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
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
        breadMaskView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
    //滑動圖片function
    func scrollNextImage(index: Int, arraySum: Int, imageNames: [String], preImageView: UIImageView, currentImageView: UIImageView, nextImageView: UIImageView, container: UIView){
        let preIndex = (index + arraySum - 1) % arraySum
        let nextIndex = (index + 1) % arraySum
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
            container.frame.origin.x = -2 * 375
        } completion: { _ in
            container.frame.origin.x = -375
            preImageView.image = UIImage(named: imageNames[(preIndex)])
            currentImageView.image = UIImage(named: imageNames[index])
            nextImageView.image = UIImage(named: imageNames[nextIndex])
        }
    }
    
    func scrollPreImage(index: Int, arraySum: Int, imageNames: [String], preImageView: UIImageView, currentImageView: UIImageView, nextImageView: UIImageView, container: UIView){
        let preIndex = (index + arraySum - 1) % arraySum
        let nextIndex = (index + 1) % arraySum
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
            container.frame.origin.x = 0
        } completion: { _ in
            container.frame.origin.x = -375
            preImageView.image = UIImage(named: imageNames[(preIndex)])
            currentImageView.image = UIImage(named: imageNames[index])
            nextImageView.image = UIImage(named: imageNames[nextIndex])
        }
    }
    
//    func scrollBreadImage(index: Int){
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
//            self.breadContainer.frame.origin.x = CGFloat(-(index * 375))
//        }
//    }
//    func scrollTopImage(index: Int){
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
//            self.topContainer.frame.origin.x = CGFloat(-(index * 375))
//        }
//    }
//    func scrollMeatImage(index: Int){
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
//            self.meatContainer.frame.origin.x = CGFloat(-(index * 375))
//        }
//    }
//    func scrollVegeImage(index: Int){
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
//            self.vegeContainer.frame.origin.x = CGFloat(-(index * 375))
//        }
//    }
//    func scrollSauceImage(index: Int){
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0.1, options: .curveEaseIn) {
//            self.sauceContainer.frame.origin.x = CGFloat(-(index * 375))
//        }
//    }
    //背景加漸層
    func makeGradientBg(){
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 400)
        gradientLayer.colors = [CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value)), CGColor(red: CGFloat(redSlider.value / 3), green: CGFloat(greenSlider.value / 3), blue: CGFloat(blueSlider.value / 3), alpha: CGFloat(alphaSlider.value))]
        bgView.layer.insertSublayer(gradientLayer, at: 0)
    }
}

