CFLAGS += -O3 -funroll-loops -ffast-math -fno-semantic-interposition -flto -DNDEBUG=1 $(PGOFLAGS)
LDLIBS = -lm 

PGO_GENFLAGS = -fprofile-generate -pg --coverage
PGO_USEFLAGS = -fprofile-use
MUSCLE_PROF_FLAGS = -tree2 benchmark.nwk -cluster2 neighborjoining -distance1 kmer20_4 -diags -sv -maxiters 2

CPPSRC = $(sort $(wildcard *.cpp))
CPPOBJ	= $(subst .cpp,.o,$(CPPSRC))

default: muscle-pgo


$(CPPOBJ): %.o: %.cpp
	$(CXX) -c $(CFLAGS) $< -o $@

default: muscle-pgo

muscle: $(CPPOBJ)
	$(CXX) $(CFLAGS) -o muscle $(CPPOBJ) $(LDLIBS)

muscle-pgo: 
	+$(MAKE) PGOFLAGS="$(PGO_GENFLAGS)" muscle
	./muscle -quiet -in benchmark.fa -out benchmark.faa $(MUSCLE_PROF_FLAGS)
	rm *.o muscle
	+$(MAKE) PGOFLAGS="$(PGO_USEFLAGS)" muscle
