# LLM's - An overview for developers

Keeping up with the latest progress in AI is hard.
This is my attempt to create an overview that may serve as an introduction to those getting started with using LLM's to create your own applications.

## Introduction

This is a work in progress, and the links provided are the best resources to my limited knowledge.
Links may break, become outdated and new stuff that I have missed may have been released.

## Model types

The image below is stolen from Andrey Karpathy's amazing talk - [State of GPT](https://www.youtube.com/watch?v=bZQun8Y4L2A) at MS Build 2023.
I strongly encourage you to watch it.

![GPT Training](https://github.com/thomasht86/llm-meetup/assets/24563696/e7a6fc7e-dc72-4dce-852a-59ac31936708)

### Model overview

- "Open source" models
  - https://huggingface.co/spaces/HuggingFaceH4/open_llm_leaderboard
- OpenAI models
  - https://platform.openai.com/docs/models/overview

### Base models

- `text-davinci-003`
- `openlm-research/open_llama_7b_700bt_preview`
- etc.
  
### + Supervised Finetuning (SFT)

Finetune on examples of (prompt, responses).

This is "doable" in an enterprise setting, with reasonable effort.

- ex. Vicuna-13B
- For inspiration, see [this](https://modal.com/docs/guide/slack-finetune)

Can de done on a single A-100GPU with 20GB memory for ~7B-scale models.

### + Reinforcement learning with Human Feedback (RLHF)

Approach: Ask humans to discriminate (rank) options.
Result is Chat (instruct)-models that are much better at "doing what you want".

- ChatGPT ("gpt-4", "gpt-3.5-turbo")
- Claude etc.

### Some notes on scale

There are many ongoing initiatives to reduce computational requirements.
Some of the approaches:

- https://huggingface.co/docs/peft/index
- [QLoRA](https://arxiv.org/abs/2305.14314)
- https://github.com/ggerganov/llama.cpp
- https://gpt4all.io/index.html

## Modes

I find it useful to distinguish between different modes of using LLM's.

### Mode 1A - "Out of the box" 💬

When you're using [chat.openai.com/chat](chat.openai.com/chat)
NB! `gpt-4` is significantly better than `gpt-3.5-turbo` for reasoning and complex stuff.

- Prompting
  - Act as expert
  - System 1 -> System 2
    - Think step-by-step
    - [Chain-of-thought](https://arxiv.org/abs/2201.11903) - [Tree-of-Thought](https://arxiv.org/abs/2305.08291) etc.
  
### Mode 1B - Interacting via API's 👩‍💻

This gives more control.
Some great examples can be found in [guidance](https://github.com/microsoft/guidance)-repo.

### Mode 2 - Giving long-term memory 🧠

Rule-of-thumb: Models have perfect short-term memory, but long-term memory is blurry.
It is your task to give the necessary context to the model!

- [Demo application](https://npd.fabriqai.com/)
- Combining with search/retrieval
- Vector DB + Embeddings
  - [pinecone](https://www.pinecone.io/)
  - [weaviate](https://weaviate.io/)
  - etc.
  - NB: Enables search across different modalities, e.g. text, images, audio, etc.

- Retrieval of structured data
  - [Ask4data](https://databutton.com/v/3po3yed0)

### Mode 3 - CoPilots/Agents - Using tools 🔧

- Search the web
- Running code
- Calling API's
- Plugin/integrations ecosystem
  - [OpenAI plugins](https://platform.openai.com/docs/plugins/introduction)
  - [langchain](https://docs.langchain.com/docs/)
  - [llamaindex](https://gpt-index.readthedocs.io/en/latest/index.html)

## Requirements

If you want to run the notebooks. Youk will need an (Azure) OpenAI API key.
Create your preferred virtual environment (`python 3.10`) with venv, conda, pipenv, etc. and install the requirements:

```bash
pip install -r requirements.txt
```
