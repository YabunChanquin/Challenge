package main

import (
	"fmt"
	"log"
)

func main() {
	p := persona{
		id:       4,
		nombre:   "Juan",
		apellido: "Chanquin",
		rol:      "2",
		//Activo:   true,
	}
	err := crear_persona(p)
	//err := eliminar_persona(p)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Usuario Registrado Exitosamente")
}

//mensaje para eliminar fmt.Println("Usuario Eliminado Exitosamente")
/*	es, err := buscar_persona()
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(es)

}
*/
