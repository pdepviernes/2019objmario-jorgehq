import wollok.game.*

object juego {

	method iniciar() {
		game.title("Mario el ahorrista")
		game.width(7)
		game.height(7)
		game.addVisual(peso)
		game.addVisual(unDolar)
		game.addVisual(flor)
		game.addVisual(balanza)
		game.addVisual(mario)
		game.addVisual(ladron)
		game.addVisual(flormediano)
		game.addVisual(florgrande)
		game.start()
	}

}

object mario {

	var position = game.center()
	var pesosAhorrados = 0
	var valorInvertido = 0
	var multiplicadordeRendimiento = 1
	method levantar(cosa) {
		position = cosa.position()
		pesosAhorrados = pesosAhorrados + cosa.valor()
		multiplicadordeRendimiento = cosa.multiplicador()
		game.say(self, "Junte " + cosa.valor().toString())
		
		
	}
	method mostrarAhorros() {
		game.say(self, "Junte " + pesosAhorrados + " pesos.")
	}
	method inversion (tipo){
		valorInvertido = (tipo.rendimiento(self)*multiplicadordeRendimiento) + self.ahorros()
		return valorInvertido
	}
	method ahorros() = pesosAhorrados
	
	method image() { return "mario.png"}
	method position() { return position}

}
object luigi{
	var ahorros= 300
	var valorInvertido = 0
	method ahorros() = ahorros
	method inversion(tipo){
		valorInvertido = (tipo.rendimiento(self)/2)+ahorros
		return valorInvertido
		
	}
}
object parImpar{
	var ganancia=0
	method rendimiento(persona){
		ganancia =persona.ahorros()*(persona.ahorros()%2)*0.20
		return ganancia
	}
} 
object plazoFijo{
	var ganancia = 0
	var dias = 1
	method rendimiento(persona){
		ganancia = persona.ahorros()*0.02*dias
		dias+=1
		return ganancia
	}
	
}

object lebacz{
	var ganancia = 0
	method rendimiento(persona){
		ganancia=(banco.cajaFuerte()+persona.ahorros())*0.10
		return ganancia
	}
}

object ladron{
	var valor = -30
	method position() {
		return game.center().right(2).up(2)
	}
	method image(){
		return "ladron.png"
	}
	method valor(){
		return valor
	}
}
	

object peso {

	var valor = 5
    
	method valor() {return valor}

	method position() {return game.center().right(2)}
	method image() {return "peso.png"}

}

object unDolar {

	method valor() = banco.cotizacion()

	method position() {return game.center().left(2)}
	method image() {return "dolar.png"}

}

object banco {

	var cotizacion = 45
	var cajaFuerte = 3000
	method cotizacion() {return cotizacion}

	method corrida(){
		cotizacion = 57
		balanza.desbalancear()
	}

	method tranquilidad(){
		cotizacion = 45
		balanza.balancear()
	}
	
	method cajaFuerte() = cajaFuerte

}

object flor {

	method valor() {return 0}
	method multiplicador(){return 1}

	method position() {return game.center().up(2)}
	method image() {return "flor.png"}

}
object flormediano {

	method valor() {return 0}
    method multiplicador(){return 2}
	method position() {return game.center().up(2).left(2)}
	method image() {return "flormediano.png"}

}
object florgrande {

	method valor() {return 0}
    method multiplicador(){return 3}
	method position() {return game.center().down(2).left(2)}
	method image() {return "florgrande.png"}

}



object balanza {
	const imagenBalanceada ="balanceado.png" 
	var imagen = imagenBalanceada 
	
	method balancear() { 
		imagen = imagenBalanceada 
	}
	
	method desbalancear() { 
		imagen = "desbalanceado.png"
	}
	
	method position() {return game.center().down(2)}
	method image() {return imagen}
}



