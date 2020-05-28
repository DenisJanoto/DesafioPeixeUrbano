//
//  ViewControllerProdutos.swift
//  DesafioPeixeUrbano
//
//  Created by Denis Janoto on 13/05/20.
//  Copyright © 2020 Denis Janoto. All rights reserved.
//

import UIKit

class ViewControllerProdutos: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tView: UITableView!
    
    var x:Int = 3
    var resultApi:Response?
    var dadosDeal:[Deal]?
    var dadosBanner:[Banner]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //CHAMAR API
        chamaApi()
    }
    
    
    
    
    func chamaApi(){
        ApiController.loadData(page: x) { (response_) in
            self.dadosDeal = response_?.response.deals
            self.dadosBanner = response_?.response.banners
            
            //NECESSÁRIO POIS A TABLE VIEW É CARREGADA ANTES DOS DADOS SEREM BAIXADOS TOTALMENTE
            DispatchQueue.main.async {
                self.tView.reloadData()
            }
            
        }
        
        
    }
    
    //BOTÃO FAVORITOS
    @IBAction func btnFavoritos(_ sender: Any) {
    }
    
    
    //CELULA CLICADA - FAVORITAR OFERTA
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.allowsSelectionDuringEditing = false
         FavoritosController.salvarOferta(oferta: dadosDeal![indexPath.row])
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dadosDeal?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaProduto", for: indexPath) as! CustomViewCellProdutos
        if let objDeal = dadosDeal?[indexPath.row]{
            celula.prepaparCelula(deal: objDeal)
            
        }else{
            print("sem dados")
        }
        return celula
    }
    
    
    
}
