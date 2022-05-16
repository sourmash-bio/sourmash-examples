# Example: create a metagenome signature from shotgun sequencing reads

*[sourmash-bio/sourmash-examples#12](https://github.com/sourmash-bio/sourmash-examples/issues/12)*

---

<!--
# TOML config options below.
---
frontpage = true # should it show up on front page?
priority = 4 # default priority 999 => in with all the rest :). 1 pushes it to top, etc.
---
-->

First, download two metagenome files:
```shell
curl -JLO ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR595/007/SRR5950647/SRR5950647_1.fastq.gz
curl -JLO ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR595/007/SRR5950647/SRR5950647_2.fastq.gz
```
This will create two 9.2MB files, `SRR5950647_1.fastq.gz` and `SRR5950647_1.fastq.gz`, containing shotgun metagenome reads from a stool sample ([see ENA record](https://www.ebi.ac.uk/ena/browser/view/SRR5950647?show=reads)).

Next, sketch the two metagenome files into a single signature:

```shell
sourmash sketch dna -p abund SRR5950647_?.fastq.gz -o SRR5950647.sig --name SRR5950647
```

This will produce a 150kb output file, `SRR5950647.sig`, containing a k-mer sketch built from both files.

You can see the details of the sketch with `sourmash sig describe`:
```shell
sourmash sig describe SRR5950647.sig
```



## Categories

This example belongs to the following categories:

 * [introductory examples](l-intro.md)
 * [working with FASTQ files](l-fastq.md)
 * [analyzing metagenomes](l-metagenome.md)


