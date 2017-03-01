FROM heroku/miniconda

# Grab requirements.txt.
ADD ./webapp/requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip install -qr /tmp/requirements.txt

# Add our code
ADD ./webapp /opt/webapp/
WORKDIR /opt/webapp

RUN conda install numpy
RUN conda install scipy
RUN conda install scikit-learn
RUN conda install pandas
RUN conda install matplotlib


CMD waitress-serve --port=$PORT flaskapp:app
