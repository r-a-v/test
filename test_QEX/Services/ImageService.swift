//
//  ImageService.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import UIKit

class ImageService {
    
    static let shared = ImageService()
    
    private let baseURL = "https://scripts.qexsystems.ru/test_ios/public"
    
    private init() {}
    
    func getImage(from urlString: String?) -> Data? {
        guard let urlString = urlString else { return nil }
        let entireURLString = baseURL + urlString
        guard let url = URL(string: entireURLString) else { return nil }
        
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}
