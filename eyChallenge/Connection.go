package main

import (
	"database/sql"
	"log"

	_ "github.com/lib/pq"
)

//Connection to DB

func getConnection() *sql.DB {
	dsn := "postgres://postgres:password@127.0.0.1:5432/ey?sslmode=disable"
	db, err := sql.Open("postgres", dsn)
	if err != nil {
		log.Fatal(err)
	}

	return db

}
