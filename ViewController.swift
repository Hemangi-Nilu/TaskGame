//
//  ViewController.swift
//  Formdata
//
//  Created by Mac Mini on 18/08/21.
//

import UIKit
struct StateCity {
  //  var country:[String]
    var city:[String]
    var state:String
    
}
struct  StateCountry{
    var state:[StateCity]
    var country:String
}
class ViewController: UIViewController,UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate {
   
    var val = [StateCity]()
    var val2 = [StateCountry]()

    @IBOutlet var txtname: UITextField!
    @IBOutlet var txtemail: UITextField!
    
    @IBOutlet var txtpan: UITextField!
    
    @IBOutlet var txtnum: UITextField!
    
    @IBOutlet var txtbirthplace: UITextField!
    
    @IBOutlet var btnsave: UIButton!
    
    var  pickerview = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtname.delegate = self
        txtemail.delegate = self
        txtnum.delegate = self
        txtpan.delegate = self
        txtbirthplace.delegate = self
        
        pickerview.delegate = self
        pickerview.dataSource = self
        
        txtbirthplace.inputView = pickerview
        txtbirthplace.textAlignment = .center
        
        let numberToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        numberToolbar.barStyle = .default
        numberToolbar.items = [
        
        UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
        UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(didTapdone))]
        numberToolbar.sizeToFit()
        txtbirthplace.inputAccessoryView = numberToolbar
        val.append(StateCity(city: ["ahemedabad","rajkot"], state: "gujarat"))
        val.append(StateCity(city: ["avbd","vcdv","dgff"], state: "maharastra"))
        val.append(StateCity(city: ["sdf","fdg","hgh"], state: "up"))
        val2.append(StateCountry(state: val, country: "india"))
        
    }
    
    var isValidContact: Bool {
            let phoneNumberRegex = "^[6-9]\\d{9}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
            let isValidPhone = phoneTest.evaluate(with: self)
            return isValidPhone
        }
    
    @objc private func didTapdone(){
        txtbirthplace.resignFirstResponder()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     
        if component == 0{
            return val.count
        }
        else if component == 1 {
            let selectCountry = pickerView.selectedRow(inComponent: 0)
            return val2.count
        }

       else{
            let selectedstate = pickerView.selectedRow(inComponent: 0)
            let selectCountry = pickerView.selectedRow(inComponent: 1)
            return val2[selectCountry].state[selectedstate].city.count
        }
       }
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return val[row].state
        }
        else if component == 1 {
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return val2[row].country
        }
        else{
            let selectedstate = pickerView.selectedRow(inComponent: 0)
            let selectCountry = pickerView.selectedRow(inComponent: 1)
          
          return val2[selectCountry].state[selectedstate].city[row]
        }
}
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
      //  val2[selectCountry].state[selectedstate].city.count
       // txtbirthplace.text = 
        
       
        pickerView.reloadAllComponents()
        self.view.endEditing(true)
    }
    @IBAction func btnSav(_ sender: UIButton) {
        if txtname.text?.isEmpty ?? true {
            let alert = UIAlertController(title: "Alert", message: "name is empty", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               present(alert, animated: true, completion: nil)
           } else {
               print("textField has some text")
           }
        if((txtemail.text?.isValidEmail()) != nil){
            print("valid")
        }else{
            print("mot valid")
        }

        
        
        if txtpan.text?.isEmpty ?? true {
            let alert = UIAlertController(title: "Alert", message: "number is empty", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               present(alert, animated: true, completion: nil)
           } else {
               print("textField has some text")
           }
        
     
        if ((txtnum.text?.isValidContact) != nil){
            print("is valid")
        }else{
            print("not valid")
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        if textField == txtname {
            let maxLength = 10
            let currentString: NSString = txtname.text! as NSString
               let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            if !(newString.length <= maxLength)  {
                txtemail.becomeFirstResponder()
            }

               return newString.length <= maxLength
        }
        else{
            return true
        }

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtname.resignFirstResponder()
        txtemail.becomeFirstResponder()
        txtemail.resignFirstResponder()
        txtnum.becomeFirstResponder()
        txtnum.resignFirstResponder()
        txtpan.becomeFirstResponder()
        txtnum.resignFirstResponder()
        txtbirthplace.becomeFirstResponder()
        return true
    }
        
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtname.resignFirstResponder()
        txtemail.resignFirstResponder()
        txtnum.resignFirstResponder()
        txtpan.resignFirstResponder()
        pickerview.isHidden = true
        
        print("hide keyboard")
    }
}

extension String{
    var isValidContact: Bool {
            let phoneNumberRegex = "^[6-9]\\d{9}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
            let isValidPhone = phoneTest.evaluate(with: self)
            return isValidPhone
        }
    func isValidEmail() -> Bool {
          let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
          return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
      }
//    var isEmail: Bool {
//            do {
//                let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
//                return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
//            } catch {
//                return false
//            }
//        }
}

