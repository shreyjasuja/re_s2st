
# Reproducing Speech-to-Text Translation Results

## About the authors and this work

This repository contains the code and methodology used to reproduce the results from the studies "SeamlessM4T: Massively Multilingual & Multimodal Machine Translation" and "Robust Speech Recognition via Large-Scale Weak Supervision". 

This work is carried out by **Shrey Jasuja** from NYU Tandon School of Engineering under the guidance of **Prof. Fraida Fund** as part of a reproducibility study in the field of speech-to-text translation using large multitask models.

## Chameleon Testbed and Trovi Artifacts

The research utilized the Chameleon testbed, which provides a bare-metal reconfiguration system, allowing detailed control over computational resources which is crucial for reproducibility studies. Chameleon's robust system aided in achieving consistent results across trials. Additionally, we used Trovi to share our research artifacts, ensuring that others in the research community can access and utilize our exact datasets, models, and configurations.

Here is the link to the trovi artifacts : 

## Summary of Results

Our findings are consistent with the published results, confirming the claims made in the original studies for most models. The results are demonstrated through BLEU scores and are detailed in the repository.

## Interesting Parts/Challenges

### Interesting Aspects:

- **Access to Models via HuggingFace**: Utilizing HuggingFace as a platform provided streamlined access to several key models used in this study, such as Whisper and SeamlessM4T. This not only facilitated the reproducibility but also enhanced the efficiency of setting up experiments.
  
- **Documentation and Community Support**: The well-documented model cards and active community discussions around these models helped in understanding the nuances of each model's implementation and usage, which significantly aided the debugging and fine-tuning processes.

- **Utilization of the Chameleon Testbed**: Employing the Chameleon testbed proved crucial for obtaining reproducible and reliable results due to its robust bare-metal configuration capabilities. This environment allowed precise control over computational resources, which is often a limitation in computational research.

### Challenges Faced:

- **Proprietary Models and Datasets**: Some models, such as AudioPaLM, and their associated datasets and checkpoints were not publicly available, which limited our ability to reproduce certain results. This issue highlights the ongoing challenge in scientific research where access to proprietary tools can impede the validation and extension of published findings.

- **Inconsistencies in Language Codes and Documentation**: Encountering various systems of language coding (e.g., ISO 639-1, BCP-47, ISO 639-3) across different datasets and papers led to complications in data processing. This non-uniformity required additional steps to ensure correct mappings and integrations, which was time-consuming and error-prone.

- **Computational Resource Constraints**: While Chameleon provides excellent control over resources, the sheer computational demand of training and evaluating large-scale models on extensive multilingual datasets meant that experiments were both time and resource-intensive. Despite using robust computational resources, the duration and cost of running these models were significant, reflecting a common barrier in replicating large-scale AI research.

- **Decoding Strategies Not Specified**: Some deviations in reproduced results could be traced back to unspecified decoding strategies in the original studies. These omissions made it challenging to align our setup perfectly with the original experiments, affecting the accuracy of the replication.

These aspects of the project highlighted both the potential and the limitations of current research practices in the field of AI, particularly in speech-to-text translation studies.


## Notebooks and Their Functions

1. `initiate_server.ipynb`: Set up the Chameleon environment and install necessary dependencies.
2. `covost2_eval.ipynb`: Code to run inference from different models over the CoVoST2 dataset and reproduce the results.
3. `fleurs_eval.ipynb`: Contains the code to run inference using the pre-trained models and compute BLEU scores on the FLEURS dataset.
4. `analyze_results.ipynb`: Analyze the results and compare them against the original claims.

## References

Please refer to the `References` section in the repository for a comprehensive list of all sources and citations used in this study.

- [SeamlessM4T: Massively Multilingual & Multimodal Machine Translation](https://arxiv.org/abs/2308.11596)
- [Robust Speech Recognition via Large-Scale Weak Supervision](https://arxiv.org/abs/2212.04356)
- [Lessons learned from the Chameleon testbed](https://dl.acm.org/doi/abs/10.5555/3489146.3489161)

