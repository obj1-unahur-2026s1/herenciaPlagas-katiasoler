class Plaga {
    var poblacion
    method nivelDeDanio()
    method trasmiteEnfermedades(){
        return poblacion > 10 && self.condicionAdicional()
    }
    method condicionAdicional()
    method atacar(elemento){
        elemento.recibirAtaqueDe(self)
        poblacion += poblacion * 1.1
    }
}
class Cucarachas inherits Plaga {
    var pesoPromedio
    override method nivelDeDanio(){
        return poblacion.div(2)
    }
    override method condicionAdicional(){
        return pesoPromedio > 10
    }  
    override method atacar(elemento){
        super(elemento)
       pesoPromedio = pesoPromedio + 2
    }
}
class Pulgas inherits Plaga {
     override method nivelDeDanio(){
        return poblacion * 2
    }
    override method condicionAdicional(){
    return true
 }
}
class Garrapatas inherits Pulgas {
    override method atacar(elemento){
        elemento.recibirAtaqueDe(self)
        poblacion += poblacion * 1.2 
    }
}
class Mosquitos inherits Plaga {
    override method nivelDeDanio(){
        return poblacion 
    }
    override method condicionAdicional(){
        return poblacion % 3 == 0
    }
}