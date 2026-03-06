use ensembl_local
show tables;
+-------------------------+
| Tables_in_ensembl_local |
+-------------------------+
| gene                    |
| seq_region              |
| transcript              |
+-------------------------+

desc gene;
+-------------------------+-------------------+------+-----+---------+----------------+
| Field                   | Type              | Null | Key | Default | Extra          |
+-------------------------+-------------------+------+-----+---------+----------------+
| gene_id                 | int unsigned      | NO   | PRI | NULL    | auto_increment |
| biotype                 | varchar(40)       | NO   |     | NULL    |                |
| analysis_id             | smallint unsigned | NO   | MUL | NULL    |                |
| seq_region_id           | int unsigned      | NO   | MUL | NULL    |                |
| seq_region_start        | int unsigned      | NO   |     | NULL    |                |
| seq_region_end          | int unsigned      | NO   |     | NULL    |                |
| seq_region_strand       | tinyint           | NO   |     | NULL    |                |
| display_xref_id         | int unsigned      | YES  | MUL | NULL    |                |
| source                  | varchar(40)       | NO   |     | NULL    |                |
| description             | text              | YES  |     | NULL    |                |
| is_current              | tinyint(1)        | NO   |     | 1       |                |
| canonical_transcript_id | int unsigned      | NO   | MUL | NULL    |                |
| stable_id               | varchar(128)      | YES  | MUL | NULL    |                |
| version                 | smallint unsigned | YES  |     | NULL    |                |
| created_date            | datetime          | YES  |     | NULL    |                |
| modified_date           | datetime          | YES  |     | NULL    |                |
+-------------------------+-------------------+------+-----+---------+----------------+

desc transcript;
+--------------------------+-------------------+------+-----+---------+----------------+
| Field                    | Type              | Null | Key | Default | Extra          |
+--------------------------+-------------------+------+-----+---------+----------------+
| transcript_id            | int unsigned      | NO   | PRI | NULL    | auto_increment |
| gene_id                  | int unsigned      | YES  | MUL | NULL    |                |
| analysis_id              | smallint unsigned | NO   | MUL | NULL    |                |
| seq_region_id            | int unsigned      | NO   | MUL | NULL    |                |
| seq_region_start         | int unsigned      | NO   |     | NULL    |                |
| seq_region_end           | int unsigned      | NO   |     | NULL    |                |
| seq_region_strand        | tinyint           | NO   |     | NULL    |                |
| display_xref_id          | int unsigned      | YES  | MUL | NULL    |                |
| source                   | varchar(40)       | NO   |     | ensembl |                |
| biotype                  | varchar(40)       | NO   |     | NULL    |                |
| description              | text              | YES  |     | NULL    |                |
| is_current               | tinyint(1)        | NO   |     | 1       |                |
| canonical_translation_id | int unsigned      | YES  | UNI | NULL    |                |
| stable_id                | varchar(128)      | YES  | MUL | NULL    |                |
| version                  | smallint unsigned | YES  |     | NULL    |                |
| created_date             | datetime          | YES  |     | NULL    |                |
| modified_date            | datetime          | YES  |     | NULL    |                |
+--------------------------+-------------------+------+-----+---------+----------------+


desc seq_region;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| seq_region_id   | int unsigned | NO   | PRI | NULL    | auto_increment |
| name            | varchar(255) | NO   | MUL | NULL    |                |
| coord_system_id | int unsigned | NO   | MUL | NULL    |                |
| length          | int unsigned | NO   |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+

Question_4
SELECT gene_id, COUNT(*) AS transcript_count FROM transcript GROUP BY gene_id limit 10;
+---------+------------------+
| gene_id | transcript_count |
+---------+------------------+
|     554 |                1 |
|     555 |                1 |
|     556 |                1 |
|     557 |                1 |
|     558 |                1 |
|     559 |                1 |
|     560 |                1 |
|     562 |                1 |
|     563 |                1 |
|     564 |                1 |
+---------+------------------+

---Question_5---
SELECT COUNT(DISTINCT biotype) AS unique_gene_biotypes FROM gene;
+----------------------+
| unique_gene_biotypes |
+----------------------+
|                   40 |
+----------------------+

SELECT DISTINCT biotype FROM gene limit 10;
+----------------------+
| biotype              |
+----------------------+
| Mt_tRNA              |
| Mt_rRNA              |
| protein_coding       |
| LRG_gene             |
| snRNA                |
| rRNA                 |
| misc_RNA             |
| pseudogene           |
| processed_pseudogene |
| lncRNA               |
+----------------------+

SELECT COUNT(DISTINCT biotype) AS unique_transcript_biotypes FROM transcript;
+----------------------------+
| unique_transcript_biotypes |
+----------------------------+
|                         46 |
+----------------------------+


SELECT DISTINCT biotype FROM transcript limit 10;
+----------------------+
| biotype              |
+----------------------+
| Mt_tRNA              |
| Mt_rRNA              |
| protein_coding       |
| LRG_gene             |
| snRNA                |
| misc_RNA             |
| rRNA                 |
| pseudogene           |
| processed_pseudogene |
| retained_intron      |
+----------------------+

---Question_6---

SELECT biotype, COUNT(*) AS gene_count FROM gene GROUP BY biotype ORDER BY gene_count DESC;
+------------------------------------+------------+
| biotype                            | gene_count |
+------------------------------------+------------+
| protein_coding                     |      23231 |
| lncRNA                             |      20715 |
| processed_pseudogene               |      10889 |
| unprocessed_pseudogene             |       3454 |
| misc_RNA                           |       2419 |
| snRNA                              |       2094 |
| miRNA                              |       1945 |
| LRG_gene                           |       1324 |
| transcribed_unprocessed_pseudogene |       1176 |
| TEC                                |       1117 |
| snoRNA                             |       1020 |
| transcribed_processed_pseudogene   |        583 |
| rRNA_pseudogene                    |        516 |
| IG_V_pseudogene                    |        300 |
| IG_V_gene                          |        228 |
| transcribed_unitary_pseudogene     |        163 |
| TR_V_gene                          |        160 |
| unitary_pseudogene                 |        108 |
| TR_J_gene                          |         93 |
| rRNA                               |         71 |
| IG_D_gene                          |         64 |
| scaRNA                             |         51 |
| TR_V_pseudogene                    |         46 |
| IG_J_gene                          |         24 |
| IG_C_gene                          |         23 |
| Mt_tRNA                            |         22 |
| pseudogene                         |         20 |
| artifact                           |         19 |
| IG_C_pseudogene                    |         11 |
| ribozyme                           |          9 |
| TR_C_gene                          |          8 |
| TR_D_gene                          |          6 |
| sRNA                               |          6 |
| IG_J_pseudogene                    |          6 |
| vault_RNA                          |          4 |
| TR_J_pseudogene                    |          4 |
| translated_processed_pseudogene    |          2 |
| Mt_rRNA                            |          2 |
| IG_pseudogene                      |          1 |
| scRNA                              |          1 |
+------------------------------------+------------+

---Question_7---
SELECT s.name AS chromosome, COUNT(*) AS gene_count FROM gene g JOIN seq_region s ON g.seq_region_id = s.seq_region_id GROUP BY s.name limit 20;
+------------+------------+
| chromosome | gene_count |
+------------+------------+
| KI270744.1 |          1 |
| GL000220.1 |          4 |
| GL000213.1 |          2 |
| GL000195.1 |          2 |
| KI270750.1 |          1 |
| GL000219.1 |          1 |
| KI270442.1 |          2 |
| GL000216.2 |          1 |
| GL000218.1 |          1 |
| GL000205.2 |          1 |
| KI270734.1 |          4 |
| KI270726.1 |          2 |
| GL000225.1 |          1 |
| KI270713.1 |          4 |
| KI270728.1 |          6 |
| KI270733.1 |          4 |
| GL000009.2 |          1 |
| KI270721.1 |          4 |
| KI270711.1 |          1 |
| KI270731.1 |          2 |
+------------+------------+