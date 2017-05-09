all: intsum fpsum

fpsum: fpsum.f
	$(FC) fpsum.f -o fpsum

intsum: intsum.f
	$(FC) intsum.f -o intsum

clean:
	rm -f intsum fpsum *.o
