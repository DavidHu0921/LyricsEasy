//
//  InsertViewController.swift
//  LyricsEasy
//
//  Created by David Hu on 2016/12/27.
//  Copyright © 2016年 David Hu. All rights reserved.
//

import UIKit

class InsertViewController: UIViewController {

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
        
        lyricsTextView.layer.masksToBounds = true
        lyricsTextView.layer.cornerRadius = 5
        lyricsTextView.layer.borderWidth = 1
        lyricsTextView.layer.borderColor = UIColor.init(colorLiteralRed: 232.0/255.0, green: 232.0/255.0, blue: 232.0/255.0, alpha: 1.0).cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancelVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
