import plagas.*
class Hogar {
  var nivelDeMugre
  var confort
  method esBueno(){
    return  nivelDeMugre <= confort.div(2) 
  }
  method recibirAtaqueDe(unaPlaga){
    nivelDeMugre = nivelDeMugre + unaPlaga.nivelDeDanio()
  }
}
class Huerta {
  var capacidadDeProduccion
  method esBueno(){
    return capacidadDeProduccion > nivelDeCosechas.valor()
  }
  method recibirAtaqueDe(unaPlaga){
    capacidadDeProduccion = capacidadDeProduccion - (unaPlaga.nivelDeDanio() * 0.1 + 
                            if(unaPlaga.trasmiteEnfermedades()){
                               10
                            }
                            else{
                               0
                            })
  }
}
object nivelDeCosechas {
  var property valor = 10
}
class Mascota {
  var nivelDeSalud
  method esBueno(){
    return nivelDeSalud > 250
  }
  method recibirAtaqueDe(unaPlaga){
    if (unaPlaga.trasmiteEnfermedades()) {
      nivelDeSalud = (nivelDeSalud - unaPlaga.nivelDeDanio()).max(0)
    }
  }
}
class Barrio {
  const property elementos = []
  method esCopado(){
    return self.cantElementosBuenos() > elementos.size().div(2)
  }
  method cantElementosBuenos(){
    return elementos.count({e => e.esBueno()})
  }
}