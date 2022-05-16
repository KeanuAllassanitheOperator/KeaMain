package main

import (
    "fmt"
    "log"
    "net/http"
)


func diceHandler(w http.ResponseWriter, r *http.Request) {
    if r.URL.Path != "/" {
        http.Error(w, "404 not found.", http.StatusNotFound)
        return
    }

    if r.Method != "GET" {
        http.Error(w, "Method is not supported.", http.StatusNotFound)
        return
    }


}

func main() {
    fileServer := http.FileServer(http.Dir("./")) // New code
    http.Handle("/", fileServer) // New code
    http.HandleFunc("/dice", diceHandler)


    fmt.Printf("Starting server at port 8080\n")
    if err := http.ListenAndServe(":8080", nil); err != nil {
        log.Fatal(err)
    }
}
