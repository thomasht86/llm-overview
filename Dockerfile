FROM jupyter/scipy-notebook:latest

USER root

USER $NB_UID


WORKDIR /llm

COPY requirements.txt .
RUN pip install -U pip && pip install -r requirements.txt

# Add any additional dependencies or commands for your service here
#CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]
CMD ["jupyter", "lab", "--ip=0.0.0.0"]
