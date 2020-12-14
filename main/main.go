package main

import (
	"library/config"
	controller "library/server"
	"net/http"
)

func main() {
	c := &config.Config{}
	serverConfig := c.GetServer()
	server := http.Server{
		Addr: serverConfig.Host + ":" + serverConfig.Port,
	}

	http.HandleFunc("/api/create_administrator", controller.CreateAdministrator)
	http.HandleFunc("/api/login_administrator", controller.LoginAdministrator)
	http.HandleFunc("/api/create_librarian", controller.CreateLibrarian)
	http.HandleFunc("/api/login_librarian", controller.LoginLibrarian)
	http.HandleFunc("/api/create_borrower", controller.CreateBorrower)
	http.HandleFunc("/api/login_borrower", controller.LoginBorrower)

	server.ListenAndServe()
}
