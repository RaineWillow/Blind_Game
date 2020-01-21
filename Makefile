all:
	fbc main.bas

run:
	fbc main.bas
	./main
	rm main.exe

clean:
	rm main.exe
