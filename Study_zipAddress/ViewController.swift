//
//  ViewController.swift
//  Study_zipAddress
//
//  Created by Daichi Hayashi on 2017/09/17.
//  Copyright © 2017年 Daichi Hayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var zipTextField: UITextField!
    @IBAction func tapReturn() {
    }
    @IBAction func tapSearch() {
        guard let ziptext = zipTextField.text else{
            // 値がnilであれば終了する
            return
        }
        // リクエストするURLを作成
        let urlStr = "http://api.zipaddress.net/?zipcode=\(ziptext)"
        // 確認用
        //print(urlStr)
        
        if let url = NSURL(string: urlStr) {
            // URLオブジェクトがnilでなければ検索処理オブジェクトを作成
            let urlSession = URLSession.shared
            // 「検索処理が完了するとonGetAddressを呼び出す」というタスクの作成
            let task = urlSession.dataTaskWithURL(url as URL, completionHandler: self.onGetAddress)
            // タスク終了
            task.resume()
        }
    }
    
    // 検索処理の終了で実行
    func onGetAddress(data: NSData?, res: URLResponse?, error: NSError) {
        // 確認のためdataの実行
        print(data)
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

