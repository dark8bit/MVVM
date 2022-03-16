//
//  ViewController.swift
//  MVVM
//
//  Created by Владислав Клепиков on 16.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let CharacterTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    var ViewModelObj: CharacterViewModel! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(CharacterTableView)
        ViewModelObj = CharacterViewModel()
        
        ViewModelObj.getCharacters {
            DispatchQueue.main.async {
                self.CharacterTableView.reloadData()
            }
        }
        
        CharacterTableView.delegate = self
        CharacterTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        CharacterTableView.frame = view.frame
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewModelObj.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = ViewModelObj.titleForCellLabel(at: indexPath)
        
        return cell
    }
}
