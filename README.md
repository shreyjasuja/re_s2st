
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

Our findings are consistent with the published results, confirming the claims made in the original studies for most models. The results are demonstrated through BLEU scores and are detailed in the repository. Here is a glimpse of one of the reproduced claims. Note, that the values in the parenthesis are the values from the original claim in the paper.

| Model              | size | FLEURS X→eng (n=81) | CoVoST 2 X→eng (n=21) |
|--------------------|------|--------------------:|----------------------:|
| XLS-R-2B-S2T       | 2.6B |                  () |           22.1 (22.1) |
| WHISPER-LARGE-v2   | 1.5B |         16.7 (17.9) |           29.2 (29.1) |
| AUDIOPaLM-2-8B-AST | 8.0B |              (19.7) |                (37.8) |
| SEAMLESSM4T-MEDIUM | 1.2B |         20.3 (20.9) |           31.3 (29.8) |
| SEAMLESSM4T-LARGE  | 2.3B |         23.4 (24.0) |           34.3 (34.1) |

## Interesting Parts/Challenges

### Aspects which eased Reproducibility:

- **Access to Models via HuggingFace**: Utilizing HuggingFace as a platform provides streamlined access to several key models used in this study, such as Whisper and SeamlessM4T. This not only facilitated reproducibility but also enhanced the efficiency of setting up experiments.
  
- **Documentation and Community Support**: The well-documented model cards and active community discussions around these models helped in understanding the nuances of each model's implementation and usage, which aided the debugging and fine-tuning processes.

- **Utilization of the Chameleon Testbed**: Employing the Chameleon testbed proved crucial for obtaining reproducible and reliable results due to its robust bare-metal configuration capabilities. This environment allowed precise control over computational resources, which is often a limitation in computational research.

### Challenges Faced:

- **Proprietary Models and Datasets**: Some models, such as AudioPaLM, and their associated datasets and checkpoints were not publicly available, which limited our ability to reproduce certain results. This issue highlights the ongoing challenge in scientific research where access to proprietary tools can impede the validation and extension of published findings.

- **Inconsistencies in Language Codes and Documentation**: Encountering various systems of language coding (e.g., ISO 639-1, BCP-47, ISO 639-3) across different datasets and papers led to complications in data processing. This non-uniformity required additional steps to ensure correct mappings and integrations, which was time-consuming and error-prone.

- **Computational Resource Constraints**: While Chameleon provides excellent control over resources, the sheer computational demand of training and evaluating large-scale models on extensive multilingual datasets meant that experiments were both time and resource-intensive. Despite using robust computational resources, the duration and cost of running these models were significant, reflecting a common barrier in replicating large-scale AI research.

- **Decoding Strategies Not Specified**: Some deviations in reproduced results could be traced back to unspecified decoding strategies in the original studies. These omissions made it challenging to align our setup perfectly with the original experiments, affecting the accuracy of the replication.

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

