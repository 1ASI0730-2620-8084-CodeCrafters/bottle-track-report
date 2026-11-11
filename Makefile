# Compila el informe a PDF.  Uso:  make pdf   |   make clean
PDF = build/informe-bottletrack.pdf

.PHONY: pdf clean

pdf:
	mkdir -p build
	pandoc --defaults=config/build.yaml
	@echo "Listo: $(PDF)"

clean:
	rm -rf build