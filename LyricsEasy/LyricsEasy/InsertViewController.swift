//
//  InsertViewController.swift
//  LyricsEasy
//
//  Created by David Hu on 2016/12/27.
//  Copyright © 2016年 David Hu. All rights reserved.
//

import UIKit

class InsertViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var singNameTextField: UITextField!
    @IBOutlet weak var lyricsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelVC(_:)))
        self.navigationItem.leftBarButtonItem = cancelButton

        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveVC(_:)))
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        
        lyricsTextView.layer.masksToBounds = true
        lyricsTextView.layer.cornerRadius = 5
        lyricsTextView.layer.borderWidth = 1
        lyricsTextView.layer.borderColor = UIColor.init(colorLiteralRed: 232.0/255.0, green: 232.0/255.0, blue: 232.0/255.0, alpha: 1.0).cgColor
        
        singNameTextField.delegate = self
        lyricsTextView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancelVC(_ sender: Any) {
        let titleText = singNameTextField.text
        let contentText = lyricsTextView.text
        
        if !(titleText?.isEmpty)! || !(contentText?.isEmpty)! {
            let alert = UIAlertController.init(title: "Hint", message: "Are you sure to cancel editting?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "Sure", style: .default, handler: { action -> Void in
                self.dismiss(animated: true, completion: nil)
            })
            
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func saveVC(_ sender: Any) {
        
    }
    
    // MARK: UITextFieldDelegate && UITextViewDelegate
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.navigationItem.rightBarButtonItem?.isEnabled = isTitleAndContentEmpty()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.navigationItem.rightBarButtonItem?.isEnabled = isTitleAndContentEmpty()
    }
    
    func isTitleAndContentEmpty () -> Bool {
        let titleText = singNameTextField.text
        let contentText = lyricsTextView.text
        
        if (titleText?.isEmpty)! && (contentText?.isEmpty)! {
            return false
        } else {
            return true
        }
    }
}
