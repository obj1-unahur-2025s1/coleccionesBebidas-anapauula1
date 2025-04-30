object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}
object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}
object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}
object licuadoFrutas{
    const nutrientes = [ ] // lista vacia
    // se conocen los nutrientes
    method rendimiento(cantidad){
       return cantidad * nutrientes.sum()
    }
    method agregarNutrientes(unNutriente){
        return nutrientes.add(unNutriente)
    }
}
object aguaSaborizada{
    var composicionBebida = 0.25  // inicializada
    method rendimiento(cantidad){
        return 1 + composicionBebida
    }
    method composicion(nuevaProporcion){
        composicionBebida = nuevaProporcion
    }
}
object coctel{
    const bebidas = [ ] // vacia
    method rendimiento(cantidad){
        // le digo que me filtre la lista sacando el cianuro
        return 
        bebidas.filter({p=> !p.cianuro()}) &&
        // trasformo las bebidas es numero 
        bebidas.sum({p=> p.rendimiento(cantidad)}) 
        * bebidas.size()
        // multiplico por tamaño
    }
}
object coctelSuave {
    const bebidasCoctel = [ ] //vacia
    method rendimiento(cantidad){
        // al sum ---> le pongo una condicicon
        bebidasCoctel.sum({p=> p.rendimiento(cantidad) > 0.5})
    }
}
