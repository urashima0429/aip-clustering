FROM pytorch/pytorch:latest

# install Gurobi
WORKDIR /opt
COPY gurobi.lic /opt/gurobi/gurobi.lic

RUN apt-get update \ 
    && apt-get install -y wget \
    && wget https://packages.gurobi.com/11.0/gurobi11.0.0_linux64.tar.gz \
    && tar -xvf gurobi11.0.0_linux64.tar.gz \
    && rm gurobi11.0.0_linux64.tar.gz \
    && pip install gurobipy==11.0.0

ENV GUROBI_HOME /opt/gurobi1100/linux64
ENV PATH $PATH:$GUROBI_HOME/bin
ENV LD_LIBRARY_PATH $GUROBI_HOME/lib

WORKDIR /workspace
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=", "--port=8888"]

# docker build -t aip-clustering-image .
# docker run -it --gpus all --rm --name aip-clustering-container -p 8888:8888 --shm-size=8g -v ${PWD}/aip-clustering:/workspace/aip-clustering aip-clustering-image