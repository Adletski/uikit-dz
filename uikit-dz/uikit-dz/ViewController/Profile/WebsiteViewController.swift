// WebsiteViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

final class WebsiteViewController: UIViewController {
    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view = webView

//        guard let url = URL(string: "https://www.kolesa.kz") else { return }
//        let urlRequest = URLRequest(url: url)
//        webView.load(urlRequest)
    }

    func loadRequest(urlString: String) {
        guard let url = URL(string: "https://\(urlString)") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
}
