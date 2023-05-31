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

- ex. `vicuna-13b`
- For inspiration, see [this](https://modal.com/docs/guide/slack-finetune)

Can de done on a single A-100GPU with 20GB memory for ~7B-scale models.

### + Reinforcement learning with Human Feedback (RLHF)

Approach: Ask humans to discriminate (rank) options.
Result is Chat (instruct)-models that are much better at "doing what you want".

- ChatGPT (`gpt-4`, `gpt-3.5-turbo`)
- [Claude](https://www.anthropic.com/product) etc.

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
Some great examples can be found here:

- [OpenAI Cookbook](https://github.com/openai/openai-cookbook)
- [guidance](https://github.com/microsoft/guidance)

### Mode 2 - Giving long-term memory 🧠

Rule-of-thumb: Models have perfect short-term memory, but long-term memory is blurry.
It is your task to give the necessary context to the model!

- [NPD-application](https://npd.fabriqai.com/)
- https://www.chatbase.co/chatbot/w77ULIXQDoPQTc7BZU4_K
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

## Some recommendations (from Karpathy's talk)

### Goal 1: Achieve your top possible performance 

- Use GPT-4 
- Use prompts with detailed task context, relevant information, instructions 
- "what would you tell a task contactor if they can't email you back?" 
- Retrieve and add any relevant context or information to the prompt 
- Experiment with prompt engineering techniques (previous slides) 
- Experiment with few-shot examples that are 
  - a. relevant to the test case
  - b. diverse (if appropriate) 
- Experiment with tools/plugins to offload tasks difficult for LLMs (calculator, code execution, ... ) 
- Spend quality time optimizing a pipeline/ "chain" 
- If you feel confident that you maxed out prompting, consider SFT data collection + finetuning 
- Expert/ fragile/ research zone: consider RM data collection, RLHF finetuning 

### Goal 2: Optimize costs 

- Once you have the top possible performance, attempt cost saving measures 
(e.g. use GPT-3.5, find shorter prompts, etc.)

#### Comments from me:

- If privacy is a concern, use Azure OpenAI service.
- For simple tasks, `gpt-3.5-turbo` is often good enough and much faster.
- Monitor progress of smaller and Open Source-models
  - My bold prediction is that before we see 2024, you will be able to run models comparable to `gpt-3.5-turbo` on a CPU.
- Build modular stuff, so you can reuse it when you upgrade models, data etc.
- Remember that gettting acquainted with the tools and the ecosystem takes time.
- Start exploring, there is no doubt that learning this will be valuable in the future.

## Requirements

If you want to run the notebooks. Youk will need an (Azure) OpenAI API key.
Create your preferred virtual environment (`python 3.10`) with venv, conda, pipenv, etc. and install the requirements:

```bash
pip install -r requirements.txt
```
