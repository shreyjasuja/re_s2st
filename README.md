
# Reproducing Speech-to-Text Translation Results

## About the authors and this work

This repository contains the code and methodology used to reproduce the results from the studies "SeamlessM4T: Massively Multilingual & Multimodal Machine Translation" [1] and "Robust Speech Recognition via Large-Scale Weak Supervision" [2]. 

This work is carried out by **Shrey Jasuja** from NYU Tandon School of Engineering under the guidance of **Prof. Fraida Fund** as part of a reproducibility study in the field of speech-to-text translation using large multitask models.

## Chameleon Testbed and Trovi Artifacts

The research utilized the Chameleon [3] testbed, which provides a bare-metal reconfiguration system, allowing control over computational resources which is crucial for reproducibility studies. The following resources were used on Chameleon testbeds while conducting this study:

- **GPU Server:** We used RTX 6000 GPU on Chameleon to perform model inference and evaluation over the CoVoST 2 and FLEURS datasets.
- **Object Store:** Object store helped us to handle the large datasets across different experimental configurations
- **Trovi Artifact:** We used Trovi to share our research artifacts, ensuring that others in the research community can access and utilize our exact datasets, models, and configurations.

Here is the link to the Trovi artifact: https://chameleoncloud.org/experiment/share/3acdf3d7-08dc-4680-8db5-a62bdb07cc11

## Summary of Results

Our findings are consistent with the published results, confirming the claims made in the original studies for most models. The results are demonstrated through BLEU scores and are detailed in the repository. Here are our reproduced claims. Note, that the values in the parenthesis are the values from the original claim in the paper.

Reproduced results for Table 4. X→en Speech translation performance in Radford et al. (2023) [2]. The results are in BLEU scores and looks consistent with the original claims. The missing entries for XMEF-X, Maestro and mSLAM-CTC are due to the unavailability of the model checkpoints.

| Model                 | High              | Mid               | Low               | All               |
|-----------------------|-------------------|-------------------|-------------------|-------------------|
| XMEF-X                | (34.2)            | (20.2)            | (5.9)             | (14.7)            |
| XLS-R (2B)            | 36.1 (36.1)       | 27.7 (27.7)       | 15.1 (15.1)       | 22.1 (22.1)       |
| mSLAM-CTC (2B)        | (37.8)            | (29.6)            | (18.5)            | (24.8)            |
| Maestro               | (38.2)            | (31.3)            | (18.4)            | (25.2)            |
| Zero-Shot Whisper     | 36.3 (36.2)       | 33.6 (32.6)       | 24.9 (25.2)       | 29.2 (29.1)       |


Reproduced results for Table 16: Multitasking X2T results in Barrault et al. (2023) [1]. The results below show columns only for the X→en translation task as X→en is the focus of this reproducibility study. The results look consistent with the original claims. We notice slight deviations in the results for the model whisper-large-v2 on FLEURS dataset, which could be due to the omission of decoding strategies by the authors in the original study.

| Model              | size | FLEURS X→eng (n=81) | CoVoST 2 X→eng (n=21) |
|--------------------|------|--------------------:|----------------------:|
| XLS-R-2B-S2T       | 2.6B |                  () |           22.1 (22.1) |
| WHISPER-LARGE-v2   | 1.5B |         16.7 (17.9) |           29.2 (29.1) |
| AUDIOPaLM-2-8B-AST | 8.0B |              (19.7) |                (37.8) |
| SEAMLESSM4T-MEDIUM | 1.2B |         20.3 (20.9) |           31.3 (29.8) |
| SEAMLESSM4T-LARGE  | 2.3B |         23.4 (24.0) |           34.3 (34.1) |


Reproduced results for Table 17: Fleurs S2TT X–eng by resource-level results in Barrault et al. (2023) [1]. The missing entries for the model AUDIOPaLM-2-8B-AST are due to the unavailability of the model checkpoints. The results are consistent with the original claims with slight deviations in the results for the model whisper-large-v2 on FLEURS dataset for the same reason as mentioned above.


| Model                 | High (n=15)       | Medium (n=25)     | Low (n=34)        | Low† (n=23)       |
|-----------------------|-------------------|-------------------|-------------------|-------------------|
| WHISPER-LARGE-v2      | 23.7 (24.2)       | 17.5 (19.4)       | 14.8 (16.1)       | 17.0 (18.1)       |
| AUDIOPALM-2-8B-AST    | (27.9)            | (20.9)            | (18.0)            | (22.0)            |
| SEAMLESSM4T-MEDIUM    | 23.7 (23.9)       | 21.1 (21.8)       | 21.7 (22.2)       | 22.8 (23.5)       |
| SEAMLESSM4T-LARGE     | 26.6 (26.9)       | 24.5 (25.2)       | 24.9 (25.4)       | 26.5 (27.0)       |

In the following table, we reproduce the results for Table 14: Comparison against cascaded ASR +T2TT models on Fleurs S2TT in Barrault et al. (2023) [1]. We only show the results for the X→en translation task as X→en is the focus of this reproducibility study. We reproduced only one cascaded model, which is WHISPER-MEDIUM (ASR) + NLLB-1.3B as part of this study. The results for direct models are consistent with the original claims. The reproduced results for the cascaded model WHISPER-MEDIUM (ASR) + NLLB-1.3B differ which could be due to the omission of some design choices made by the authors in the original study.

| Model                                     | Type     | Size | X-eng (n=81)     | eng-X (n=88)     |
|-------------------------------------------|----------|------|------------------|------------------|
| WHISPER-MEDIUM (ASR) + NLLB-1.3B          | cascaded | 2B   | (19.7)           | (20.5)           |
| WHISPER-MEDIUM (ASR) + NLLB-3.3B          | cascaded | 4B   | (20.4)           | (21.8)           |
| WHISPER-LARGE-v2 (ASR) + NLLB-1.3B        | cascaded | 2.8B | 18.2 (22.0)      | (21.0)           |
| WHISPER-LARGE-v2 (ASR) + NLLB-3.3B        | cascaded | 4.8B | (22.7)           | (22.2)           |
| WHISPER-LARGE-v2                          | direct   | 1.5B | 16.7 (17.9)      | (-)              |
| AudioPaLM-2-8B-AST                        | direct   | 8B   | (19.7)           | (-)              |
| SEAMLESSM4T-MEDIUM                        | direct   | 1B   | 20.3 (20.9)      | (19.2)           |
| SEAMLESSM4T-LARGE                         | direct   | 2B   | 23.4 (24.0)      | (21.5)           |


## Interesting Parts/Challenges

### Aspects which eased Reproducibility:

- **Access to Models via HuggingFace**: Utilizing HuggingFace as a platform provides streamlined access to several key models used in this study, such as Whisper and SeamlessM4T. This not only facilitated reproducibility but also enhanced the efficiency of setting up experiments.
  
- **Documentation and Community Support**: The well-documented model cards and active community discussions around these models helped in understanding the nuances of each model's implementation and usage, which aided the debugging and fine-tuning processes.

- **Utilization of the Chameleon Testbed**: Employing the Chameleon testbed proved crucial for obtaining reproducible and reliable results due to its robust bare-metal configuration capabilities. This environment allowed precise control over computational resources, which is often a limitation in computational research.

### Challenges Faced:

- **Proprietary Models and Datasets**: We could only evaluate those models in the claim where models were open-sourced because of two core hurdles. Firstly, most of the authors have proprietary datasets that are not publicly available. Thus, even if they discuss the methodology of their study it is not possible to replicate the model architecture to generate exact results. Second, with the increasing complexity of these large multitask models, it is difficult to put in the computing resources required to train these models as intended even if the data is available. This is why we couldn't reproduce the results for the models AudioPaLM-2-8B-AST, XMEF-X, Maestro, and others.


- **Inconsistencies in Language Codes and Documentation**: We required language codes to access datasets and during model inference while specifying source and target language. We noticed that different papers and datasets specify different language codes, leading to non-uniformity. For example, authors of the Whisper model and CoVoST 2 dataset use ISO 639-1 two-letter language code, FLEURS dataset use BCP-47 codes with two-letter primary subtag and region subtag based on a two-letter country code from ISO 3166-1 alpha-2, NLLB model uses BCP-47 codes with two-letter primary subtag and script subtag based on a four-letter script code from ISO 15924 and Seamless model uses ISO 639-3 language codes. We also noticed that different dialects of the same language increase complexity when trying to establish cross-mapping or directly use a language name.
 There was also an instance in he SeamlessM4T paper where the authors initially listed ’nno’ and ’nob’ as Norwegian language codes, but later used ’nor’ for data statistics. After thorough verification, we later revealed that ’nob’ was actually used in the implementation.

- **Significant computation time**: We conducted our experiments on the Chameleon testbed on a single RTX 6000 GPU. When inferring models like Whisper-large-v2 for the FLEURS dataset, it took a significant amount of time around 72 hours to run the inference when we specified decoding strategy as beam search with a beam width of 5, selecting the best of 5.

- **Some Omissions by authors**: We noticed some deviation in results for the cascaded model WHISPER-MEDIUM (ASR) + NLLB-1.3B on FLEURS dataset, which could be due to the omission of some design choices made by the authors in the original study.

These aspects of the project highlighted both the potential and the limitations of current research practices in the field of AI, particularly in speech-to-text translation studies.


## Notebooks and Their Functions

1. `initiate_server.ipynb`: Setup the Chameleon environment and install necessary dependencies.
2. `covost2_eval.ipynb`: Runs inference using the pre-trained models and computes BLEU scores on the CoVoST 2 dataset.
3. `fleurs_eval.ipynb`: Runs inference using the pre-trained models and computes BLEU scores on the FLEURS dataset.
4. `analyze_results.ipynb`: Analyze the results and compare them against the original claims. You can also run this notebook without generating new data by running it from the section `Reproduced results summaries` to check for our results.

## References

[1] Loı̈c Barrault, Yu-An Chung, Mariano Cora Meglioli, David Dale, Ning Dong, Paul-Ambroise Duquenne, Hady Elsahar, Hongyu Gong, Kevin Heffernan, John Hoffman, and others. 2023. SeamlessM4T-Massively Multilingual & Multimodal Machine Translation. arXiv preprint arXiv:2308.11596 (2023).

[2] Alec Radford, Jong Wook Kim, Tao Xu, Greg Brockman, Christine Mcleavey, and Ilya Sutskever. 2023. Robust Speech Recognition via Large-Scale Weak Supervision. In Proceedings of the 40th International Conference on Machine Learning (Proceedings of Machine Learning Research), PMLR, 28492–28518. Retrieved from https://proceedings.mlr.press/v202/radford23a.html


[3] Kate Keahey, Jason Anderson, Zhuo Zhen, Pierre Riteau, Paul Ruth, Dan Stanzione, Mert Cevik, Jacob Colleran, Haryadi S. Gunawi, Cody Hammock, Joe Mambretti, Alexander Barnes, François Halbach, Alex Rocha, and Joe Stubbs. 2020. Lessons learned from the Chameleon testbed. In Proceedings of the 2020 USENIX Conference on Usenix Annual Technical Conference (USENIX ATC'20). USENIX Association, USA, Article 15, 219–233.

