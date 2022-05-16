# Example: analyze a metagenome using 66,000 GTDB genomic representatives

*[sourmash-bio/sourmash-examples#14](https://github.com/sourmash-bio/sourmash-examples/issues/14)*

---

<!--
# TOML config options below.
---
frontpage = true # should it show up on front page?
priority = 5 # default priority 999 => in with all the rest :). 1 pushes it to top, etc.
---
-->

This example uses the metagenome signature prepared in [Example: create a metagenome signature from shotgun sequencing reads](12-create-a-metagenome-signature-from-shotgun-sequencing-reads.md).

You'll also need to download the GTDB database as in [Example: download and search 66,000 GTDB genomes with a query genome](13-download-and-search-66000-GTDB-genomes-with-a-query-genome.md).

Now, run `sourmash gather`:
```shell
sourmash gather SRR5950647.sig gtdb-rs207.genomic-reps.dna.k31.zip
```

This should take about 5 minutes.

The output should look like this:
```
overlap     p_query p_match avg_abund
---------   ------- ------- ---------
383.0 kbp      2.0%    7.8%       1.6    GCF_003697165.2 Escherichia coli DSM ...
187.0 kbp      1.0%    5.0%       1.6    GCF_015074785.1 Prevotella copri stra...
142.0 kbp      0.7%    2.8%       1.4    GCF_000012825.1 Bacteroides vulgatus ...
164.0 kbp      0.3%    1.4%       1.7    GCF_019127135.1 Prevotella copri stra...
found less than 50.0 kbp in common. => exiting

found 4 matches total;
the recovered matches hit 4.0% of the abundance-weighted query
```

This a [minimum metagenome cover](https://www.biorxiv.org/content/10.1101/2022.01.11.475838v2) for the metagenome, based on the genomes in the GTDB database: in brief, it provides a shortest list of genomes that contain all of the known content in the metagenome (in this case, about 4%).

Note: more of the metagenome might be matched if you used a larger database or a database that included eukaryotic and/or host sequence.



## Categories

This example belongs to the following categories:

 * [examples using GTDB RS207](l-gtdb-rs207.md)
 * [introductory examples](l-intro.md)
 * [working with FASTQ files](l-fastq.md)
 * [analyzing metagenomes](l-metagenome.md)


