//
//  ViewController.swift
//  CalcIt
//
//  Created by mobile apps on 2016-11-05.
//  Copyright © 2016 mobile apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNumber1: UITextField!
    @IBOutlet weak var tfNumber2: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblError: UILabel!
    
    func checkOperands(operand1: String, operand2: String) -> Bool {
        lblError.text = ""
        lblResult.text = ""
        return (Float(operand1) != nil) && (Float(operand2) != nil)
    }
    
    func showAlert(msg: String, title: String) {
        let alertController = UIAlertController(
            title: title,
            message: msg,
            preferredStyle: .Alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .Default) {
            (action: UIAlertAction!) in
                print("ok clicked")
        })
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func calculate(op: String) {
        let operand1 = tfNumber1.text!
        let operand2 = tfNumber2.text!

        if (checkOperands(operand1, operand2: operand2)) {
            
            let opNumber1 = Float(operand1)!
            let opNumber2 = Float(operand2)!

            var result = Float(0)
            
            switch (op) {
            case "+":
                result = opNumber1 + opNumber2
                lblError.text = "\(opNumber1) + \(opNumber2) ="
            case "-":
                result = opNumber1 - opNumber2
                lblError.text = "\(opNumber1) - \(opNumber2) ="
            case "*":
                result = opNumber1 * opNumber2
                lblError.text = "\(opNumber1) * \(opNumber2) ="
            case "/":
                if (opNumber2 != 0) {
                    result = opNumber1 / opNumber2
                    lblError.text = "\(opNumber1) / \(opNumber2) ="
                } else {
                    showAlert("Error in second operand, it must be no zero!", title: "Input error")
                }
            default:
                showAlert("Error in operator!", title: "Input error")
            }
            lblResult.text = String(result);
        } else {
            showAlert("Error in operands, they must be numbers", title: "Input error")
        }

    }
    
    @IBAction func PlusOperatorClick(sender: AnyObject) {
        calculate("+")

    }
    
    @IBAction func MinusOperatorClick(sender: AnyObject) {
        calculate("-")
    }

    @IBAction func MultiplyOperatorClick(sender: AnyObject) {
        calculate("*")
    }
    
    @IBAction func DevideOperatorClick(sender: AnyObject) {
        calculate("/")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

