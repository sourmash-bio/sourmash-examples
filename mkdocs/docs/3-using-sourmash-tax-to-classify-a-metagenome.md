# Example: using `sourmash tax` to classify a metagenome

*[sourmash-bio/sourmash-examples#3](https://github.com/sourmash-bio/sourmash-examples/issues/3)*

---

First, download and sketch 64 genomes from [Awad et al., 2017](https://www.biorxiv.org/content/10.1101/155358v3) using the instructions in [Example: downloading, sketching, and searching a collection of FASTA files](1-downloading-sketching-and-searching-a-collection-of-FASTA-files.md). You'll need `podar-ref.zip`.

Next, you'll need [`podar-lineage.csv`](https://osf.io/4yhjw/) -
```shell
curl -L https://osf.io/4yhjw/download -o podar-lineage.csv
```

Next we'll make a fake metagenome consisting of a signature created by merging two *Shewanella baltica* signatures.

First, extract signatures with `Shewanella` in the name from `podar-ref.zip`:
```shell
sourmash sig grep Shewanella podar-ref.zip -o shew-matches.sig
```

Then, use `sourmash sig merge` to merge them into one signature:
```shell
sourmash sig merge shew-matches.sig -o shew-merge.sig
```
This is our fake metagenome that we'll use to demonstrate `sourmash tax`.

Now that we've got our fake metagenome, run `sourmash gather` to find the [minimum metagenome cover](https://www.biorxiv.org/content/10.1101/2022.01.11.475838v2):

```shell
sourmash gather shew-merge.sig podar-ref.zip -o out.csv
```
and then run `sourmash tax metagenome` to classify this as a "mixture" using the matching genomes from `out.csv` and their taxonomy in `podar-lineage.csv`:
```shell
sourmash tax -g out.csv -t podar-lineage.csv
```
and you should see:
```
,genus,1.000,Bacteria;Proteobacteria;Gammaproteobacteria;Alteromonadales;Shewanellaceae;Shewanella,491c0a81,,1.000,7886000
,species,1.000,Bacteria;Proteobacteria;Gammaproteobacteria;Alteromonadales;Shewanellaceae;Shewanella;Shewanella baltica,491c0a81,,1.000,7886000
```
which shows that this is 100% Shewanella, as, well expected :).