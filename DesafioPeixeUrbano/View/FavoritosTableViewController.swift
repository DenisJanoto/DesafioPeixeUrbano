//
//  FavoritosTableViewController.swift
//  DesafioPeixeUrbano
//
//  Created by Denis Janoto on 17/05/20.
//  Copyright © 2020 Denis Janoto. All rights reserved.
//

import UIKit
import CoreData

class FavoritosTableViewController: UITableViewController {
    
    //    var retornoOfertas:[FavoritosController]=[]
    //    var descricaoOferta:String=""
    //    var valorOferta:Double=0.0
    //    var todasOfertas:[FavoritosController]=[]
    //    var deletarOfertas:[NSManagedObject]=[]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.topItem!.title = "Voltar"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FavoritosController.listarOfertas()
    }
    
    
    //LISTAR OFERTAS
    //    func listarOfertas(){
    //        let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //        let context = appDelegate.persistentContainer.viewContext
    //        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Informacoes")
    //
    //
    //        //LIMPA O ARRAY DE OFERTAS PARA N ACUMULAR TODAS VEZ QUE ESTA FUNÇÃO FOR CHAMADA
    //        todasOfertas = []
    //
    //        do {
    //            let ofertas = try context.fetch(requisicao)
    //
    //            //UTILIZADO PARA DELETAR OFERTAS
    //            deletarOfertas = ofertas as! [NSManagedObject]
    //
    //            if ofertas.count > 0{
    //                for oferta in ofertas as! [NSManagedObject]{
    //                    let descricaoOfertaRetornada = oferta.value(forKey: "descricao")
    //                    let valorOfertaRetornada = oferta.value(forKey: "valor")
    //
    //                    let ofertas = FavoritosController()
    //                    ofertas.descricaoOferta = descricaoOfertaRetornada as! String
    //                    ofertas.valorOferta = valorOfertaRetornada as! Double
    //                    todasOfertas.append(ofertas)
    //                }
    //            }
    //        } catch{
    //            print("Erro ao listar os Dados")
    //        }
    //        tableView.reloadData()
    //    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoritosController.todasOfertas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaFavoritos", for: indexPath) as! CustomCellFavoritos
        celula.prepaparCelula(oferta:FavoritosController.todasOfertas[indexPath.row])
        
        
        return celula
    }
    
    //DELETAR ITEM NA TABLEVIEW
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let appDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
            let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
            
            
            
            
            let oferta = FavoritosController.deletarOfertas[indexPath.row]
            context.delete(oferta)
            
            
            //DELETA DO ARRAY (TEM QUE REMOVER DO ARRAY ANTES DE REMOVER DA TABELA)
            FavoritosController.todasOfertas.remove(at: indexPath.row)
            FavoritosController.deletarOfertas.remove(at: indexPath.row)
            
            
            
            //DELETA DA TABELA
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
}
