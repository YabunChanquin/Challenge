package main

import (
	"errors"
	"time"
)

type persona struct {
	id          int
	nombre      string
	apellido    string
	phone       string
	email       string
	creado      time.Time
	actualizado time.Time
	rol         string
	activo      bool
	fechnac     time.Time
}

//Create

func crear_persona(p persona) error {

	query := `INSERT INTO persona (nombre,apellido,creado,id_rol)
	VALUES ($1,$2,$3,$4)`

	db := getConnection()
	defer db.Close()

	stmt, err := db.Prepare(query)
	if err != nil {
		return err
	}
	defer stmt.Close()

	r, err := stmt.Exec(p.nombre, p.apellido, time.Now(), p.rol)
	if err != nil {
		return err
	}
	i, _ := r.RowsAffected()
	if i != 1 {
		return errors.New("Se esperaba una fila afectada")
	}
	return nil
}

//Delete by id

func eliminar_persona(p persona) error {

	query := `DELETE FROM persona WHERE id_persona=$1`

	db := getConnection()
	defer db.Close()

	stmt, err := db.Prepare(query)
	if err != nil {
		return err
	}
	defer stmt.Close()

	r, err := stmt.Exec(p.id)
	if err != nil {
		return err
	}
	i, _ := r.RowsAffected()
	if i != 1 {
		return errors.New("No fue posible eliminar el registro, intente nuevamente")
	}
	return nil
}

//Search all
/*
func buscar_persona() (usuarios []persona, err error) {

	query := `SELECT id_persona, nombre, apellido,
		 rol.rol, phone, email, creado, activo,
		 fechnac FROM persona INNER JOIN rol
		 ON persona.id_rol = rol.id_rol`

	db := getConnection()
	defer db.Close()

	rows, err := db.Query(query)
	if err != nil {
		fmt.Println(err)
	}
	defer rows.Close()

	for rows.Next() {
		p := persona{}
		err := rows.Scan(&p.id, &p.nombre, p.apellido, &p.rol,
			&p.phone, &p.email, &p.creado, &p.activo, &p.fechnac)
		if err != nil {
			return
		}
		usuarios = append(usuarios, p)
	}
	return usuarios, nil

	if i != 1 {
		return errors.New("No fue posible eliminar el registro, intente nuevamente")
	}
	return nil
}
*/
