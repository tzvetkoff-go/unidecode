package unidecode

import (
	"testing"
	"runtime"
	"path"
	"fmt"
)

type test struct {
	where		string
	input		string
	expected	string
}

var tests = []test{
	{
		where:		here(),
		input:		"北亰",
		expected:	"Bei Jing ",
	},
	{
		where:		here(),
		input:		"Чебурашка",
		expected:	"Cheburashka",
	},
}

func TestUnidecode(t *testing.T) {
	for _, tt := range tests {
		r := Unidecode(tt.input)

		if r != tt.expected {
			t.Errorf("%s: got %q, expected %q", tt.where, r, tt.expected)
		}
	}
}

func here() string {
	_, file, line, _ := runtime.Caller(1)
	return fmt.Sprintf("%s:%d", path.Base(file), line)
}
