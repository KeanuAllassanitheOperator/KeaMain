package main

import (
    "fmt"
    "math/rand"
    "time"
)

func GenerateDiceNumber() int {
rand.Seed(time.Now().UnixNano())
//var dice = []int{1, 2, 3, 4, 5, 6}
min := 1
max := 6
 return (rand.Intn(max - min + 1) + min)

  //return dice[rand.Intn(len(dice))]

}

func main() {
var rollcount = 0
var diceNumber = 0
 for diceNumber != 6 {
  fmt.Println(diceNumber)
  fmt.Println(rollcount)
  rollcount++
  diceNumber = GenerateDiceNumber()
  if diceNumber == 6 {
    break

} else {
   continue
  }
 }
fmt.Println(diceNumber)
fmt.Println(rollcount)

}
