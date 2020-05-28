//
//  FavoritosController.swift
//  DesafioPeixeUrbano
//
//  Created by Denis Janoto on 17/05/20.
//  Copyright © 2020 Denis Janoto. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FavoritosController{
    
    var descricaoOferta:String=""
    var valorOferta:Double=0.0
    static var todasOfertas:[FavoritosController]=[]
    static var deletarOfertas:[NSManagedObject]=[]
    
    
    
    //SALVAR OFERTAS NOS FAVORITOS
    class func salvarOferta(oferta:Deal){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let info = NSEntityDescription.insertNewObject(forEntityName: "Informacoes", into: context)
        
        info.setValue(oferta.shortTitle, forKey: "descricao")
        info.setValue(oferta.salePrice, forKey: "valor")
        
        do {
            try context.save()
        } catch{
            print("Erro ao Salvar os Dados")
        }
    }
    
    
    //LISTAR OFERTAS
    class func listarOfertas(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Informacoes")
        
        
        //LIMPA O ARRAY DE OFERTAS PARA N ACUMULAR TODAS VEZ QUE ESTA FUNÇÃO FOR CHAMADA
        FavoritosController.todasOfertas = []
        
        do {
            let ofertas = try context.fetch(requisicao)
            deletarOfertas = ofertas as! [NSManagedObject]
             
            if ofertas.count > 0{
                for oferta in ofertas as! [NSManagedObject]{
                    let descricaoOfertaRetornada = oferta.value(forKey: "descricao")
                    let valorOfertaRetornada = oferta.value(forKey: "valor")
                    
                    let ofertas = FavoritosController()
                    ofertas.descricaoOferta = descricaoOfertaRetornada as! String
                    ofertas.valorOferta = valorOfertaRetornada as! Double
                    FavoritosController.todasOfertas.append(ofertas)
                }
            }
        } catch{
            print("Erro ao listar os Dados")
        }
    }

    
    
}
