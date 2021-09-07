//
//  ViewController.swift
//  test_QEX
//
//  Created by aleksandr_rudikov on 06.09.2021.
//

import UIKit

class ListViewController: UIViewController {

    private var viewModel: ListViewModel! {
        didSet {
            viewModel.getPosts { isGet in
                self.updateTableView(with: isGet)
            }
        }
    }
    
//    MARK: - UIViews
    private let tableVew = UITableView()
    private var loader = UIActivityIndicatorView(style: .large)

//    MARK: - LifreCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        viewModel = ListViewModel()
        createTableView()
        configureNavBar()
        configureActivityIndicator()
    }
    
    private func updateTableView(with value: Bool) {
        loader.stopAnimating()
        value
            ? tableVew.reloadData()
            : showAlert(withTitle: "Ошибка!", andMessage: "Не удалось загрузить данные.") 
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource  {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.reuseID, for: indexPath) as? ListCell else { return UITableViewCell() }
        
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailVIewController()
        detailVC.viewModel = viewModel.detailViewModel(at: indexPath)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//    MARK: - Configure Views
extension ListViewController {
    
    private func createTableView() {
        view.addSubview(tableVew)
        tableVew.frame = view.bounds
        tableVew.delegate = self
        tableVew.dataSource = self
        tableVew.register(ListCell.self, forCellReuseIdentifier: ListCell.reuseID)
        tableVew.rowHeight = 100
        
        navigationItem.title = "List"
    }
    
    private func configureActivityIndicator() {
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.hidesWhenStopped = true
        tableVew.addSubview(loader)
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loader.startAnimating()
    }
    
    private func configureNavBar() {
        title = "List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarApearence = UINavigationBarAppearance()
        navBarApearence.configureWithOpaqueBackground()
        navBarApearence.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarApearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarApearence.backgroundColor = UIColor(
            red: 80/255,
            green: 167/255,
            blue: 199/255,
            alpha: 1
        )
        navigationController?.navigationBar.standardAppearance = navBarApearence
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApearence
        navigationController?.navigationBar.tintColor = .white
    }
}
