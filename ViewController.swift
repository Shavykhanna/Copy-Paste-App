//
//  ViewController.swift
//  Copy Paste App
//
//  Created by Shavy on 13/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    let DATA_KEY = "data_key";
    @IBOutlet weak var textView: UITextView!
    
    var pastedStrings: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let loadedStrings =  UserDefaults.standard.stringArray(forKey: DATA_KEY){
            pastedStrings.append(contentsOf: loadedStrings)
        }
        showText()
    }
    
    func addText(){
        guard let text = UIPasteboard.general.string, !pastedStrings.contains(text)else {
            return
        }
        
        pastedStrings.append(text)
        UserDefaults.standard.set(pastedStrings, forKey: DATA_KEY)
        showText()
    }
    func showText(){
        textView.text=""
        for str in pastedStrings{
            textView.text.append("\(str)\n\n")
        }
    }

    @IBAction func trashWasPressed(_ sender: Any) {
        pastedStrings.removeAll()
        textView.text=""
        UserDefaults.standard.removeObject(forKey: DATA_KEY)
    }
    
}

