package unidecode

// `Unidecode` transliterates non-latin characters to their latin equivalents.
func Unidecode(input string) string {
	runes := []rune(input)
	result := ""

	for _, r := range runes {
		if s, found := Table[r]; found {
			result += s
		} else {
			result += string(r)
		}
	}

	return result
}
