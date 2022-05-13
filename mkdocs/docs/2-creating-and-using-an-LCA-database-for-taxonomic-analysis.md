# Example: creating and using an LCA database for taxonomic analysis

*[sourmash-bio/sourmash-examples#2](https://github.com/sourmash-bio/sourmash-examples/issues/2)*

---

First, download and sketch 64 genomes from [Awad et al., 2017](https://www.biorxiv.org/content/10.1101/155358v3) using the instructions in [Example: downloading, sketching, and searching a collection of FASTA files](1-downloading-sketching-and-searching-a-collection-of-FASTA-files.md). You'll need `podar-ref.zip`.

Next, you'll need [`podar-lineage.csv`](https://osf.io/4yhjw/) -
```shell
curl -L https://osf.io/4yhjw/download -o podar-lineage.csv
```

Now create an LCA database in SQL format:
```shell
sourmash lca index podar-lineage.csv podar-ref.lca.sql podar-ref.zip \
    -F sql -C 3 --split-identifiers
```

Extract one of the Shewanella genomes from `podar-ref.zip` using `sourmash sig grep`:
```shell
sourmash sig grep OS223 podar-ref.zip -o shew-os223.sig
```

and now you can classify genomes with `lca classify`:
```shell
sourmash lca classify --query shew-os223.sig --db podar-ref.lca.sql
```

and you should see it classified correctly:
```
"NC_011663.1 Shewanella baltica OS223, complete genome",found,Bacteria,Proteobacteria,Gammaproteobacteria,Alteromonadales,Shewanellaceae,Shewanella,Shewanella baltica,Shewanella baltica OS223
```

You can use `lca summarize` to classify the genome as if it were a metagenome mixture, too:
```
sourmash lca summarize --query shew-os223.sig --db podar-ref.lca.sql
```
and you should see:
```
50.5%   278   Bacteria;Proteobacteria;Gammaproteobacteria;Alteromonadales;Shewanellaceae;Shewanella;Shewanella baltica;Shewanella baltica OS223   shew-os223.sig:38729c63 NC_011663.1 Shewanella baltica OS223, complete genome
100.0%   550   Bacteria;Proteobacteria;Gammaproteobacteria;Alteromonadales;Shewanellaceae;Shewanella;Shewanella baltica   shew-os223.sig:38729c63 NC_011663.1 Shewanella baltica OS223, complete genome
```
which indicates that about 50% of the content is _not_ strain specific, and is shared with the other Shewanella in the collection.
