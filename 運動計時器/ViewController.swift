//
//  ViewController.swift
//  運動計時器
//
//  Created by 邱彥銘 on 2017/3/23.
//  Copyright © 2017年 ym. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pickObj: UIPickerView!
    var pickInfo:[String]=["死肥宅","熱身","低強度","高強度","超*強度"]
    var pickList:[String : Array<String>] =
        [
         "死肥宅":["不運動","打手槍"],"熱身":["幹嘛熱身","北七"],
         "低強度":["弱雞","瘦皮猴"],"高強度":["猛男","健美"],
         "超*強度":["超人","神"]
        ]
    var didChoice:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickObj.delegate = self
        pickObj.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startTimer(_ sender: UIButton) {
    }

    @IBAction func resetTimer(_ sender: UIButton) {
    }
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return didChoice==nil ? 1:2
    }
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
         return pickInfo.count
        }
        if let choice = didChoice {
            let pickL = pickList[choice];
            return pickL!.count
        }
      return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return pickInfo[row]
        }
        if let choice = didChoice {
          let pickL = pickList[choice]
            return pickL![row]
        }
        return nil
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component==0){
         didChoice = pickSelect(selection: row)
         pickerView.reloadAllComponents()
        }else {
            let dicContent = pickList[didChoice!]
            print(dicContent![row])
        }
    }
    func pickSelect(selection:Int)->String{
        return pickInfo[selection]
    }
}

