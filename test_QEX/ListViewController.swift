//
//  ViewController.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import UIKit

class ListViewController: UIViewController {
    
    private let tableVew = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        navigationItem.title = "List"
        createTableView()
    }

//    MARK: - Create TableView
    private func createTableView() {
        view.addSubview(tableVew)
        tableVew.frame = view.bounds
        tableVew.delegate = self
        tableVew.dataSource = self
        tableVew.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
    }

}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension UIViewController: UITableViewDelegate, UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        cell.textLabel?.text = "1"
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailVIewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

//MARK: - Preview canvas
import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ListViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
