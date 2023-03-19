//
//  ViewController.swift
//  changeColor2-App
//
//  Created by Calvin Lee on 2023/3/15.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var imageView: UIImageView!

    //Segmented Control: ramImageView&frameDesign
    @IBOutlet weak var designSegmentedControl: UISegmentedControl!
    
    //ramImageView color-change sliders
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    //frameDesign color-change sliders
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var borderSlider: UISlider!
    @IBOutlet weak var shadowSlider: UISlider!
    @IBOutlet weak var shadowView: UIView!
    
    //color value
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    //setting varible
    var imageRedValue: Float = 0/255
    var imageGreenValue: Float = 0/255
    var imageBlueValue: Float = 0/255
    var imageAlphaValue: Float = 1
    var frameRedValue: Float = 0
    var frameGreenValue: Float = 0
    var frameBlueValue: Float = 0
    var frameAlphaValue: Float = 1
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //設計調整icon有兩種方式
        //第一種如下使用系統內icon
        let flameIcon = UIImage(systemName: "flame.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 28))
        let boltIcon = UIImage(systemName: "bolt.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 28))
        let dropIcon = UIImage(systemName: "drop.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 28))
        radiusSlider.setThumbImage(flameIcon, for: .normal)
        borderSlider.setThumbImage(boltIcon, for: .normal)
        shadowSlider.setThumbImage(dropIcon, for: .normal)
        
        //方法二 將圖檔放置asset 並叫出（尺寸先調整好再丟到asset）
        redSlider.setThumbImage(UIImage(named: "spade"), for: .normal)
        greenSlider.setThumbImage(UIImage(named: "heart"), for: .normal)
        blueSlider.setThumbImage(UIImage(named: "diamond"), for: .normal)
        alphaSlider.setThumbImage(UIImage(named: "club"), for: .normal)
        
    }

    
    /*
     ----------------------------------
     ----------------------------------
     -------------Function類------------
     ----------------------------------
     ----------------------------------
     */
    
    // 顏色數值
    func valueDisplay(){
        redValueLabel.text = String(format: "%.0f", redSlider.value*255)
        greenValueLabel.text = String(format: "%.0f", greenSlider.value*255)
        blueValueLabel.text = String(format: "%.0f", blueSlider.value*255)
        alphaValueLabel.text = String(format: "%.2f", alphaSlider.value)
    }
    
    
    /*以下用不到因為有兩個segments 一個是UIColor 另一個是CGColor
     
    因為此改顏色func會重複使用 故單獨寫出 待IBAction需用實在call
    func changeColor(){
        imageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
     
    */
    
    // 因為有兩個segments 所以設定function來儲存以及設定變數
    //以下兩條func 用於更新數值 使每次調整slider時 跑一次這func就會更新
    func imageColorValueSave(){
        imageRedValue = redSlider.value
        imageGreenValue = greenSlider.value
        imageBlueValue = blueSlider.value
        imageAlphaValue = alphaSlider.value
    }
    
    func frameColorValueSave(){
        frameRedValue = redSlider.value
        frameGreenValue = greenSlider.value
        frameBlueValue = blueSlider.value
        frameAlphaValue = alphaSlider.value
    }

    //設定”顏色”變數
    func imageColorValueSet(){
        redSlider.setValue(imageRedValue, animated: false)
        greenSlider.setValue(imageGreenValue, animated: false)
        blueSlider.setValue(imageBlueValue, animated: false)
        alphaSlider.setValue(imageAlphaValue, animated: false)
    }
    
    //設定“邊框”變數
    func framgeColorValueSet(){
        redSlider.setValue(frameRedValue, animated: false)
        greenSlider.setValue(frameGreenValue, animated: false)
        blueSlider.setValue(frameBlueValue, animated: false)
        alphaSlider.setValue(frameAlphaValue, animated: false)
    }

    
    
    /*
     ----------------------------------
     ----------------------------------
     ---------IBAction Slider類--------
     ----------------------------------
     ----------------------------------
     */
    //因為有兩個seguements所以要設定IBAction來執行image的還是frame的資訊
    // Slider更動
    @IBAction func sliderChangeColor(_ sender: UISlider) {
        if designSegmentedControl.selectedSegmentIndex == 0{
            imageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            imageColorValueSave()
             } else if designSegmentedControl.selectedSegmentIndex == 1{
                 imageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
                 frameColorValueSave()
        }
        valueDisplay()
    }
    
    
    
    
    
    
    
    
    
    /*
     ----------------------------------
     ----------------------------------
     ---------IBAction BUTTON類--------
     ----------------------------------
     ----------------------------------
     */
    // RED Random Button
    @IBAction func randomRedButton(_ sender: UIButton) {
        if designSegmentedControl.selectedSegmentIndex == 0{
            redSlider.value = Float.random(in: 0...1)
            redValueLabel.text = String(format: "%.0f", redSlider.value*255)
            
            //注意這邊是UICOLOR
            imageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            imageColorValueSave()
            
        } else if designSegmentedControl.selectedSegmentIndex == 1{
            
            //注意這邊是CGColor
            imageView.layer.borderColor = CGColor(red: CGFloat.random(in: 0...1), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            frameColorValueSave()
        }
    }
    
    
    // Green Random Button
    @IBAction func randomGreenButton(_ sender: UIButton) {
        greenSlider.value = Float.random(in: 0...1)
        greenValueLabel.text = String(format: "%.0f", greenSlider.value*255)
        if designSegmentedControl.selectedSegmentIndex == 0{
            imageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat.random(in: 0...1), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            imageColorValueSave()
        } else if designSegmentedControl.selectedSegmentIndex == 1{
            imageView.layer.backgroundColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat.random(in: 0...1), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            frameColorValueSave()
        }
    }
    
    // Blue Random Button
    @IBAction func randomBlueButton(_ sender: UIButton) {
        blueSlider.value = Float.random(in: 0...1)
        blueValueLabel.text = String(format: "%.0f", blueSlider.value*255)
        if designSegmentedControl.selectedSegmentIndex == 0{
            imageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat.random(in: 0...1), alpha: CGFloat(alphaSlider.value))
            imageColorValueSave()
        } else if designSegmentedControl.selectedSegmentIndex == 1{
            imageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat.random(in: 0...1), alpha: CGFloat(alphaSlider.value))
            frameColorValueSave()
        }
        
    }
    
    
    // Alpha Random Button
    @IBAction func randomAlphaButton(_ sender: UIButton) {
        alphaSlider.value = Float.random(in: 0.1...1)
        alphaValueLabel.text = String(format: "%.2f", alphaSlider.value)
        if designSegmentedControl.selectedSegmentIndex == 0{
            imageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat.random(in: 0.1...1))
            imageColorValueSave()
        } else if designSegmentedControl.selectedSegmentIndex == 1{
            imageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat.random(in: 0.1...1))
            frameColorValueSave()
        }
    }
    
    
    
    
    
    
    
    
    //全部隨機BUTTON
    @IBAction func randomButton(_ sender: UIButton) {
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0...1)
        
        if designSegmentedControl.selectedSegmentIndex == 0{
            imageView.backgroundColor =
            UIColor(red: CGFloat(redSlider.value),
                    green: CGFloat(greenSlider.value),
                    blue: CGFloat(blueSlider.value),
                    alpha: CGFloat(alphaSlider.value))
            //這邊的random不明白
            imageColorValueSave()
            
        } else if designSegmentedControl.selectedSegmentIndex == 1{
            imageView.layer.borderColor =
            CGColor(red: CGFloat(redSlider.value),
                    green: CGFloat(greenSlider.value),
                    blue: CGFloat(blueSlider.value),
                    alpha: CGFloat(alphaSlider.value))
            frameColorValueSave()
        }
        valueDisplay()
    }
    
    
    //龜0膏 BUTTON
    @IBAction func resetButton(_ sender: UIButton) {
        if designSegmentedControl.selectedSegmentIndex == 0{
            imageRedValue = 0
            imageGreenValue = 0
            imageBlueValue = 0
            imageAlphaValue = 0
            imageColorValueSet()
            imageView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0)
            imageColorValueSave()
            
        } else if designSegmentedControl.selectedSegmentIndex == 1{
            frameRedValue = 0
            frameGreenValue = 0
            frameBlueValue = 0
            frameAlphaValue = 0
            framgeColorValueSet()
            imageView.layer.borderColor = UIColor.red.cgColor
            frameColorValueSave()
        }
        
        valueDisplay()
    }
    
    
    
    /*
     ----------------------------------
     ----------------------------------
     --------IBAction Segmented類-------
     ----------------------------------
     ----------------------------------
     */
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        if designSegmentedControl.selectedSegmentIndex == 0{
            imageView.backgroundColor = UIColor(red: CGFloat(imageRedValue), green: CGFloat(imageGreenValue), blue: CGFloat(imageBlueValue), alpha: CGFloat(imageAlphaValue))
            imageColorValueSet()
        } else if designSegmentedControl.selectedSegmentIndex == 1{
            imageView.layer.borderColor = CGColor(red: CGFloat(frameRedValue), green: CGFloat(frameGreenValue), blue: CGFloat(frameBlueValue), alpha: CGFloat(frameAlphaValue))
            framgeColorValueSet()
        }
        valueDisplay()
    }
    
    /*
     ----------------------------------
     ----------------------------------
     -----------Frame Design類----------
     ----------------------------------
     ----------------------------------
     */
    
    
    
    @IBAction func radiusSlider(_ sender: UISlider) {
        imageView.layer.cornerRadius = CGFloat(radiusSlider.value)
        shadowView.layer.cornerRadius = CGFloat(radiusSlider.value)
    }
    
    @IBAction func borderSlider(_ sender: UISlider) {
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = CGFloat(borderSlider.value)
    }
    
    @IBAction func shadowSlider(_ sender: UISlider) {
        shadowView.layer.shadowRadius = CGFloat(shadowSlider.value)

    }
    

    @IBAction func radiusSwitch(_ sender: UISwitch) {
        if sender.isOn{
            radiusSlider.isHidden = false
            imageView.layer.cornerRadius = CGFloat(radiusSlider.value)
            shadowView.layer.cornerRadius = CGFloat(radiusSlider.value)
        }else{
            radiusSlider.isHidden = true
            imageView.layer.cornerRadius = 0
            
        }
    }
    
    @IBAction func borderSwitch(_ sender: UISwitch) {
        if sender.isOn{
            borderSlider.isHidden = false
            imageView.layer.borderColor = CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        }else{
            borderSlider.isHidden = true
            imageView.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    
    @IBAction func shadowSwitch(_ sender: UISwitch) {
        if sender.isOn{
            shadowSlider.isHidden = false
            shadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
            shadowView.layer.shadowColor = UIColor.darkGray.cgColor
            shadowView.layer.shadowOpacity = 1
        }else{
            shadowSlider.isHidden = true
            shadowView.layer.shadowOpacity = 0
        }
    }
    
}

