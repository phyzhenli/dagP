OBJS = src/common/dgraph.o src/common/dgraphTraversal.o src/common/utils.o src/common/info.o src/common/undirPartitioning.o src/common/option.o src/common/debug.o src/common/clustering.o src/common/dgraphReader.o src/common/dgraphDotReader.o src/recBisection/vcycle2way.o src/recBisection/initialBisection.o src/recBisection/rvcycle.o src/recBisection/dgraphBisection.o src/recBisection/refinementBis.o src/recBisection/dagP.o

DAGP_INC = -Isrc/common -Isrc/recBisection
METIS_INC = 
METIS_LIB = 

build: useapi

useapi: src/useapi.cpp libdagp.a
	g++ -Wall -o $@ $^ $(DAGP_INC) $(METIS_LIB) -lm

libdagp.a: $(OBJS)
	ar crv $@ $(OBJS)

src/common/dgraph.o: src/common/dgraph.c
src/common/dgraphTraversal.o: src/common/dgraphTraversal.c
src/common/utils.o: src/common/utils.c
src/common/info.o: src/common/info.c
src/common/undirPartitioning.o: src/common/undirPartitioning.c
	gcc -c $^ -o $@ $(DAGP_INC) -DdagP_METIS $(METIS_INC)
src/common/option.o: src/common/option.c
src/common/debug.o: src/common/debug.c
src/common/clustering.o: src/common/clustering.c
	gcc -c $^ -o $@ $(DAGP_INC)
src/common/dgraphReader.o: src/common/dgraphReader.c
src/common/dgraphDotReader.o: src/common/dgraphDotReader.cpp
src/recBisection/vcycle2way.o: src/recBisection/vcycle2way.c
	gcc -c $^ -o $@ $(DAGP_INC)
src/recBisection/initialBisection.o: src/recBisection/initialBisection.c
	gcc -c $^ -o $@ $(DAGP_INC) -DdagP_METIS $(METIS_INC)
src/recBisection/rvcycle.o: src/recBisection/rvcycle.c
	gcc -c $^ -o $@ $(DAGP_INC)
src/recBisection/dgraphBisection.o: src/recBisection/dgraphBisection.c
	gcc -c $^ -o $@ $(DAGP_INC)
src/recBisection/refinementBis.o: src/recBisection/refinementBis.c
	gcc -c $^ -o $@ $(DAGP_INC)
src/recBisection/dagP.o: src/recBisection/dagP.c
	gcc -c $^ -o $@ $(DAGP_INC)



.PHONY: clean
clean:
	rm $(OBJS) useapi libdagp.a