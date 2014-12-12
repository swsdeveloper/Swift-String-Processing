//
//  ViewController.swift
//  homework class 2
//
//  Created by Steven Shatz on 7/17/14.
//  Copyright (c) 2014 Steven Shatz. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("In ViewController - viewDidLoad\n")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        println("In ViewController - didReceiveMemoryWarning\n")
    }
    
    @IBOutlet weak var results: UITextView!
    var textout: String = ""
    var texthold: String = ""
    
    // --- 1. Average of 3 numbers ---
    @IBOutlet var Num1: UITextField!
    @IBOutlet var Num2: UITextField!
    @IBOutlet var Num3: UITextField!
    
    @IBAction func Average(sender: AnyObject) {
        var s1: String = Num1.text
        var s2: String = Num2.text
        var s3: String = Num3.text
        
        if (s1.toInt() != nil) && (s2.toInt() != nil) && (s3.toInt() != nil) {
            var n1 = s1.toInt()
            var n2 = s2.toInt()
            var n3 = s3.toInt()
            
            var d1 = Double(n1!)
            var d2 = Double(n2!)
            var d3 = Double(n3!)
            
            textout = "Average: \((d1+d2+d3)/3.0)\n\n"
            print(textout)
            results.text = textout + results.text
            
        }
        else {
            textout = "Average: Invalid Data - Enter Integers Only (no Decimals, no Blanks, Max 2,147,483,647 / -2,147,483,648)\n\n"
            print(textout)
            results.text = textout + results.text
        }
    }
    
    // --- 2. String operations ---
    @IBOutlet var word1: UITextField!
    @IBOutlet var word2: UITextField!
    
    @IBAction func concatenate(sender: AnyObject) {
        var s1 = word1.text
        var s2 = word2.text
        
        if s1.isEmpty || s2.isEmpty {
            textout = "Concatenate: '" + s1 + s2 + "'\n\n"    // If 1 or both args are missing, omit interim space
            print(textout)
            results.text = textout + results.text
        }
        else {
            textout = "Concatenate: '" + s1 + " " + s2 + "'\n\n"
            print(textout)
            results.text = textout + results.text
        }
    }
    
    @IBAction func length(sender: AnyObject) {
        var s1 = word1.text
        var s2 = word2.text
        var len = 0
        
        if s1.isEmpty || s2.isEmpty {
            len = countElements(s1 + s2)  // If 1 or both args are missing, omit interim space
        }
        else {
            len = countElements(s1 + " " + s2)
        }
        
        textout = "Length of concatenated string: \(len)\n\n"
        print(textout)
        results.text = textout + results.text
    }
    
    
    // --- 3. Functions to compare words ---
    @IBOutlet var compareWord1: UITextField!
    @IBOutlet var compareWord2: UITextField!
    
    @IBAction func compareWords(sender: AnyObject) { //Case-sensitive
        var s1 = compareWord1.text
        var s2 = compareWord2.text
        
        if s1 == s2 {
            textout = "Case matters: True - '\(s1)' is identical to '\(s2)'\n\n"
            print(textout)
            results.text = textout + results.text
        }
        else {
            textout = "Case matters: False - '\(s1)' is NOT identical to '\(s2)'\n\n"
            print(textout)
            results.text = textout + results.text
        }
    }
    
    @IBAction func compareCaseInsensitive(sender: AnyObject) {
        var s1 = compareWord1.text
        var s2 = compareWord2.text
        
        var lcs1 = s1.lowercaseString
        var lcs2 = s2.lowercaseString
        
        if lcs1 == lcs2 {
            textout = "Ignoring case: True - '\(s1)' is the same word as '\(s2)'\n\n"
            print(textout)
            results.text = textout + results.text
        }
        else {
            textout = "Ignoring case: False - '\(s1)' is NOT the same word as '\(s2)'\n\n"
            print(textout)
            results.text = textout + results.text
        }
    }
    
    
    // --- 4. Loops ---
    @IBOutlet var loopFrom: UITextField!
    @IBOutlet var loopTo: UITextField!
    @IBOutlet var loopStep: UITextField!
    
    @IBAction func count(sender: AnyObject) {
        var s1: String = loopFrom.text
        var s2: String = loopTo.text
        var s3: String = loopStep.text
        
        if (s1.toInt() != nil) && (s2.toInt() != nil) && (s3.toInt() != nil) { //Convert string variables holding numbers to numeric variables (i.e., integers)
            var from = s1.toInt()!
            var to = s2.toInt()!
            var step = s3.toInt()!
            
            if (step == 0) || (from <= to && step < 1) || (from > to && step > 0) {
                texthold = "Count: Invalid Step - If used, count would never end\n\n"
            } else {
                texthold = "Counting from \(from) to \(to) by \(step):\n"
                myCount(from, to:to, step:step, texthold:&texthold)
                texthold = texthold + "End of count\n\n"
            }
        } else {
            texthold = "Count: Invalid Data - Enter Integers Only (no Decimals, no Blanks, Max 2,147,483,647 / -2,147,483,648)\n\n"
        }
        
        println(texthold)
        results.text = texthold + results.text
    }
    
    func myCount(from: Int, to: Int, step: Int, inout texthold: String) {
        var textNum: String
        if from > to {
            for var i = from; i >= to; i = i + step {
                textNum = "  \(i)\n"
                texthold = texthold + textNum
            }
        } else {
            for var i = from; i <= to; i = i + step {
                textNum = "  \(i)\n"
                texthold = texthold + textNum
            }
        }
    }

    
    // --- 5. Find a substring ---
    @IBOutlet var text: UITextView!
    @IBOutlet var wordOrWords: UITextField!
    
    @IBAction func find(sender: AnyObject) {
        var s1 = text.text!
        var s2 = wordOrWords.text!
        
        var ns1 = s1 as NSString
        
        var result: Bool!
        if ns1.respondsToSelector(Selector("containsString:")) {                // Note: Since containsString expects a passed parm, selector must end with :
            result = findNew(ns1, searchArg: s2, options: "caseSensitive")
        } else {
            result = findOld(ns1, searchArg: s2, options: nil)
        }
        
        if result == true {
            textout = "Case matters ... FOUND exact match for '\(s2)' in '\(s1)'\n\n"
            print(textout)
            results.text = textout + results.text
        }
        else {
            textout = "Case matters ... did NOT find exact match for '\(s2)' in '\(s1)'\n\n"
            print(textout)
            results.text = textout + results.text
        }
    }
    
    
    @IBAction func caseInsensitiveFind(sender: AnyObject) {
        var s1: String = text.text!
        var s2: String = wordOrWords.text!
        
        var ns1 = s1 as NSString
        
        var result: Bool!
        if ns1.respondsToSelector(Selector("localizedCaseInsensitiveContainsString:")) {        // Note: (same as containsString above - must include : in Selector)
            result = findNew(ns1, searchArg: s2, options: "caseInsensitive")
        } else {
            result = findOld(ns1, searchArg: s2, options: NSStringCompareOptions.CaseInsensitiveSearch)
        }
        
        if result == true {
            textout = "Ignoring case ... FOUND the word '\(s2)' in '\(s1)'\n\n"
            print(textout)
            results.text = textout + results.text
        }
        else {
            textout = "Ignoring case ... did NOT find the word '\(s2)' in '\(s1)'\n\n"
            print(textout)
            results.text = textout + results.text
        }

    }

    func findOld(text: NSString, searchArg: String, options: NSStringCompareOptions?) -> Bool {
        println("In findOld\n")
        var range: NSRange!
        if options == nil {
            range = text.rangeOfString(searchArg)
        } else {
            range = text.rangeOfString(searchArg, options: options!)
        }
        if range.length > 0 {
            return true
        }
        return false
        
    }

    func findNew(text: NSString, searchArg: String, options: String) -> Bool {
        println("In findNew\n")
        // These methods are only available as of iOS v8.0:
        if options == "caseInsensitive" {
            if text.localizedCaseInsensitiveContainsString(searchArg) {
                return true
            }
            return false
        } else {
            if text.containsString(searchArg) {
                return true
            }
            return false
        }
    }
    
    
    // --- 6. Replace a substring ---
    @IBOutlet var origText: UITextField!
    @IBOutlet var newText: UITextField!
    
    @IBAction func replace(sender: AnyObject) {
        var s1 = text.text
        var s2 = origText.text
        var s3 = newText.text
        
        texthold = "Replace:\nOriginal text is '\(s1)'\n\n"
        var newstr = s1.stringByReplacingOccurrencesOfString(s2, withString: s3, options: nil, range: nil)
        texthold = texthold + "New text is '\(newstr)'\n\n"
        
        println(texthold)
        results.text = texthold + "\n" + results.text
    }
    
    
    // --- 7. Number series to roughly Compute PI ---
    @IBOutlet var pickANumber: UITextField!
    
    @IBAction func computePI(sender: AnyObject) {
        
        var numIn: String = pickANumber.text        //The magic number is 1,461,054.0 -- that gives us PI to 6 decimal places
        var num = (numIn as NSString).doubleValue
        var numAsInt = Int(floor(num))              //Remove decimal places (if any)
        
        if numAsInt > 100000000 {
            textout = "Whoa! Not that big a number. I don't want to run forever. Keep it under 10 million.\n\n"
            print(textout)
            results.text = textout + results.text
            return
        }
        
        var sum:Double = 0.0
        var myPI:Double = 0.0

        if numAsInt > 1 {
            texthold = "About to loop \(numAsInt) number of times\n\n"
            
            for i in 1..<numAsInt {
                        //println("i=\(i) ")
                let nthTerm = 1.0 / Double(i * i)       // aborts on this line for iPad2 (but not iPad Air) when i = 46,341 (or 46,342?) -- why?
                        //println("nthTerm=\(nthTerm)")
                sum = sum + Double(nthTerm)
                        //println("sum=\(sum)")
            }
            
            myPI = sqrt(6.0 * sum)
            
            texthold = texthold + "My PI is:     \(myPI)\n"
            texthold = texthold + "PI really is: \(M_PI)\n\n"

        } else {
            texthold = "Compute PI: I can't do this unless you enter a number greater than 1. (Hint: Try 1.5 million)\n\n"
        }
        
        println(texthold)
        results.text = texthold + results.text
    }
    
    
}
