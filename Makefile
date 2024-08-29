all:
	@dune build

test:
	@dune runtest

install:
	@dune install

uninstall:
	@dune uninstall

check: test

.PHONY: clean all check test install uninstall

clean:
	dune clean

# To make a release:
# + check that [make] and [make test] succeed
# + check that everything has been committed
# + check that the CI has succeeded
# + check that [opam lint] is happy
# + make sure that the package is not pinned: [opam pin remove cppo]
# + create a tag, e.g. [git tag vX.Y.Z]
#   (the tag should not be annotated, as it shows up in [cppo -version])
# + run [make publishX.Y.Z]

publish%:
	opam publish --tag=v$* -v $* ocaml-community/cppo
