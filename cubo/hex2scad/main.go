package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

func hexToRGBNormalized(hex string) (float64, float64, float64, error) {
	hex = strings.TrimPrefix(hex, "#")
	if len(hex) != 6 {
		return 0, 0, 0, fmt.Errorf("formato inválido: debe tener 6 caracteres hexadecimales")
	}

	r, err1 := strconv.ParseInt(hex[0:2], 16, 64)
	g, err2 := strconv.ParseInt(hex[2:4], 16, 64)
	b, err3 := strconv.ParseInt(hex[4:6], 16, 64)

	if err1 != nil || err2 != nil || err3 != nil {
		return 0, 0, 0, fmt.Errorf("error al convertir los componentes RGB")
	}

	return float64(r) / 255, float64(g) / 255, float64(b) / 255, nil
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Uso: hex2scad #RRGGBB")
		return
	}

	hex := os.Args[1]
	r, g, b, err := hexToRGBNormalized(hex)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	fmt.Printf("color([%.3f, %.3f, %.3f]);\n", r, g, b)
}
