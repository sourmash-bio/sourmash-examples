# Example: create a signature by downloading and sketching a genome sequence

*[sourmash-bio/sourmash-examples#11](https://github.com/sourmash-bio/sourmash-examples/issues/11)*

---

<!--
# yaml config options below.
---
frontpage: True # should it show up on front page?
priority: 2 # default priority 999 => in with all the rest :). 1 pushes it to top, etc.
---
-->

first, download a genome:

```shell
curl -JLO  https://osf.io/bjh2y/download
```

This will create a 1.4MB file `GCF_000005845.2_ASM584v2_genomic.fna.gz` containing an *E. coli* K-12 genome for strain MG1655 (see [Genbank entry](https://www.ncbi.nlm.nih.gov/data-hub/genome/GCF_000005845.2/)).

Next, calculate the signature using `sourmash sketch dna`:

```shell
sourmash sketch dna -p abund GCF_000005845.2_ASM584v2_genomic.fna.gz
```
here, the `-p abund` tells `sourmash sketch` to also retain the abundance (frequency) information for k-mers.

This will produce a *signature file*, `GCF_000005845.2_ASM584v2_genomic.fna.gz.sig`, that is much smaller than the original genome file (86k vs 1.4 MB).

You can view the metadata properties of this signature with `sourmash sig describe`:
```shell
sourmash sig describe GCF_000005845.2_ASM584v2_genomic.fna.gz.sig
```

---

This example was taken from [Large scale sequence comparisons with *sourmash*, Pierce et al., 2019](https://f1000research.com/articles/8-1006).