# Example: download and search 66,000 GTDB genomes with a query genome

*[sourmash-bio/sourmash-examples#13](https://github.com/sourmash-bio/sourmash-examples/issues/13)*

---

<!--
# yaml config options below.
---
frontpage: True # should it show up on front page?
priority: 3 # default priority 999 => in with all the rest :). 1 pushes it to top, etc.
---
-->

You'll need to build the genome signature file in [Example: create a signature by downloading and sketching a genome sequence](11-create-a-signature-by-downloading-and-sketching-a-genome-sequence.md) first.

Then, download the GTDB genomic representatives database:
```shell
curl -JLO https://osf.io/3a6gn/download
```

This will create a 1.7 GB file, `gtdb-rs207.genomic-reps.dna.k31.zip`,  which contains 66,000 genome sketches from the [Genome Taxonomy Database, release 207](https://forum.gtdb.ecogenomic.org/t/announcing-gtdb-r07-rs207/264).

Now search the genome against the GTDB database:
```shell
sourmash search GCF_000005845.2_ASM584v2_genomic.fna.gz.sig gtdb-rs207.genomic-reps.dna.k31.zip
```

This will take about 5 minutes.

The output will look like this:
```
8 matches; showing first 3:
similarity   match
----------   -----
 29.9%       GCF_003697165.2 Escherichia coli DSM 30083 = JCM 1649 = A...
 14.6%       GCF_002965065.1 Escherichia sp. MOD1-EC7003 strain=MOD1-E...
 14.2%       GCF_000026225.1 Escherichia fergusonii ATCC 35469 strain=...
```

showing that this genome is, indeed, an *E. coli* genome :).

The similarity in the left column is [Jaccard similarity](https://en.wikipedia.org/wiki/Jaccard_index), calculated using the k-mers in the query genome sketch against the k-mers in each of the database genome sketches.

You can increase the number of output results with `-n`:
```
8 matches:
similarity   match
----------   -----
 29.9%       GCF_003697165.2 Escherichia coli DSM 30083 = JCM 1649 = A...
 14.6%       GCF_002965065.1 Escherichia sp. MOD1-EC7003 strain=MOD1-E...
 14.2%       GCF_000026225.1 Escherichia fergusonii ATCC 35469 strain=...
 14.1%       GCF_902498915.1 Escherichia ruysiae, OPT1704
 14.1%       GCF_004211955.1 Escherichia sp. E1V33 strain=E1V33, ASM42...
 13.5%       GCF_005843885.1 Escherichia sp. E4742 strain=E4742, ASM58...
 10.3%       GCF_001660175.1 Escherichia sp. B1147 strain=B1147, ASM16...
 10.1%       GCF_011881725.1 Escherichia coli strain=SCPM-O-B-8794, AS...
```

and you can record the results in a CSV file with `-o <output.csv>`.