// This Go program generates a machine ID in the same way as errtracker
// in snapd does meaning you can work out if your machine has submitted
// any massive chunks of private information to daisy.
// https://errors.ubuntu.com/user/<id>

// On some machines the machine-id is in /etc
// Owain Kenway

package main

import (
	"fmt"
	"io/ioutil"
	"crypto/sha512"
	"bytes"
)

func main() {
	var hash string
	var rawid []byte
	var id []byte

	rawid,_ =  ioutil.ReadFile("/var/lib/dbus/machine-id")
	id = bytes.TrimSpace(rawid)
	hash = fmt.Sprintf("%x", sha512.Sum512(id))
	fmt.Printf("%s\n", hash)
}
