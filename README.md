
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
- The ease of access to open-sourced models on platforms like HuggingFace significantly streamlined the replication process.
- The detailed appendices and community-shared resources on GitHub facilitated accurate replication of the claimed results.

### Challenges Faced:
- The unavailability of some models and their corresponding datasets posed significant challenges in replication.
- Inconsistencies in language codes across different papers and datasets introduced complexities in data handling.

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

