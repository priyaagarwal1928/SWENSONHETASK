//
//  ViewController.swift
//  Fibonacci
//
//  Created by Priya Agarwal on 03/01/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtfldInput: UITextField!

    var fibonacciArray = [1, 1]
    var mem = [Int: Int]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
    }
    
    //MARK:- IBACtionMethods -
    
    @IBAction func btnCheckResultUsingRecursion(_ sender: Any) {
        
        if txtfldInput.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            self.showAlertViewOnWindow(messageStr: "Enter value")

        }
        else
        {
            if let n = Int(txtfldInput.text ?? "")
            {
                let result = self.fibonacciRecursion(n: n)
                
                self.showAlertViewOnWindow(messageStr: "\(n)th fibonacci number is \(result)")

            }
            
        }
    }
    
    @IBAction func btnCheckResultUsingIteration(_ sender: Any) {
        
        if txtfldInput.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            self.showAlertViewOnWindow(messageStr: "Enter value")

        }
        else
        {
            if let n = Int(txtfldInput.text ?? "")
            {
                let result = self.fibonacciIteration(n:n)

                self.showAlertViewOnWindow(messageStr: "\(n)th fibonacci number is \(result)\n Fibonacci series : - \(fibonacciArray)")

            }
            
        }
    }
    
    
    // Using Iteration
    func fibonacciIteration (n: Int) -> Int {
                
        fibonacciArray = [1, 1]
        (2...n).forEach { i in
            
            self.fibonacciArray.append(self.fibonacciArray[i - 1] + self.fibonacciArray[i - 2])
        }
        return fibonacciArray.last ?? 0
        
    }


    // Using Recursion
    func fibonacciRecursion(n: Int) -> Int {
        guard n != 0, n != 1, n != 2 else { return n }
        return fibonacciRecursion(n: n - 2) + fibonacciRecursion(n: n - 1)
    }
}

extension ViewController
{
    func showAlertViewOnWindow(messageStr: String)
    {
        let alert = UIAlertController(title: "", message: messageStr, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alert.view.tintColor = UIColor.black
        self.present(alert, animated: true, completion: nil)
      
    }
}

