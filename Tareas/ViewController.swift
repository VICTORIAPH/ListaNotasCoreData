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
   
    @IBAction func nuevaTarea(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "nuevo", sender: self)
    }
    @IBOutlet weak var tablaTareas: UITableView!
    //MARK: CONECCION A LA BD O AL CONTEXTO
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Delegado
        tablaTareas.delegate = self
        tablaTareas.delegate = self
    }
    
    func leerTareas(){
        let solicitud : NSFetchRequest<Tarea> = Tarea.fetchRequest()
        do{
            //guardar en el arreglo todos los datos de la entidada tarea
            listaTareas = try contexto.fetch(solicitud)
        }catch{
            print(error.localizedDescription)
        }
        tablaTareas.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaTareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaTareas.dequeueReusableCell(withIdentifier: "nuevo", for: indexPath)
        
        celda.textLabel?.text = listaTareas[indexPath.row].titulo
        celda.detailTextLabel?.text = "\(listaTareas[indexPath.row].fecha!)"
        return celda
    }
    


}

