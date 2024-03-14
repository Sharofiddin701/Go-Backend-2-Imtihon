package main

import "fmt"

func longestCommonPrefix(strs []string) string {
	prefix := ""

	if len(strs) == 0 {
		return prefix
	}

	for i := 0; i < len(strs[0]); i++ {
		for j := 1; j < len(strs); j++ {
			if strs[0][i] != strs[j][i] {
				return prefix
			}
		}

		prefix += string(strs[0][i])
	}

	return prefix
}
func main() {
	strs := []string{"flower", "flow", "floght"}
	fmt.Println(longestCommonPrefix(strs))
}
