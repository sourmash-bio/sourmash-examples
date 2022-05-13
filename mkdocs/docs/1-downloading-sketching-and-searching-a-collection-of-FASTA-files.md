# Example: downloading, sketching, and searching a collection of FASTA files

*[sourmash-bio/sourmash-examples#1](https://github.com/sourmash-bio/sourmash-examples/issues/1)*

---

Download 64 genomes from [Awad et al., 2017](https://www.biorxiv.org/content/10.1101/155358v3):

```shell
curl -L https://osf.io/download/vbhy5 -o podar-ref.tar.gz
tar xzf podar-ref.tar.gz
```

Sketch them all in DNA space using default parameters, using GNU parallel per https://github.com/sourmash-bio/sourmash/issues/1796:
```shell
parallel -j 8 sourmash sketch dna {} -o {}.sig --name-from-first ::: $(ls *.fa)
```

Build a search database from all the signature files for k=31:
```shell
sourmash sig cat *.sig -k 31 -o podar-ref.zip
```

Search the database with one of the Shewanella genomes:
```shell
sourmash search 63.fa.sig podar-ref.zip
```

and you should see:
```
similarity   match
----------   -----
similarity   match
----------   -----
100.0%       NC_011663.1 Shewanella baltica OS223, complete genome
 32.1%       NC_009665.1 Shewanella baltica OS185, complete genome
```
