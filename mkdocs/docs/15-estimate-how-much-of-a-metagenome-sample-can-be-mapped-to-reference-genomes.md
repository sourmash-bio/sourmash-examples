# Example: estimate how much of a metagenome sample can be mapped to reference genomes

*[sourmash-bio/sourmash-examples#15](https://github.com/sourmash-bio/sourmash-examples/issues/15)*

---

One question we frequently have about a metagenome is how much of it is _known_, and one way this can be answered is by asking **how many of my metagenome reads can be mapped to a set of reference genome(s)?**

This can be estimated with sourmash fairly quickly, using any collection of reference genomes you have available!

In [Example: analyze a metagenome using 66,000 GTDB genomic representatives](14-analyze-a-metagenome-using-66000-GTDB-genomic-representatives.md), we showed how to analyze a metagenome's contents using `sourmash gather` against the GTDB genomic representatives database. The output was:

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

and it turns out that these numbers provide accurate estimates for mapping rates.

Specifically:

the `p_query` column tells you **what fraction of the metagenome reads will map to each genome.** So here about 2% of the reads will map to  `GCF_003697165.2`, an E. coli genome, and about 1% of the reads will map to `GCF_015074785.1`, a Prevotella genome.

The `p_match` column tells you **what fraction of the bases in the genome will be covered by the mapped reads**. So for the `GCF_003697165.2` E. coli genome, about 7.8% of the genome will be covered by reads from this metagenome.

Finally, the statement "the recovered matches hit 4.0% of the abundance-weighted query" tells you that **overall, 4% of the reads in the metagenome** will map to your database.**

All of these numbers (and many more) are also available in the CSV output. See [this section of the sourmash docs](https://sourmash.readthedocs.io/en/latest/classifying-signatures.html#appendix-a-how-sourmash-gather-works) for some details on how `sourmash gather` works, what is output to a CSV file, and  how the CSV output

## Caveats and details

A few terms and conditions apply -

* you need to use abundance-weighted signatures, as calculated here: [Example: create a metagenome signature from shotgun sequencing reads](12-create-a-metagenome-signature-from-shotgun-sequencing-reads.md)
* the fraction of the genome that can be classified against a database very much depends on that database! So you  want to use the most inclusive database that meets your needs. This can include both [prepared databases](https://sourmash.readthedocs.io/en/latest/databases.html) like Genbank, and private databases (see [Example: download, sketch, and search a collection of FASTA files](1-download-sketch-and-search-a-collection-of-FASTA-files.md)).

## Publications and software

If you're curious about the scientific details and want to see this applied to some larger metagenomes, please see [Lightweight compositional analysis of metagenomes with FracMinHash and minimum metagenome covers, Irber et al., 2022](https://www.biorxiv.org/content/10.1101/2022.01.11.475838v2).

Last but not least, the [genome-grist software](https://dib-lab.github.io/genome-grist/) software provides a workflow that will map Illumina metagenome reads to a collection of reference genomes.

## Version notes

The summary output statement (`the recovered matches hit 4.0% of the abundance-weighted query`) was introduced in sourmash v4.2.4, with PR [sourmash-bio/sourmash#1819](https://github.com/sourmash-bio/sourmash/pull/1819). Prior to that, sourmash didn't distinguish between abundance-weighted and flat output in its text output (although the numbers were weighted properly - it just didn't tell you!)

In the future we plan to output both flat and abundance-weighted numbers; see [sourmash-bio/sourmash#1818](https://github.com/sourmash-bio/sourmash/issues/1818).



## Categories

This example belongs to the following categories:

 * [examples using sourmash v4.2 functionality](l-sourmash-v4.2.md)
 * [examples using GTDB RS207](l-gtdb-rs207.md)
 * [intermediate examples](l-intermediate.md)
 * [analyzing metagenomes](l-metagenome.md)
 * [examples that refer to read mapping](l-mapping.md)


