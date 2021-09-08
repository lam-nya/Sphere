//
//  ViewController.swift
//  Sphere
//
//  Created by Igor Kuzmin on 30.08.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var isOnPause = false
    
    var fetchResultsController: NSFetchedResultsController<SphereTimer>!
    
    var timers: [SphereTimer] = []
    
    let headline: UILabel = UILabel()
    let timerName: UITextField = UITextField()
    let timerLength: UITextField = UITextField()
    let startButton: UIButton = UIButton(type: .system)
    let pauseButton: UIButton = UIButton(type: .system)
    let timerTable: UITableView = UITableView()
   // let navigationBar: UINavigationBar = UINavigationBar()

    
    override func viewWillLayoutSubviews() {
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 44))
        navigationBar.barTintColor = UIColor.systemGray5
        view.addSubview(navigationBar);
        let navigationItem = UINavigationItem(title: "Мултитаймер")
        navigationBar.setItems([navigationItem], animated: false)
        
    }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        view = UIView()
        view.backgroundColor = .white
        
//        navigationController?.navigationBar.barTintColor = UIColor.lightGray
//        navigationBar.translatesAutoresizingMaskIntoConstraints = false
//        navigationBar.topItem?.title = "Мультитаймер"
//        view.addSubview(navigationBar)
        
        headline.translatesAutoresizingMaskIntoConstraints = false
        headline.text = "Добавление таймеров"
        view.addSubview(headline)
        
        timerName.translatesAutoresizingMaskIntoConstraints = false
        timerName.borderStyle = UITextField.BorderStyle.roundedRect
        timerName.placeholder = "Название таймера"
        timerName.text = "Таймер"
        view.addSubview(timerName)
        
        timerLength.translatesAutoresizingMaskIntoConstraints = false
        timerLength.borderStyle = UITextField.BorderStyle.roundedRect
        timerLength.placeholder = "Время в секундах"
        timerLength.text = "10"
        view.addSubview(timerLength)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Добавить", for: .normal)
        startButton.layer.cornerRadius = 5
        startButton.backgroundColor = .systemGray5
        startButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        view.addSubview(startButton)
        
        
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.setTitle("Поставить на паузу", for: .normal)
        pauseButton.layer.cornerRadius = 5
        pauseButton.backgroundColor = .systemGray5
        pauseButton.addTarget(self, action: #selector(pauseTimer), for: .touchUpInside)
        view.addSubview(pauseButton)
        
//        https://developer.apple.com/documentation/uikit/views_and_controls/table_views/adding_headers_and_footers_to_table_sections
//        if custom header must be

        let nib = UINib(nibName: "TimerTableCell", bundle: nil)
        timerTable.register(nib, forCellReuseIdentifier: "myCell")

        timerTable.dataSource = self
        timerTable.delegate = self //было закаоменчено когда показываалось
        
        //hide extra lines
        timerTable.tableFooterView = UIView()
        
        timerTable.register(TimerTableCell.self, forCellReuseIdentifier: "myCell")
        timerTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timerTable)
        
        NSLayoutConstraint.activate([

            headline.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
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
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            pauseButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 50),
            pauseButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            pauseButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            pauseButton.heightAnchor.constraint(equalToConstant: 50),
            
            timerTable.topAnchor.constraint(equalTo: pauseButton.bottomAnchor, constant: 50),
            timerTable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            timerTable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            timerTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
            
        ])
        


        
        let fetchRequest: NSFetchRequest<SphereTimer> = SphereTimer.fetchRequest()
        let sortDesciptor = NSSortDescriptor(key: "sphereTimerLength", ascending: false)
        fetchRequest.sortDescriptors = [sortDesciptor]
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext {
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            
            do {
                try fetchResultsController.performFetch()
                timers = fetchResultsController.fetchedObjects!
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
       
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in

            if !isOnPause {
                if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext {
                    fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)

                    do {
                        try fetchResultsController.performFetch()
                        timers = fetchResultsController.fetchedObjects!

                        for i in timers {
                            if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext {

                                let sphereTimerLengthCurrent = i.sphereTimerLength - 1
                                
                                if sphereTimerLengthCurrent > 0 {
                                    do {
                                        

                                            //обновить таблицу
                                        i.sphereTimerLength -= 1
                                        timerTable.reloadData()
                                        try context.save()

                                        print("Сохранение удалось")
                                    } catch let error as NSError {
                                        print("Не удалось сохранить данные \(error), \(error.userInfo)")
                                    }

                                } else {
                                    i.sphereTimerLength -= 1
                                    try context.save()
                                    context.delete(i)
                                    timerTable.reloadData()
                                }
                                }
                        } //end for

                        timerTable.reloadData()

                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                }//end if context
            }

        
            
            
           

        }
        
        
    } //end view did load
    
    @objc func startTimer (_ sender: UIButton) {
        print("Button tapped")
        guard let name: String = timerName.text else {
            print("No name")
            return
        }
        
        if name == "" {
            print("Empty name")
            return
        }
        
        guard let lengthInSeconds: Int = Int(timerLength.text!) else {
            print("No length")
            return
        }
        
        print(name)
        print(lengthInSeconds)
        
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext {
            let newTimer = SphereTimer(context: context)
            newTimer.sphereTimerName = name
            newTimer.sphereTimerLength = Int16(lengthInSeconds)
            print("Saved")
            do {
                try context.save()
                print("Сохранение удалось")
            } catch let error as NSError {
                print("Не удалось сохранить данные \(error), \(error.userInfo)")
            }
        }
        
        
        
    } //end startTimer
    
    
    
    @objc func pauseTimer (_ sender: UIButton) {
       // print("pause button tapped")
       
        if sender == pauseButton && isOnPause {
            isOnPause = false
            pauseButton.setTitle("Поставить на паузу", for: .normal)
        } else if sender == pauseButton && !isOnPause {
            isOnPause = true
            pauseButton.setTitle("Снять с паузы", for: .normal)
        }
        
        
        
    } //end pauseTimer
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return timers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath) as! TimerTableCell

        cell.timerNameInTable.text = timers[indexPath.row].sphereTimerName
        cell.timerLengthInTable.text = String(timers[indexPath.row].sphereTimerLength)

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "Таймеры"
    }
    
}

