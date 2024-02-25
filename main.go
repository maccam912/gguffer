package main

import (
    "html/template"
    "net/http"
    "time"
    // Assume other necessary imports, including database client setup
)

type Model struct {
    Name      string
    Status    string
    Timestamp time.Time
}

func main() {
    http.HandleFunc("/", indexHandler)
    http.ListenAndServe(":8080", nil)
}

func indexHandler(w http.ResponseWriter, r *http.Request) {
    // Example data retrieval, replace with actual DB queries
    queuedModels := []Model{{Name: "Model1", Timestamp: time.Now()}}
    recentModels := []Model{{Name: "Model2", Status: "completed_success", Timestamp: time.Now()}}

    tmpl, err := template.ParseFiles("templates/index.gohtml")
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
        return
    }

    data := struct {
        QueuedModels []Model
        RecentModels []Model
    }{
        QueuedModels: queuedModels,
        RecentModels: recentModels,
    }

    tmpl.Execute(w, data)
}

