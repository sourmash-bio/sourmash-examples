# Example: compare and visualize the similarity of many genomes using Average Nucleotide Identity (ANI)

*[sourmash-bio/sourmash-examples#16](https://github.com/sourmash-bio/sourmash-examples/issues/16)*

---

with sourmash v4.4, sourmash can now estimate Average Nucleotide Identity between genomes: this is the fraction of bases that would be identical in a pairwise alignment. However, sourmash estimates this based on k-mers, instead of using alignments. This is fast and lightweight, and doesn't need access to the full genomes!

Let's use ANI with `sourmash compare` and `sourmash plot` to look at the relationship between 12 *E. coli* genomes.

First, you'll need to download the GTDB genomic-reps database, containing 66k genomes, as in [Example: download and search 66,000 GTDB genomes with a query genome](13-download-and-search-66000-GTDB-genomes-with-a-query-genome.md).

Then, run `compare`, selecting just the `Escherichia` genomes:
```shell
sourmash compare --include Escherichia gtdb-rs207.genomic-reps.dna.k31.zip --ani -o ecoli-ani.cmp
```

This creates a numpy comparison matrix in `ecoli-ani.cmp` (you can also generate a CSV output with `--csv`).

Now, use `plot` to quickly visualize the comparison matrix:
```shell
sourmash plot ecoli-ani.cmp
```

This will produce an image `ecoli-ani.cmp/matrix.png`:

![ecoli-ani cmp matrix](https://user-images.githubusercontent.com/51016/168434572-0a358eea-ee64-4cbd-a1ad-1cfbeeba7846.png)

This plot shows the clade structure of the 12 `E. coli` genomes, including three that have no detectable ANI similarity to any other ANI genomes.

The genome names corresponding to the label numbers can be found in the `ecoli-ani.cmp.labels.txt` file.

## Caveats and details

ANI can be estimated by sourmash from ~85% to 99%, depending on the k-mer size used. See https://github.com/sourmash-bio/sourmash/issues/1859 for some numbers for k=21 and k=31.

ANI estimates are somewhat dependent on the software and parameters used to calculate them. We are working on a systematic comparison of sourmash's ANI estimates with other ANI software!

sourmash ANI estimates are only available for scaled signatures (the default, when signatures are generated with `sourmash sketch`).

In order to accurately estimate ANI, sourmash signatures need to have enough hashes for the calculation; this is dependent on both the size of the genome(s) and the scaled factor used to generate the signatures. sourmash will output warnings to stderr when the sketches are too small to accurately estimate ANI.

Some details on how sourmash estimates ANI are [in the sourmash docs](https://sourmash.readthedocs.io/en/latest/classifying-signatures.html?highlight=ani#estimating-ani-from-fracminhash-comparisons).

## Citations

The analytical work underlying the ANI calculations is introduced in [Debiasing FracMinHash and deriving confidence intervals for mutation rates across a wide range of evolutionary distances, Hera et al., 2022](https://www.biorxiv.org/content/10.1101/2022.01.11.475870v2).


## Categories

This example belongs to the following categories:

 * [examples using sourmash v4.4 functionality](l-sourmash-v4.4.md)
 * [using Average Nucleotide Identity (ANI)](l-ani.md)
 * [plots and other output visualizations](l-plotting.md)


