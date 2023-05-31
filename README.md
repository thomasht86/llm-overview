# LLM's - An overview for developers
Keeping up with the latest progress in AI is hard. 
This is my attempt to create an overview that may serve as an introduction to those getting started with using LLM's to create your own applications. 

## Introduction

## Model types
![GPT Training](https://github.com/thomasht86/llm-meetup/assets/24563696/e7a6fc7e-dc72-4dce-852a-59ac31936708)

### Base models
	- text-davinci-003 etc
	- Llama
#### + SFT 
  - ex. Vicuna-13B
#### + RLHF
Chat (instruct) - models
	- ChatGPT ("gpt-4", "gpt-3.5-turbo")
	- Claude etc.
	

## Modes
I find it useful to think about separate modes for the models. 
### Mode 1A - "Out of the box" 💬
	- Prompting
		○ Act as expert
	- System 1 -> System 2
		○ Think step-by-step
		○ CoT - ToT etc.
### Mode 1B - Interacting via API's 👩‍💻

### Mode 2 - Giving long-term memory 🧠
	- Combining with search/retrieval
	- Vector DB + Embedding
	- Interface to Structured data

### Mode 3 - CoPilots/Agents - Using tools 🔧
	- Search the web
	- Running code
  
Plugin/integrations ecosystem![image](https://github.com/thomasht86/llm-meetup/assets/24563696/ad836bbd-87df-4877-b54b-3eb8333e96e5)



## Requirements
Create your preferred virtual environment (`python 3.10`) with venv, conda, pipenv, etc. and install the requirements:
```bash
pip install -r requirements.txt
```
