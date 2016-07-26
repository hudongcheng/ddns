package main

import (
//   "fmt"
    "io"
    // "io/ioutil"
    "os"
    "strconv"
)

func main() {
    pid := strconv.Itoa(os.Getpid())

    file, err := os.Create("one.pid")
    if err != nil {
       panic(err)
    }

    io.WriteString(file, pid)

//    defer os.Remove("one.pid")
//    if err != nil {
//       panic(err)
//    } else {
//      n;
//    }

}