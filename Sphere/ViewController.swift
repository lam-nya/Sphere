//
//  ViewController.swift
//  Sphere
//
//  Created by Igor Kuzmin on 30.08.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let headline: UILabel = UILabel()
    let timerName: UITextField = UITextField()
    let timerLength: UITextField = UITextField()
    let startButton: UIButton = UIButton(type: .system)
    let timerTable: UITableView = UITableView()
    var itemsToLoad: [String] = ["One", "Two", "Three"]

    
    override func viewWillLayoutSubviews() {
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: UIApplication.shared.statusBarFrame.size.height + 44))
        navigationBar.barTintColor = UIColor.lightGray
        view.addSubview(navigationBar);
        let navigationItem = UINavigationItem(title: "Мулти таймер")
        navigationBar.setItems([navigationItem], animated: false)
    }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        view = UIView()
        view.backgroundColor = .white
//        navigationController?.navigationBar.barTintColor = UIColor.yellow
//        navigationBar.translatesAutoresizingMaskIntoConstraints = false
//        navigationBar.topItem?.title = "Мульти таймер"
//        view.addSubview(navigationBar)
        
        headline.translatesAutoresizingMaskIntoConstraints = false
        headline.text = "Добавление таймеров"
        view.addSubview(headline)
        
        timerName.translatesAutoresizingMaskIntoConstraints = false
        timerName.borderStyle = UITextField.BorderStyle.roundedRect
        timerName.placeholder = "Название таймера"
        view.addSubview(timerName)
        
        timerLength.translatesAutoresizingMaskIntoConstraints = false
        timerLength.borderStyle = UITextField.BorderStyle.roundedRect
        timerLength.placeholder = "Время в секундах"
        view.addSubview(timerLength)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Добавить", for: .normal)
        startButton.layer.borderWidth = 1
        startButton.layer.cornerRadius = 5
//         startButton.addTarget(self, action: self.startTimer, for: .touchUpInside))
        view.addSubview(startButton)
        
        timerTable.dataSource = self
        timerTable.delegate = self
                
        timerTable.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        timerTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timerTable)
        
        NSLayoutConstraint.activate([

            headline.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            headline.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            timerName.topAnchor.constraint(equalTo: headline.bottomAnchor, constant: 20),
            timerName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            timerName.widthAnchor.constraint(equalToConstant: 275),
            
            timerLength.topAnchor.constraint(equalTo: timerName.bottomAnchor, constant: 10),
            timerLength.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            timerLength.widthAnchor.constraint(equalToConstant: 275),
          
            startButton.topAnchor.constraint(equalTo: timerLength.bottomAnchor, constant: 50),
            startButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            startButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            
            timerTable.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 50),
            timerTable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            timerTable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 32),
            timerTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
        
        
    } //end view did load
    
    func startTimer (_ sender: UIButton!) {
        print("Button tapped")
    } //end startTimer
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemsToLoad.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath)
        
        cell.textLabel?.text = self.itemsToLoad[indexPath.row]
        
        return cell
    }
    
}

