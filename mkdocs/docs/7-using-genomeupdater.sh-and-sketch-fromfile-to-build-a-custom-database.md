# Example: using `genome_updater.sh` and `sketch fromfile` to build a custom database

*[sourmash-bio/sourmash-examples#7](https://github.com/sourmash-bio/sourmash-examples/issues/7)*

---

I wanted to build a database with custom k-size values containing all genomes under [taxid Shewanella](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=22&lvl=3&lin=f&keep=1&srchmode=1&unlock).

First, I installed https://github.com/pirovc/genome_updater:
```shell
mamba install -y genome_updater
```

Then I ran:
```shell
genome_updater.sh -T 22 -d "genbank" -f "genomic.fna.gz" -o shew -t 6
```

which produced `shew/2022-05-06_13-58-43/`.

Next, I ran:
```shell
../database-examples/genbank-to-fromfile.py shew/2022-05-06_13-58-43/files/GCA_* \
        -S shew/2022-05-06_13-58-43/assembly_summary.txt -o shewanella.csv
```
(using a checkout of https://github.com/sourmash-bio/database-examples at [this release](https://github.com/sourmash-bio/database-examples/releases/tag/v0.1).)

This resulted in the following output:
```
Loaded 439 rows from 'shew/2022-05-06_13-58-43/assembly_summary.txt'
Any survivable errors will be reported to 'shewanella.csv.error-report.txt'
processing file 'GCA_000712635.2_SXM1.0_for_version_1_of_the_Shewanella_xiamenenprocessing file 'GCA_000947195.1_Shewanella_algae_MARS_14_genomic.fna.gz' (42/43processing file 'GCA_900079515.1_Shewanella_sp.Alg231_23_genomic.fna.gz' (426/43processing file 'GCA_900156405.1_IMG-taxon_2681812898_annotated_assembly_genomicprocessing file 'GCA_913058445.1_SRR3933262_bin.2_MetaBAT_v2.12.1_MAG_genomic.fnprocessed 439 files.
---
wrote 439 entries to 'shewanella.csv'
439 entries had only protein (and no genome) files.
```

Using this, I could then run `sourmash sketch fromfile shewanella.csv -p <my parameters here> ...`