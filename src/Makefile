all: intsum fpsum fpmean fpmin fpmax

fpsum: fpsum.f
	$(FC) fpsum.f -o fpsum

intsum: intsum.f
	$(FC) intsum.f -o intsum

fpmean: fpmean.f
	$(FC) fpmean.f -o fpmean

fpmin: fpmin.f
	$(FC) fpmin.f -o fpmin

fpmax: fpmax.f
	$(FC) fpmax.f -o fpmax

clean:
	rm -f intsum fpsum fpmean fpmin fpmax *.o
