//
//  ViewController.swift
//  Tareas
//
//  Created by Mac8 on 10/05/22.
//

import UIKit
import CoreData

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    
    //MARK: - Variables
    var listaTareas = [Tarea]()
   
    @IBOutlet weak var tablaTareas: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tablaTareas.delegate = self
        tablaTareas.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaTareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaTareas.dequeueReusableCell(withIdentifier: "celda", for: <#T##IndexPath#>)
        
        celda.textLabel?.text = listaTareas[indexPath.row].titulo
        celda.detailTextLabel?.text = "\(listaTareas[indexPath.row].fecha)"
        return celda
    }
    


}

