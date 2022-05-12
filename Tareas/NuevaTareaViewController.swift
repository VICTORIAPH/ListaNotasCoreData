//
//  NueavaTareaViewController.swift
//  Tareas
//
//  Created by Mac8 on 11/05/22.
//

import UIKit
// core data paso 1
import CoreData

class NuevaTareaViewController: UIViewController, UITextFieldDelegate{
    
    //MARK: vinculamos los
    
    @IBOutlet weak var textoTareaTxtF: UITextField!
    @IBOutlet weak var fechaTareaPicker: UIDatePicker!
    
    //MARK: CONECCION A LA BD O AL CONTEXTO
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        //habilitar
        textoTareaTxtF.delegate = self
        textoTareaTxtF.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func guardarTareaBtn(_ sender: UIBarButtonItem) {
        //validar que no este vacio el textFiel        if let tituloTarea = textoTareaTxtF.text, !tituloTarea.isEmpty{
            //crear una fecha
            let fechaTarea = fechaTareaPicker.date
            
            //crear un obj o tarea
            let nuevoElemento = Tarea(context: self.contexto)
            
            nuevoElemento.titulo = tituloTarea
            nuevoElemento.fecha = fechaTarea
            
            //guardamos
            do{
                try contexto.save()
                print("se guardo coprrectamente la tarea en coredata")
            }catch{
                print(error.localizedDescription)
            }
            //Regresar a la pantalla anteriior
        navigationController?.popViewController(animated: true)
        }else{
            print("Escribe algo")
            textoTareaTxtF.placeholder = "Necesitas escribir una nota para guiardar"
        }
    }
    
