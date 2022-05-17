//
//  ViewController.swift
//  Tareas
//
//  Created by Mac8 on 10/05/22.
//

import UIKit
import CoreData

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBAction func nuevaTarea(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "nuevo", sender: self)
    }
    @IBOutlet weak var tablaTareas: UITableView!
    
    //MARK: - Variables
    var listaTareas = [Tarea]()
    var tareaEnviar = Tarea?.self
   

    //MARK: CONECCION A LA BD O AL CONTEXTO
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Delegado
        tablaTareas.delegate = self
        tablaTareas.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        leerTareas()
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
    
    @IBAction func agregarTareaBtn(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "nuevo", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaTareas.count
    }
    //MARK: - TABLA METODOS
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //GUARDAMOS TAREA   A MANDAR
        tareaEnviar = listaTareas[indexPath.row]
        performSegue(withIdentifier: "editar", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editar"{
            let objDestino = segue.destination as! EditarTareaViewController
            objDestino.recibirTarea = tareaEnviar
        }
    }
}
