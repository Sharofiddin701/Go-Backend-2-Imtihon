package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

func generateRandomNumbers(channel chan<- int, min, max, count int) {
	for i := 0; i < count; i++ {
		number := rand.Intn(max-min+1) + min
		channel <- number
		fmt.Println("Son:", number)
		time.Sleep(500 * time.Millisecond)
	}
	close(channel)
}

func calculateAndSendSquares(channelIn <-chan int, channelOut chan<- int, wg *sync.WaitGroup) {
	defer wg.Done()
	for num := range channelIn {
		square := num * num
		channelOut <- square
	}
	close(channelOut)
}

func main() {

	channel1 := make(chan int)
	channel2 := make(chan int)

	var wg sync.WaitGroup
	wg.Add(2)

	go generateRandomNumbers(channel1, 10, 30, rand.Intn(6)+5)
	go calculateAndSendSquares(channel1, channel2, &wg)

	go func() {
		defer wg.Done()
		for square := range channel2 {
			fmt.Println("Kvadrati:", square)
			time.Sleep(500 * time.Millisecond)
		}
	}()

	wg.Wait()
}
