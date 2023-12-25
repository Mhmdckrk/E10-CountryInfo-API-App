//
//  DetailViewController.swift
//  Project13-15-Country
//
//  Created by Mahmud CIKRIK on 24.10.2023.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Country?
    
    
    override func loadView() {
        
        webView = WKWebView()
        view = webView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="widht=device-widht, initial-scale=1">
        <style>
        div {
        font-size: 110%;
        font-family: Helvetica, Arial, sans-serif;
        }
        </style>
        </head>
        <body>
        <div>NAME: \(detailItem.name.common)</div>
                <br>
        <div style=" width:80%; outline: 1px solid gray;"><img src="\(detailItem.flags.svg)" style="width:100%;"></div>
        <br>
        <div>CURRENCIES: \(detailItem.currencies.keys) \(detailItem.currencies.first?.value.name ?? "Para" )</div>
        <div>CAPITAL CITY: \(detailItem.capital)</div>
        <div>LANGUAGES: \(detailItem.languages.values)</div>
        <div>REGION: \(detailItem.region)</div>
        <div>AREA: \(detailItem.area)</div>
        <div>POPULATION: \(detailItem.population)</div>
        <div>TIMEZONE: \(detailItem.timezones)</div>
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
        
    }
    
}
