# Example: using picklists and manifests to work with a small subset of a large database

*[sourmash-bio/sourmash-examples#4](https://github.com/sourmash-bio/sourmash-examples/issues/4)*

---

Suppose you want to search, compare, or otherwise work with only a small set of genomes from GTDB - perhaps only the ones with "Shewanella" in their name.

sourmash makes this easy!

Start by downloading the GTDB genomic representatives database from [the prepared databases](https://sourmash.readthedocs.io/en/latest/databases.html).
```shell
curl -JLO https://osf.io/3a6gn/download
```
This will download a 1.7 GB file named `gtdb-rs207.genomic-reps.dna.k31.zip`.

## Extract a manifest

Now extract a manifest containing all of the metadata about signatures in this zip file:
```shell
sourmash sig manifest gtdb-rs207.genomic-reps.dna.k31.zip  -o gtdb.mf --no-rebuild
```
(Here, the `--no-rebuild` just uses the manifest included in the zip file, rather than regenerating it from scratch.)

Use [csvtk](https://bioinf.shenwei.me/csvtk/usage/) to extract the `name` column and then use `grep` to select only those with `Shewanella` in their name -
```shell
csvtk cut -f name gtdb.mf | grep -i Shewanella > shew.names.csv
```
You should see that you have 98 matches:
```shell
wc -l shew.names.csv 
```

## Make a picklist from the manifest row names

Turn this list into a picklist file by providing a column header:
```
echo name > shew-picklist.csv
cat shew.names.csv >> shew-picklist.csv
``

## Get a query signature

Run:
```shell
sourmash sig grep GCA_002341165 gtdb-rs207.genomic-reps.dna.k31.zip -o shew-query.sig
```
to pick out just one of the Shewanella signatures, to use as a search query.

## Search using the picklist

Now you can search just the Shewanella genomes using the picklist:
```
sourmash search shew-query.sig gtdb-rs207.genomic-reps.dna.k31.zip --picklist shew-picklist.csv:name:name
```

This is much faster than searching the entire database (which contains 66k signatures) as long as you know you just want to search that specific list of Shewanella genomes.

**Note:** You could use just the space-delimited identifiers as a picklist, too, by using `ident` as the column type in the argument to `--picklist`, above. Please [see the picklist docs](https://sourmash.readthedocs.io/en/latest/command-line.html#using-picklists-to-subset-large-collections-of-signatures) for details.
