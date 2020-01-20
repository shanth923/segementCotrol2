//
//  ViewController.swift
//  segementCotrol2
//
//  Created by R Shantha Kumar on 9/25/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var URLReqObject:URLRequest!
    var dataTaskObj:URLSessionDataTask!
    var componentData:[String:Any]!
    @IBOutlet weak var stpeerOutlet: UIStepper!
    @IBOutlet weak var offsegmentconrtol: UISegmentedControl!
    @IBOutlet weak var getdataoutlet: UIButton!
    @IBOutlet weak var labvelbuttonswitchoutlet: UISegmentedControl!
    @IBOutlet weak var uiview2: UIView!
    @IBOutlet weak var scroll2view: UIScrollView!
    
    
    @IBOutlet weak var getdatabtn: UIButton!
    @IBOutlet weak var textfields: UITextField!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var scrollview: UIScrollView!

    @IBOutlet weak var xandyaxis: UISegmentedControl!
    
    var count:UILabel!
    var label:UILabel!
    var button:UIButton!
    var switchlb:UISwitch!
    
    var labelServer:UILabel!
    var buttonSwerver:UIButton!
    var switchlbServer:UISwitch!
    var alphabetslbl:UILabel!
    
    var compnedata = [String:Any]()
    
    var alpha:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var i:Int = 0
    
 
    var allvalues = [UILabel(),UIButton(),UISwitch()]
    var allValuesFromServer = [UILabel(),UIButton(),UISwitch()]
  
    @IBAction func offonaction(_ sender: Any) {
        
        if(offsegmentconrtol.selectedSegmentIndex==0)
        {
            uiview2.isHidden = false
            getdataoutlet.isHidden = true
            scroll2view.isHidden = true
            stpeerOutlet.isHidden = true
           
        }else{
            
            uiview2.isHidden = true
            getdataoutlet.isHidden = false
            scroll2view.isHidden = false
            stpeerOutlet.isHidden = false
        
        }
        
        
        
    }
    
    @IBAction func getdatabutton(_ sender: UIButton) {
        
        
        
        
        for x in allValuesFromServer{
            
            x.removeFromSuperview()
        }
        componentData = getComponents()
        print(componentData)
        
        var Row:Int = 0
        var Column:Int = 0
        var value:Int = componentData["quantity"] as! Int
        var xposi = 20
        var yposi = 20
        
        if(componentData["maxPerRow"] != nil)
        {
            Row = componentData["maxPerRow"] as! Int
            
            Column = (componentData["quantity"] as! Int)%Row == 0 ? (componentData["quantity"] as! Int)/Row : Int((componentData["quantity"] as! Int)/Row) + 1
        }
        else
        {
            Column = componentData["maxPerColumn"] as! Int
            Row = (componentData["quantity"] as! Int)%Column == 0 ? (componentData["quantity"] as! Int)/Column : Int((componentData["quantity"] as! Int)/Column) + 1
        }
       
        
        for x in 1...value
        {
           
                    if(componentData["component"] as! String == "Label")
                    {
                        
                        labelServer = UILabel()
                        labelServer.frame = CGRect(x: xposi, y: yposi, width: 40, height: 30)
                        labelServer.backgroundColor = .orange
                        labelServer.textAlignment = .center
                        
                        if(componentData["displayNumbers"] as! Int == 1)
                        {
                            labelServer.text = "\(x)"
                            
                            
                        }else
                        {
                            if(i==26)
                            {
                                i = 0
                            }
                            
                            labelServer.text = "\(alpha[i])"
                            i += 1
                        }
                        
                        allValuesFromServer.append(labelServer)
                        scroll2view.addSubview(labelServer)
                        
                        
                    }
                    
                    
                    if(componentData["component"] as! String == "Button")
                    {
                        buttonSwerver = UIButton()
                        buttonSwerver.frame = CGRect(x: xposi, y: yposi, width: 60, height: 30)
                        buttonSwerver.backgroundColor = .orange
                        if(componentData["displayNumbers"] as! Int == 1)
                        {
                            buttonSwerver.setTitle("BT\(x)", for: UIControl.State.normal)
                        }else
                        {
                            if(i==26)
                            {
                                i = 0
                            }
                            
                            buttonSwerver.setTitle("\(alpha[i])", for: UIControl.State.normal)
                            i+=1
                        }
                        
                        allValuesFromServer.append(buttonSwerver)
                        scroll2view.addSubview(buttonSwerver)
                        
        
                    }
                    
                    
                    
                    
                    if(componentData["component"] as! String == "Switch")
                    {
                        switchlbServer = UISwitch()
                        switchlbServer.frame = CGRect(x: xposi, y: yposi, width: 40, height: 30)
                        switchlbServer.backgroundColor = .blue
                        allValuesFromServer.append(switchlbServer)
                        scroll2view.addSubview(switchlbServer)
                      
                        
                    }
            
            if(componentData["axis"] as! String == "Horizontal")
            {
                
                if(x%Column == 0)
                {
                    xposi = 20
                    yposi += 60
                }
                else
                {
                    xposi += 60
                }
            }
            else
            { //Vertical
                if(x%Row == 0)
                {
                    xposi += 60
                    yposi = 20
                }
                else{
                    yposi += 60
                }
                
                
                
            }
            
    
    }
    }
    
   
    
    
    
    @IBAction func stepperAction(_ sender: Any) {
        
         var value:Int = componentData["quantity"] as! Int
        
        for x in allValuesFromServer{
            
            x.removeFromSuperview()
        }
        
        var Row:Int = 0
        var Column:Int = 0
        
        if(componentData["maxPerRow"] != nil)
        {
            Row = componentData["maxPerRow"] as! Int
            
            Column = (componentData["quantity"] as! Int)%Row == 0 ? (componentData["quantity"] as! Int)/Row : Int((componentData["quantity"] as! Int)/Row) + 1
        }
        else
        {
            Column = componentData["maxPerColumn"] as! Int
            Row = (componentData["quantity"] as! Int)%Column == 0 ? (componentData["quantity"] as! Int)/Column : Int((componentData["quantity"] as! Int)/Column) + 1
        }
        var xposi = 20
        var yposi = 20
        var i = 0
        for x in 1...value+1
        {
            
            if(componentData["component"] as! String == "Label")
            {
                
                labelServer = UILabel()
                labelServer.frame = CGRect(x: xposi, y: yposi, width: 40, height: 30)
                labelServer.backgroundColor = .orange
                labelServer.textAlignment = .center
                
                if(componentData["displayNumbers"] as! Int == 1)
                {
                    labelServer.text = "\(x)"
                    
                    
                }else
                {
                    if(i==26)
                    {
                        i = 0
                    }
                    
                    labelServer.text = "\(alpha[i])"
                    i += 1
                }
                
                allValuesFromServer.append(labelServer)
                scroll2view.addSubview(labelServer)
                
                
            }
            
            
            if(componentData["component"] as! String == "Button")
            {
                buttonSwerver = UIButton()
                buttonSwerver.frame = CGRect(x: xposi, y: yposi, width: 60, height: 30)
                buttonSwerver.backgroundColor = .orange
                if(componentData["displayNumbers"] as! Int == 1)
                {
                    buttonSwerver.setTitle("BT\(x)", for: UIControl.State.normal)
                }else
                {
                    if(i==26)
                    {
                        i = 0
                    }
                    
                    buttonSwerver.setTitle("\(alpha[i])", for: UIControl.State.normal)
                    i+=1
                }
                
                allValuesFromServer.append(buttonSwerver)
                scroll2view.addSubview(buttonSwerver)
                
                
            }
            
            
            
            
            if(componentData["component"] as! String == "Switch")
            {
                switchlbServer = UISwitch()
                switchlbServer.frame = CGRect(x: xposi, y: yposi, width: 40, height: 30)
                switchlbServer.backgroundColor = .blue
                allValuesFromServer.append(switchlbServer)
                scroll2view.addSubview(switchlbServer)
                
                
            }
            
            if(componentData["axis"] as! String == "Horizontal")
            {
                
                if(x%Column == 0)
                {
                    xposi = 20
                    yposi += 60
                }
                else
                {
                    xposi += 60
                }
            }
            else
            { //Vertical
                if(x%Row == 0)
                {
                    xposi += 60
                    yposi = 20
                }
                else{
                    yposi += 60
                }
                
                
                
            }
            
            
        }
        
        if(stpeerOutlet == stepper){
            value = Int(stepper.value)
            
            slider.setValue(Float(stepper.value)+1, animated: true)
           count.text = "\(Int(slider.value))"
            
        }
    }
   
    @IBAction func createBTN(_ sender: Any) {
        for x in allvalues
        {
            x.removeFromSuperview()
            
        }
        
        
        let value = Int(slider.value)
        var ypos = 30
        var xpos = 30
        
        if(offsegmentconrtol.selectedSegmentIndex==0){
            
        
        for x in 0...value
        {
            if(xandyaxis.selectedSegmentIndex==0)
            {
                if(ypos>450)
                {
                    ypos = 30
                    xpos=xpos+50
                }
                ypos = ypos+50
            }
            else if(xandyaxis.selectedSegmentIndex==1){
                
                if(xpos>340)
                {
                    xpos = 30
                    ypos=ypos+34
                }
                xpos = xpos+40
            }
            
            if(labvelbuttonswitchoutlet.selectedSegmentIndex==0)
            {
                label = UILabel()
                label.frame = CGRect(x: xpos, y: ypos, width: 43, height: 20)
                label.backgroundColor = UIColor.orange
                allvalues.append(label)
                label.text = "\(x)"
                scrollview.addSubview(label)
            }
            
            
            if(labvelbuttonswitchoutlet.selectedSegmentIndex==1)
            {
                
                button = UIButton()
                button.frame = CGRect(x: xpos, y: ypos, width: 43, height: 20)
                button.backgroundColor = UIColor.orange
                allvalues.append(button)
                button.setTitle("\(x)", for: UIControl.State.normal)
                scrollview.addSubview(button)
            }
            
            
            
            if(labvelbuttonswitchoutlet.selectedSegmentIndex==2)
            {
                
                switchlb = UISwitch()
                switchlb.frame = CGRect(x: xpos, y: ypos, width: 43, height: 20)
                switchlb.backgroundColor = UIColor.orange
                allvalues.append(switchlb)
                scrollview.addSubview(switchlb)
            }
            
        }
    }
        
  
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
     print(UnicodeScalar(65))
        
        scrollview.contentSize = CGSize(width: 10000, height: 10000)
        scroll2view.contentSize = CGSize(width: 10000, height: 10000)
        
        methodUI()
        

    }
    
    
    
    
    func methodUI(){
        
        slider.addTarget(self, action: #selector(sliderEventHandler), for: UIControl.Event.valueChanged)
        slider.minimumValue = 0
        slider.maximumValue = 500
       uiview2.addSubview(slider)
        
        stepper.addTarget(self, action: #selector(stepperEventHandler), for: UIControl.Event.valueChanged)
        stepper.minimumValue = 0
        stepper .maximumValue = 500
        uiview2.addSubview(stepper)
        
    }
    
    //   eventhandlers
    
    @objc func sliderEventHandler()
    {
        textfields.text = String(Int(slider.value))
        stepper.value = Double(slider.value)
    }
    
    @objc func stepperEventHandler()
    {
        textfields.text = String(Int(stepper.value))
        slider.value = Float(stepper.value)
        
    }
    
    
    func getComponents()->[String:Any]{
        var convertedData:[String:Any]!
        
        
        
            URLReqObject = URLRequest(url:URL(string:"https:www.brninfotech.com/tws/ComponentCreation.php?")!)
            URLReqObject.httpMethod="GET"
            dataTaskObj = URLSession.shared.dataTask(with:URLReqObject,completionHandler:{(data, conncetionDetails,error) in
                print("got data from server")
                do{
                    convertedData = try
                    JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.allowFragments)as! [String:Any]
                }catch
                {
                    print("something went wrong")
                }
                
            })
            dataTaskObj.resume()
        while (convertedData==nil) {
            
        }
        return convertedData
        }
   
    }
    




