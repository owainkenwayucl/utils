all: intsum fpsum fpmean

fpsum: fpsum.f
	$(FC) fpsum.f -o fpsum

intsum: intsum.f
	$(FC) intsum.f -o intsum

fpmean: fpmean.f
	$(FC) fpmean.f -o fpmean


clean:
	rm -f intsum fpsum fpmean *.o
