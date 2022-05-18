//
//  EditarTareaViewController.swift
//  Tareas
//
//  Created by Mac8 on 11/05/22.
//

import UIKit
import CoreData

class EditarTareaViewController: UIViewController {
    
    var recibirTarea: Tarea?
    var recibirImage: Tarea?
    //MARK: CONECCION A LA BD O AL CONTEXTO
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tituloElemento: UITextField!
    
    @IBOutlet weak var editarImage: UIImageView!
    @IBOutlet weak var fechaElemento: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloElemento.text = recibirTarea?.titulo ?? ""
        fechaElemento.date = (recibirTarea?.fecha)! 
       
    }
    
    
    @IBAction func guardarBtn(_ sender: Any) {
        //definir que vamos a guardar si modificamos algo
        recibirTarea?.titulo = tituloElemento.text ?? ""
        recibirTarea?.fecha = fechaElemento.date
        recibirImage?.image = editarImage.image
        
        do{
            try contexto.save()
        }catch{
            print(error.localizedDescription)
        }
        //Regresar al VC principal
        navigationController?.popViewController(animated: true)
        
    }
  
    


}
